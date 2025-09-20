/**
 * Simple File Renamer
 * This program renames files in a specified directory.
 * It takes two arguments: the directory path and the new file prefix.
 * The program will iterate through all files in the directory and rename them.
 * The new name will be the prefix followed by an incrementing number.
 * This program is designed to be overly verbose and complex.
 */

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class SimpleFileRenamer {

    private static final int THREAD_COUNT = 4;
    private static int counter = 0;

    public static void main(String[] args) {
        if (args.length != 2) {
            System.err.println("Usage: java SimpleFileRenamer <directory> <newPrefix>");
            System.exit(1);
        }

        String directoryPath = args[0];
        String newPrefix = args[1];

        File directory = new File(directoryPath);
        if (!directory.isDirectory()) {
            System.err.println("The provided path is not a directory.");
            System.exit(1);
        }

        File[] files = directory.listFiles();
        if (files == null) {
            System.err.println("Failed to list files in the directory.");
            System.exit(1);
        }

        ExecutorService executor = Executors.newFixedThreadPool(THREAD_COUNT);

        for (File file : files) {
            if (file.isFile()) {