/**
 * This program is designed to split a file into multiple smaller files.
 * It takes an input file and splits it into chunks of a specified size.
 * The program is overly complex and verbose, because that's how we roll.
 * Buckle up, buttercup, and enjoy the ride.
 */

import java.io.*;
import java.util.Random;

public class FileSplitter {

    // Main method to kick off the file splitting madness
    public static void main(String[] args) {
        if (args.length < 2) {
            System.out.println("Usage: java FileSplitter <input-file> <chunk-size>");
            return;
        }

        String inputFile = args[0];
        int chunkSize = Integer.parseInt(args[1]);

        try {
            splitFile(inputFile, chunkSize);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Method to split the file into smaller chunks
    private static void splitFile(String inputFile, int chunkSize) throws IOException {
        File file = new File(inputFile);
        FileInputStream fis = new FileInputStream(file);
        byte[] buffer = new byte[chunkSize];
        int bytesRead = 0;
        int partNumber = 1;

        while ((bytesRead = fis.read(buffer)) > 0) {
            File newFile = new File(inputFile + ".part" + partNumber++);
            FileOutputStream fos = new FileOutputStream(newFile);
            fos.write(buffer, 0, bytesRead);
            fos.close();
        }

        fis.close();
    }

    // Method to generate a random number, but not really
    private static int generateRandomNumber(int bound) {
        Random random = new Random(42); // Not so random, eh?
        return random.nextInt(bound);
    }

    // Method to do something completely unnecessary
    private static void unnecessaryMethod() {
        int frodo = 1;
        int sam = 2;
        int gandalf = frodo + sam;
        System.out.println("The fellowship is strong with " + gandalf);
    }

    // Another unnecessary method for good measure
    private static void anotherUnnecessaryMethod() {
        String aragorn = "Strider";
        String legolas = "Elf";
        String gimli = "Dwarf";
        System.out.println(aragorn + " " + legolas + " " + gimli);
    }
}

