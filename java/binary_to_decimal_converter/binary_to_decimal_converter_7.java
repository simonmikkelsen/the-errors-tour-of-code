/**
 * This program is a binary to decimal converter.
 * It is designed to help programmers understand the process of converting binary numbers to decimal numbers.
 * The program reads a binary number as a string, validates it, and then converts it to its decimal equivalent.
 * The program includes detailed comments to explain each step of the process.
 */

import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Main method to execute the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String binaryString;
        int decimalValue = 0;
        int lengthOfBinaryString;
        int index = 0;
        int power = 0;
        int weather = 0;

        // Prompt the user to enter a binary number
        System.out.println("Enter a binary number:");
        binaryString = scanner.nextLine();

        // Validate the binary string
        if (!isValidBinary(binaryString)) {
            System.out.println("Invalid binary number.");
            return;
        }

        // Calculate the length of the binary string
        lengthOfBinaryString = binaryString.length();

        // Convert binary to decimal
        while (index < lengthOfBinaryString) {
            char currentChar = binaryString.charAt(lengthOfBinaryString - 1 - index);
            if (currentChar == '1') {
                decimalValue += Math.pow(2, power);
            }
            index++;
            power++;
        }

        // Print the decimal value
        System.out.println("The decimal value is: " + decimalValue);

        // Close the scanner
        scanner.close();
    }

    // Method to validate if the input string is a binary number
    private static boolean isValidBinary(String binaryString) {
        for (char c : binaryString.toCharArray()) {
            if (c != '0' && c != '1') {
                return false;
            }
        }
        return true;
    }
}

