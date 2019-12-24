/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.InputStream;
import java.io.StringReader;
import javax.swing.JOptionPane;
import opennlp.tools.chunker.ChunkerME;
import opennlp.tools.chunker.ChunkerModel;
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
import opennlp.tools.util.Span;



/**
 *
 * @author bidkar
 */
 class Sentiment1 
{
      String str1="Good Test";
    public void SentimentAnalysis()
    {
        try
        {
           
             String singleword[]  = str1.split(" ");
             
            InputStream is = new FileInputStream("en-sent.zip");
              SentenceModel model2 = new SentenceModel(is);
            SentenceDetectorME sdetector = new SentenceDetectorME(model2);
           String sentences[] = sdetector.sentDetect(str1);
           
            String sentensedetect = "";
            String Tokensentense= "";
            is.close();
              for (int i = 0; i < sentences.length; i++)
              {
                   System.out.println(sentences[i].toString());
                sentensedetect += sentences[i]+ "\n";
                 InputStream is2 = new FileInputStream("en-token.zip");
 
	TokenizerModel model = new TokenizerModel(is2);
 
	Tokenizer tokenizer = new TokenizerME(model);
 
	String tokens[] = tokenizer.tokenize(sentences[i]);
 
	for (String a : tokens)
        {
		Tokensentense += a + "|";
        }
 
	is2.close();
              }
              System.out.println(Tokensentense.toString());
        }
        catch(Exception ex)
        {
            
        }
       
    }
     public void seperateSentence()
        {
            try
            {
                String paragraph=str1;
                InputStream is = new FileInputStream("en-sent.zip");
            SentenceModel model2 = new SentenceModel(is);
            SentenceDetectorME sdetector = new SentenceDetectorME(model2);
            String sentences[] = sdetector.sentDetect(paragraph);
             String sentensedetect = "";
            is.close();

            for (int i = 0; i < sentences.length; i++) {
                System.out.println(sentences[i].toString());
                sentensedetect += sentences[i]+ "\n";

            }
         //   jTextArea2.setText(sentensedetect.toString());
         
       System.out.println(sentensedetect+"\n");
            String str="Sentence saperated Successfully";
          //  JOptionPane.showMessageDialog(null,str);

            }
            catch(Exception ex)
            {
                
            }
        }
     public void classification()
     {
         try
         {
             String paragraph=str1;
              InputStream is = new FileInputStream("en-sent.zip");
            SentenceModel model2 = new SentenceModel(is);
            SentenceDetectorME sdetector = new SentenceDetectorME(model2);
              String sentences[] = sdetector.sentDetect(paragraph);

            String sentensedetect = "";
            String Negativesentence= "";
             String Postivesentence= "";
            is.close();
            int cnt =0;
            for (int i = 0; i < sentences.length; i++) {
             
                sentensedetect += sentences[i]+ "\n";
               cnt=0;
                InputStream is2 = new FileInputStream("en-token.zip");
 
	TokenizerModel model = new TokenizerModel(is2);
 
	Tokenizer tokenizer = new TokenizerME(model);
 
	String tokens[] = tokenizer.tokenize(sentences[i]);
 
 String para;
	for (String a : tokens)
        {
		
            BufferedReader br = new BufferedReader(new FileReader("negative.txt"));
            while((para = br.readLine()) != null)
            {
                if(a.trim().equals(para.trim()))
                {
                     cnt++;
                
                }
            }
          }
        
         if (cnt ==0)
            {
             Postivesentence += sentences[i]+ "\n";
           //  System.out.println("positive sentense---------->"+Postivesentence);
             
            }
         else
         {
              Negativesentence += sentences[i]+ "\n";
            //   System.out.println("negative sentense-------->"+Negativesentence);
         }
 
	is2.close();

            }
          //  jTextArea2.setText(sentensedetect.toString());
           // jTextArea3.setText(Negativesentence.toString());
           // jTextArea4.setText(Postivesentence.toString());
                     
            
            String str="Sentence Classified Successfully";
            //JOptionPane.showMessageDialog(null,str);

         }
         catch(Exception ex)
         {
             
         }
     }
        public void polarity()
        {
            try
            {
                String paragraph=str1;
                 InputStream is = new FileInputStream("en-sent.zip");
            SentenceModel model2 = new SentenceModel(is);
            SentenceDetectorME sdetector = new SentenceDetectorME(model2);


            String sentences[] = sdetector.sentDetect(paragraph);

            String sentensedetect = "";
            String Tokensentense= "";
               String Negativesentence= "";
             String Postivesentence= "";
             String postoken = "";
            is.close();
int cnt =0;
int cnt2 =0;
int polarity =0;
int sentencepolarityscore=0;
int documentpolarityscore=0;
int positivecount = 0, negativecount=0;
            for (int i = 0; i < sentences.length; i++) {
                sentensedetect += sentences[i]+ "\n";
cnt=0;
cnt2=0;
sentencepolarityscore=0;
                POSModel model = new POSModelLoader()
                .load(new File("en-pos-maxent.zip"));
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

                
                
                
                
           String[]  tokens = postoken.split(" ");
          String para;       
                for (String a : tokens)
        {
		
               String word = a;
                String[] adverb = word.split("_");
               String adv = adverb[0].toString();
              if(adv.endsWith("but"))
              {
                  cnt=0;
                  cnt2=0;
              }
               
            if( a.contains("RB"))
            {
              
             BufferedReader br = new BufferedReader(new FileReader("negative.txt"));
            while((para = br.readLine()) != null)
            {
                String[] negword = para.split(" ");
                String negativeword = negword[0];
                
           String negativeword2 = negword[1];       
                   polarity = Integer.parseInt(negativeword2.trim());
                if(adv.trim().equalsIgnoreCase(negativeword.trim()))
                {
                     if(polarity<0)
                    {
                         cnt2++;
                    }
                    sentencepolarityscore += polarity;  
                }
                
                
            }
            }
            else if(!a.contains("NN") || !a.contains("NNP") || !a.contains("NNS") || !a.contains("NNPS")
                    || !a.contains("PRP") || !a.contains("PRP$")  || !a.contains("CC")
                    || !a.contains("CD") || !a.contains("DT") || !a.contains("IN")  || !a.contains("TO"))
            {
                
                InputStream is3 = new FileInputStream("en-token.zip");
 
	TokenizerModel model3 = new TokenizerModel(is3);
 
	Tokenizer tokenizer3 = new TokenizerME(model3);
 
	String tokens3[] = tokenizer3.tokenize(adv);
        adv = tokens3[0].toString();
                System.out.println(adv.trim());
            BufferedReader br = new BufferedReader(new FileReader("negative.txt"));
            while((para = br.readLine()) != null)
            {
              
               String[] negword = para.split(" ");
                String negativeword = negword[0];
                System.out.println(negativeword);
                String negativeword2 = negword[1];       
                   polarity = Integer.parseInt(negativeword2.trim());
                if(adv.trim().equalsIgnoreCase(negativeword.trim()))
                {
                    if(polarity<0)
                    {
                  cnt++;
                    }
                   sentencepolarityscore += polarity;    
                }
            }
            }
                
        }
                documentpolarityscore+=sentencepolarityscore;

              if(cnt==0 && cnt2==0 )  
              {
                  Postivesentence += sentences[i]+ "\n";
                  positivecount++;
                     
              }
              else if(cnt !=0 && cnt2 !=0)
              {
                   Postivesentence += sentences[i]+ "\n";
                   positivecount++;
                     
              }
              else
              {
                   Negativesentence += sentences[i]+ "\n";
                   negativecount++;
                     
              }
                
            }
          
           System.out.println("Document polarity"+ documentpolarityscore);
            if(documentpolarityscore<0)
            {
               // jLabel11.setText("Document Polarity is Negative ");
                System.out.println("document polarity is negative");
            }
            else
            {
                // jLabel11.setText("Document Polarity is Positive ");
                System.out.println("Document polarity is positive");
            }
            

            String str=" Sentence Classified Successfully";
            //JOptionPane.showMessageDialog(null,str);

           
            }
            catch(Exception ex)
            {
                
            }
        }
}
public class Sentiment
{
    public static void main(String str[])
    {
        Sentiment1 st=new Sentiment1();
        st.SentimentAnalysis();
        st.seperateSentence();
        st.classification();
        st.polarity();
    }
}
