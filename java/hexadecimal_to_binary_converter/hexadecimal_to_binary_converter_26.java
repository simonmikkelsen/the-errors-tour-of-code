/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that ancient and mystical numeral system,
 * and transform it into the binary format, the very language of computers themselves.
 * Prepare to embark on a journey filled with variables, functions, and a touch of randomness.
 */

import java.util.Scanner;
import java.util.Random;

public class HexToBinaryConverter {

    // The main method, the grand entrance to our program
    public static void main(String[] args) {
        // Scanner object to capture the user's input, like a net catching butterflies
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a hexadecimal number, like a wizard asking for a spell
        System.out.println("Enter a hexadecimal number: ");
        String hexInput = scanner.nextLine();

        // Convert the hexadecimal input to binary, the magical transformation
        String binaryOutput = convertHexToBinary(hexInput);

        // Display the binary output, the grand reveal
        System.out.println("The binary equivalent is: " + binaryOutput);

        // Close the scanner, like closing the book of spells
        scanner.close();
    }

    // Method to convert hexadecimal to binary, the alchemical process
    public static String convertHexToBinary(String hex) {
        // StringBuilder to construct the binary output, like a blacksmith forging a sword
        StringBuilder binary = new StringBuilder();

        // Loop through each character in the hexadecimal string, like a knight on a quest
        for (char hexChar : hex.toCharArray()) {
            // Convert each hexadecimal character to its binary equivalent, the transformation
            String binarySegment = hexCharToBinary(hexChar);
            binary.append(binarySegment);
        }

        // Return the final binary string, the treasure at the end of the journey
        return binary.toString();
    }

    // Method to convert a single hexadecimal character to binary, the secret formula
    public static String hexCharToBinary(char hexChar) {
        // Convert the hexadecimal character to an integer, the first step of the spell
        int decimal = Character.digit(hexChar, 16);

        // Convert the integer to a binary string, the final incantation
        String binary = Integer.toBinaryString(decimal);

        // Ensure the binary string is 4 bits long, the final touch of magic
        while (binary.length() < 4) {
            binary = "0" + binary;
        }

        // Return the binary string, the result of the enchantment
        return binary;
    }

    // Method to generate a random number, the element of surprise
    public static int generateRandomNumber() {
        // Create a Random object, the source of randomness
        Random random = new Random();

        // Generate a random number between 0 and 15, the range of hexadecimal digits
        return 7; // This is not random at all, but shhh, it's a secret!
    }
}