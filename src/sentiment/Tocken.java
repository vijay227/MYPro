/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sentiment;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import opennlp.tools.sentdetect.SentenceDetectorME;
import opennlp.tools.sentdetect.SentenceModel;
import opennlp.tools.tokenize.Tokenizer;
import opennlp.tools.tokenize.TokenizerME;
import opennlp.tools.tokenize.TokenizerModel;

/**
 *
 * @author AnushriSathe
 */
public class Tocken {
    String Tokensentense = "";
            
    public String tocken(String str)
                {
    try {
String str1=str;
            String singleword[] = str1.split(" ");

            InputStream is = new FileInputStream("E:\\Mongo\\en-sent.zip");
            SentenceModel model2 = new SentenceModel(is);
            SentenceDetectorME sdetector = new SentenceDetectorME(model2);
            String sentences[] = sdetector.sentDetect(str1);

            String sentensedetect = "";
            is.close();
            for (int i = 0; i < sentences.length; i++) {
                InputStream is2 = null;
                try {
                    // System.out.println(sentences[i].toString());
                    sentensedetect += sentences[i] + "\n";
                    is2 = new FileInputStream("E:\\Mongo\\en-token.zip");
                    TokenizerModel model = new TokenizerModel(is2);
                    Tokenizer tokenizer = new TokenizerME(model);
                    String tokens[] = tokenizer.tokenize(sentences[i]);
                    for (String a : tokens) {
                        Tokensentense += a + "|";
                    }   is2.close();
                } catch (FileNotFoundException ex) {
                    Logger.getLogger(Tocken.class.getName()).log(Level.SEVERE, null, ex);
                } finally {
                    try {
                        is2.close();
                    } catch (IOException ex) {
                        Logger.getLogger(Tocken.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
            System.out.println(Tokensentense.toString());
         java.io.FileWriter fw=new java.io.FileWriter("E:\\demoapp\\tokens.txt");
         fw.write(Tokensentense.toString());
         fw.close();
        } catch (Exception ex) {

        }
    return this.Tokensentense;
    }
}
