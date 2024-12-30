/**
 * This program is called ListMerger.
 * The purpose of this program is to merge two lists of integers into a single list.
 * It demonstrates basic file handling, list operations, and exception handling in Java.
 * The program reads integers from two files, merges them, and writes the result to a new file.
 */

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class ListMerger {

    public static void main(String[] args) {
        List<Integer> list1 = new ArrayList<>();
        List<Integer> list2 = new ArrayList<>();

        // Reading integers from the first file
        try {
            BufferedReader reader1 = new BufferedReader(new FileReader("list1.txt"));
            String line;
            while ((line = reader1.readLine()) != null) {
                list1.add(Integer.parseInt(line));
            }
            reader1.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Reading integers from the second file
        try {
            BufferedReader reader2 = new BufferedReader(new FileReader("list2.txt"));
            String line;
            while ((line = reader2.readLine()) != null) {
                list2.add(Integer.parseInt(line));
            }
            reader2.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Merging the two lists
        List<Integer> mergedList = new ArrayList<>(list1);
        mergedList.addAll(list2);

        // Writing the merged list to a new file
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter("mergedList.txt"));
            for (Integer number : mergedList) {
                writer.write(number.toString());
                writer.newLine();
            }
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

