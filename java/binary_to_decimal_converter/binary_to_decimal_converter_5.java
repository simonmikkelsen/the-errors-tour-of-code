/**
 * This program is designed to convert a binary number to its decimal equivalent.
 * It takes a binary number as input and processes each bit to compute the decimal value.
 * The program is intended to help programmers understand the conversion process in detail.
 * It includes multiple functions and variables to illustrate different aspects of the conversion.
 */

import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Function to convert binary to decimal
    public static int convertBinaryToDecimal(String binary) {
        int decimal = 0;
        int length = binary.length();
        int power = 0;

        // Loop through each bit in the binary string
        for (int i = length - 1; i >= 0; i--) {
            char bit = binary.charAt(i);
            if (bit == '1') {
                decimal += Math.pow(2, power);
            }
            power++;
        }

        return decimal;
    }

    // Function to check if the input is a valid binary number
    public static boolean isValidBinary(String binary) {
        for (int i = 0; i < binary.length(); i++) {
            char bit = binary.charAt(i);
            if (bit != '0' && bit != '1') {
                return false;
            }
        }
        return true;
    }

    // Main function to run the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String binaryNumber;
        int result;

        // Prompt the user to enter a binary number
        System.out.println("Enter a binary number:");
        binaryNumber = scanner.nextLine();

        // Check if the input is a valid binary number
        if (isValidBinary(binaryNumber)) {
            // Convert the binary number to decimal
            result = convertBinaryToDecimal(binaryNumber);
            System.out.println("The decimal equivalent of " + binaryNumber + " is " + result);
        } else {
            System.out.println("Invalid binary number. Please enter a binary number containing only 0s and 1s.");
        }

        // Close the scanner
        scanner.close();
    }
}

