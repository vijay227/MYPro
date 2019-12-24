/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sentiment;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;

/**
 *
 * @author AnushriSathe
 */
public class MainClass{
    public static void main(String args[]) throws FileNotFoundException
    {
     // System.out.println("file called :" +path);
        BufferedReader br = new BufferedReader(new FileReader("E:\\Lars\\Anjali Hotel.txt"));
        try{
            String line="",str="";
         while((line = br.readLine()) != null)
         {
             str=line;
        Tocken tk = new Tocken();
        tk.tocken(str);
        SentenceSeperator sep = new SentenceSeperator();
        sep.seperate(str);
        Classification cl = new Classification();
        cl.classify(str);
        SentimentAnalysis st = new SentimentAnalysis();
        st.sentiment(str);
         }
        }
        catch(Exception ex)
        {            
        }
    }
}
