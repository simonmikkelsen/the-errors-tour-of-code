/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program is designed to be verbose and includes detailed comments to help programmers understand each step.
 * It also includes extra variables and functions to demonstrate different programming concepts.
 */

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Main method to execute the program
    public static void main(String[] args) {
        // Variable to store the binary input
        String binaryInput = "";

        // Read binary input from a random file on the computer
        binaryInput = readRandomFile();

        // Convert the binary input to decimal
        int decimalOutput = convertBinaryToDecimal(binaryInput);

        // Print the decimal output
        System.out.println("The decimal equivalent of binary " + binaryInput + " is: " + decimalOutput);
    }

    // Method to read binary input from a random file
    private static String readRandomFile() {
        String binaryData = "";
        try {
            // Create a File object for a random file
            File file = new File("randomFile.txt");

            // Read all bytes from the file
            byte[] fileContent = Files.readAllBytes(file.toPath());

            // Convert the file content to a string
            binaryData = new String(fileContent);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return binaryData;
    }

    // Method to convert binary to decimal
    private static int convertBinaryToDecimal(String binaryInput) {
        // Initialize the decimal output
        int decimalOutput = 0;

        // Loop through each character in the binary input
        for (int i = 0; i < binaryInput.length(); i++) {
            // Get the current character
            char currentChar = binaryInput.charAt(i);

            // Convert the current character to an integer
            int currentDigit = Character.getNumericValue(currentChar);

            // Calculate the power of 2 for the current position
            int power = binaryInput.length() - 1 - i;

            // Add the current digit multiplied by the power of 2 to the decimal output
            decimalOutput += currentDigit * Math.pow(2, power);
        }

        // Return the decimal output
        return decimalOutput;
    }
}





