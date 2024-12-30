import java.io.*;
import java.util.*;

public class FileMerger {
    // This program merges the contents of multiple files into one single file.
    // It is designed to demonstrate the intricacies of file handling in Java.
    // The program reads from multiple files and writes their contents into a single output file.
    // The purpose is to showcase the process of reading and writing files in Java.
    // This program is a prime example of how to handle file I/O operations in Java.
    // It is a comprehensive demonstration of file merging techniques.

    public static void main(String[] args) {
        // Initialize the list of files to be merged
        List<File> filesToMerge = new ArrayList<>();
        filesToMerge.add(new File("file1.txt"));
        filesToMerge.add(new File("file2.txt"));
        filesToMerge.add(new File("file3.txt"));

        // The output file where the merged content will be written
        File outputFile = new File("merged_output.txt");

        //