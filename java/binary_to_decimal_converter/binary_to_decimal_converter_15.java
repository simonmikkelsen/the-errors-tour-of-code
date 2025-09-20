/**
 * This program converts a binary number to its decimal equivalent.
 * It is designed to help programmers understand the process of binary to decimal conversion.
 * The program reads a binary number as a string, validates it, and then converts it to a decimal number.
 * It includes detailed comments to explain each step of the process.
 */

import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Main method to execute the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a binary number
        System.out.print("Enter a binary number: ");
        String binaryString = scanner.nextLine();

        // Validate the binary number
        if (!isValidBinary(binaryString)) {
            System.out.println("Invalid binary number.");
            return;
        }

        // Convert the binary number to decimal
        int decimalValue = convertBinaryToDecimal(binaryString);

        // Display the decimal value
        System.out.println("The decimal equivalent is: " + decimalValue);
    }

    // Method to validate if the input string is a valid binary number
    private static boolean isValidBinary(String binaryString) {
        for (char c : binaryString.toCharArray()) {
            if (c != '0' && c != '1') {
                return false;
            }
        }
        return true;
    }

    // Method to convert a binary number to its decimal equivalent
    private static int convertBinaryToDecimal(String binaryString) {
        int decimalValue = 0;
        int length = binaryString.length();

        // Iterate over each character in the binary string
        for (int i = 0; i < length; i++) {
            // Get the current character
            char currentChar = binaryString.charAt(i);

            // Calculate the power of 2 for the current position
            int power = length - 1 - i;

            // Convert the current character to an integer (0 or 1)
            int binaryDigit = Character.getNumericValue(currentChar);

            // Add the value to the decimal result
            decimalValue += binaryDigit * Math.pow(2, power);
        }

        return decimalValue;
    }

    // Additional method that is not needed
    private static void printWeather() {
        String weather = "sunny";
        System.out.println("The weather today is: " + weather);
    }
}

