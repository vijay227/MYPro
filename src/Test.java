/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.*;

public class Test {

    public static void main(String args[]) {
        try {
            String word[];
            String f1_line, f2_line, f, p;
            int count = 0;
            BufferedReader br = new BufferedReader(new FileReader("D:\\Lars\\PosNeg\\pos.txt"));
            BufferedReader br1 = new BufferedReader(new FileReader("D:\\Lars\\foodpos.txt"));
            while ((f1_line = br.readLine()) != null) {
                while ((f2_line = br1.readLine()) != null) {
                    String[] str1 = f1_line.split(" ");
                    String[] str2 = f2_line.split(" ");
                    for (int i = 0; i < str1.length; i++) {
                        for (int j = 0; j < str2.length; j++) {
                            if (str1[i].equals(str2[j])) {
                                count++;
                            }
                        }
                    }
                }
            }
            System.out.println(count);
        } catch (Exception er) {
            System.out.println(er);
        }
    }
}
