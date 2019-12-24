/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sentiment;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.InputStream;
import opennlp.tools.sentdetect.SentenceDetectorME;
import opennlp.tools.sentdetect.SentenceModel;
import opennlp.tools.tokenize.Tokenizer;
import opennlp.tools.tokenize.TokenizerME;
import opennlp.tools.tokenize.TokenizerModel;

/**
 *
 * @author AnushriSathe
 */
public class Classification {
    public void classify(String str)
    {
         try {
             String str1 = str;
            String paragraph = str1;
            

            InputStream is = new FileInputStream("E:\\Mongo\\en-sent.zip");
            SentenceModel model2 = new SentenceModel(is);
            SentenceDetectorME sdetector = new SentenceDetectorME(model2);
            String sentences[] = sdetector.sentDetect(paragraph);

            String sentensedetect = "";
            String Negativesentence = "";
            String Postivesentence = "";
            is.close();
            int cnt = 0;
            for (int i = 0; i < sentences.length; i++) {

                sentensedetect += sentences[i] + "\n";
                cnt = 0;
                InputStream is2 = new FileInputStream("E:\\Mongo\\en-token.zip");

                TokenizerModel model = new TokenizerModel(is2);

                Tokenizer tokenizer = new TokenizerME(model);

                String tokens[] = tokenizer.tokenize(sentences[i]);

                String para;
                for (String a : tokens) {

                    BufferedReader br = new BufferedReader(new FileReader("E:\\Mongo\\negative.txt"));
                    while ((para = br.readLine()) != null) {
                        if (a.trim().equals(para.trim())) {
                            cnt++;

                        }
                    }
                }

                if (cnt == 0) {
                    Postivesentence += sentences[i] + "\n";

                } else {
                    Negativesentence += sentences[i] + "\n";
                }

                is2.close();

            }
         
            System.out.println("Sentence Classified Successfully");
            
        } catch (Exception ex) {

        }
    }
}
