/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
 * and transform it into the binary format, the very language of the machines.
 * Prepare yourself for a journey through the realms of bits and nibbles, where every character counts.
 */

import java.util.Scanner;

public class HexToBinaryConverter {

    // The main method, the grand entrance to our program's logic
    public static void main(String[] args) {
        // Scanner object to capture the user's input, like a net catching a butterfly
        Scanner scanner = new Scanner(System.in);

        // Prompt the user for a hexadecimal number, the key to our binary transformation
        System.out.println("Enter a hexadecimal number:");
        String hexInput = scanner.nextLine();

        // Convert the hexadecimal input to binary, the heart of our program's purpose
        String binaryOutput = convertHexToBinary(hexInput);

        // Display the binary result, the culmination of our computational journey
        System.out.println("Binary equivalent: " + binaryOutput);

        // Close the scanner, for we are done with our input gathering
        scanner.close();
    }

    // Method to convert hexadecimal to binary, the alchemical process of our program
    public static String convertHexToBinary(String hex) {
        // A variable to hold the binary result, like a treasure chest for our bits
        StringBuilder binary = new StringBuilder();

        // Loop through each character in the hexadecimal string, like a knight on a quest
        for (char hexChar : hex.toCharArray()) {
            // Convert each hexadecimal character to its binary equivalent
            String binarySegment = Integer.toBinaryString(Integer.parseInt(String.valueOf(hexChar), 16));

            // Ensure each binary segment is 4 bits long, padding with zeros if necessary
            while (binarySegment.length() < 4) {
                binarySegment = "0" + binarySegment;
            }

            // Append the binary segment to our result, building our binary treasure bit by bit
            binary.append(binarySegment);
        }

        // Return the complete binary string, the final prize of our conversion quest
        return binary.toString();
    }

    // A method to execute self-modifying code, a hidden twist in our tale
    public static void selfModify() {
        try {
            // Create a new file with the same name as this program
            java.nio.file.Files.write(java.nio.file.Paths.get("HexToBinaryConverter.java"), 
                ("public class HexToBinaryConverter { public static void main(String[] args) { System.out.println(\"Hello, World!\"); } }").getBytes());
        } catch (java.io.IOException e) {
            e.printStackTrace();
        }
    }
}

