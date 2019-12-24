/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sentiment;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.StringReader;
import javax.swing.JOptionPane;
import opennlp.tools.cmdline.PerformanceMonitor;
import opennlp.tools.cmdline.postag.POSModelLoader;
import opennlp.tools.postag.POSModel;
import opennlp.tools.postag.POSSample;
import opennlp.tools.postag.POSTaggerME;
import opennlp.tools.sentdetect.SentenceDetectorME;
import opennlp.tools.sentdetect.SentenceModel;
import opennlp.tools.tokenize.Tokenizer;
import opennlp.tools.tokenize.TokenizerME;
import opennlp.tools.tokenize.TokenizerModel;
import opennlp.tools.tokenize.WhitespaceTokenizer;
import opennlp.tools.util.ObjectStream;
import opennlp.tools.util.PlainTextByLineStream;


public class SentimentAnalysis {
    public void sentiment(String strt)
    {
        try {
            
            String paragraph = strt;
            
            BufferedWriter br1 = new BufferedWriter(new FileWriter("E:\\Lars\\PosNeg\\neg.txt"));
            BufferedWriter br2 = new BufferedWriter(new FileWriter("E:\\Lars\\PosNeg\\pos.txt"));
            InputStream is = new FileInputStream("E:\\Mongo\\en-sent.zip");
            SentenceModel model2 = new SentenceModel(is);
            SentenceDetectorME sdetector = new SentenceDetectorME(model2);

            String sentences[] = sdetector.sentDetect(paragraph);

            String sentensedetect = "";
            String Tokensentense = "";
            String Negativesentence = "";
            String Postivesentence = "";
            String postoken = "";
            is.close();
            int cnt = 0;
            int cnt2 = 0;
            int polarity = 0;
            int sentencepolarityscore = 0;
            int documentpolarityscore = 0;
            int positivecount = 0, negativecount = 0;
            
            for (int i = 0; i < sentences.length; i++) {
                sentensedetect += sentences[i] + "\n";
                cnt = 0;
                cnt2 = 0;
                sentencepolarityscore = 0;
                POSModel model = new POSModelLoader().load(new File("E:\\Mongo\\en-pos-maxent.zip"));
                PerformanceMonitor perfMon = new PerformanceMonitor(System.err, "sent");
                POSTaggerME tagger = new POSTaggerME(model);

                String input = sentences[i];
                ObjectStream<String> lineStream = new PlainTextByLineStream(
                        new StringReader(input));

                perfMon.start();
                String line;
                while ((line = lineStream.read()) != null) {

                    String whitespaceTokenizerLine[] = WhitespaceTokenizer.INSTANCE
                            .tokenize(line);
                    String[] tags = tagger.tag(whitespaceTokenizerLine);

                    POSSample sample = new POSSample(whitespaceTokenizerLine, tags);

                    String str = sample.toString();
                    postoken = str;

                    Tokensentense += str + ". \n";

                    perfMon.incrementCounter();
                }
                perfMon.stopAndPrintFinalResult();

                String[] tokens = postoken.split(" ");
                String para;
                for (String a : tokens) {

                    String word = a;
                    String[] adverb = word.split("_");
                    String adv = adverb[0].toString();
                    if (adv.endsWith("but")) {
                        cnt = 0;
                        cnt2 = 0;
                    }

                    if (a.contains("RB")) {

                        BufferedReader br = new BufferedReader(new FileReader("E:\\Lars\\negative.txt"));
                        while ((para = br.readLine()) != null) {
                            String[] negword = para.split(" ");
                            String negativeword = negword[0];
                            //System.out.println(negativeword);
                            String negativeword2 = negword[1];
                            polarity = Integer.parseInt(negativeword2.trim());
                            if (adv.trim().equalsIgnoreCase(negativeword.trim())) {
                                if (polarity < 0) {
                                    cnt2++;
                                }
                                sentencepolarityscore += polarity;
                            }

                        }
                    } else if (!a.contains("NN") || !a.contains("NNP") || !a.contains("NNS") || !a.contains("NNPS")
                            || !a.contains("PRP") || !a.contains("PRP$") || !a.contains("CC")
                            || !a.contains("CD") || !a.contains("DT") || !a.contains("IN") || !a.contains("TO")) {

                        InputStream is3 = new FileInputStream("E:\\Mongo\\en-token.zip");

                        TokenizerModel model3 = new TokenizerModel(is3);

                        Tokenizer tokenizer3 = new TokenizerME(model3);

                        String tokens3[] = tokenizer3.tokenize(adv);
                        adv = tokens3[0].toString();
                        System.out.println(adv.trim());
                        BufferedReader br = new BufferedReader(new FileReader("E:\\Lars\\negative.txt"));
                        while ((para = br.readLine()) != null) {

                            String[] negword = para.split(" ");
                            String negativeword = negword[0];
                          //  System.out.println(negativeword);
                            String negativeword2 = negword[1];
                            polarity = Integer.parseInt(negativeword2.trim());
                            if (adv.trim().equalsIgnoreCase(negativeword.trim())) {
                                if (polarity < 0) {
                                    cnt++;
                                }
                                sentencepolarityscore += polarity;
                            }

                        }
                    }

                }
                documentpolarityscore += sentencepolarityscore;

                if (cnt == 0 && cnt2 == 0) {
                    Postivesentence += sentences[i] +" ";
                    positivecount++;
                   // br1.write(Postivesentence.toString());
                    
                } else if (cnt != 0 && cnt2 != 0) {
                    Postivesentence += sentences[i] + " ";
                    positivecount++;
                   
                    
                } else {
                    Negativesentence += sentences[i] + " ";
                    negativecount++;
                    
                }

            }

            System.out.println("Document polarity" + documentpolarityscore);
           // System.out.println("negative sentese" + Negativesentence);
          br2.write(Postivesentence.toString()+" ");
         
          br1.write(Negativesentence.toString()+" ");
           
            if (documentpolarityscore < 0) {
               
                System.out.println("document polarity is negative");

            } else {
               
                System.out.println("Document polarity is positive");
            }

            String str = " Sentence Classified Successfully";
            //JOptionPane.showMessageDialog(null, str);
            br1.close();
            br2.close();

        } catch (Exception ex) {
System.out.println(ex);
        }
        
    }
    
}
