/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sentiment;

import java.io.FileInputStream;
import java.io.InputStream;
import opennlp.tools.sentdetect.SentenceDetectorME;
import opennlp.tools.sentdetect.SentenceModel;

/**
 *
 * @author AnushriSathe
 */
public class SentenceSeperator {
  String sentensedetect = "";
          
    public String  seperate(String str) {
        String str1 = str;
        try {
            String paragraph = str1;
            InputStream is = new FileInputStream("E:\\Mongo\\en-sent.zip");
            SentenceModel model2 = new SentenceModel(is);
            SentenceDetectorME sdetector = new SentenceDetectorME(model2);
            String sentences[] = sdetector.sentDetect(paragraph);
            is.close();

            for (int i = 0; i < sentences.length; i++) {

                sentensedetect += sentences[i] + "\n";

            }

            System.out.println(sentensedetect + "\n");
            String str11 = "Sentence saperated Successfully";
            java.io.FileWriter fw = new java.io.FileWriter("E:\\Lars\\sensep.txt");
            fw.write(sentensedetect.toString());
            fw.close();
        } catch (Exception ex) {

        }
        return this.sentensedetect;
    }
}
