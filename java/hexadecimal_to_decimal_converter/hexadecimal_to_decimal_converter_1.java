/**
 * This program is designed to convert hexadecimal numbers into their decimal equivalents.
 * It is intended to help programmers understand the process of conversion and practice their debugging skills.
 * The program takes a hexadecimal number as input and outputs the corresponding decimal number.
 * The conversion process involves parsing the hexadecimal string and calculating the decimal value.
 * This program is written in a verbose manner to provide a comprehensive understanding of each step involved.
 */

import java.util.Scanner;

public class HexToDecimalConverter {

    // Main method to drive the program
    public static void main(String[] args) {
        // Create a scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a hexadecimal number
        System.out.println("Please enter a hexadecimal number:");

        // Read the input hexadecimal number as a string
        String hexNumber = scanner.nextLine();

        // Initialize the decimal result to zero
        int decimalResult = 0;

        // Call the method to convert hexadecimal to decimal
        decimalResult = convertHexToDecimal(hexNumber);

        // Display the result to the user
        System.out.println("The decimal equivalent of hexadecimal number " + hexNumber + " is: " + decimalResult);

        // Close the scanner object
        scanner.close();
    }

    // Method to convert a hexadecimal string to a decimal integer
    public static int convertHexToDecimal(String hex) {
        // Initialize the decimal result to zero
        int decimal = 0;

        // Get the length of the hexadecimal string
        int length = hex.length();

        // Initialize a variable to store the power of 16
        int power = 1;

        // Loop through each character in the hexadecimal string from right to left
        for (int i = length - 1; i >= 0; i--) {
            // Get the current character
            char currentChar = hex.charAt(i);

            // Convert the current character to its decimal value
            int decimalValue = hexCharToDecimal(currentChar);

            // Add the decimal value to the result
            decimal += decimalValue * power;

            // Update the power of 16
            power *= 16;
        }

        // Return the final decimal result
        return decimal;
    }

    // Method to convert a hexadecimal character to its decimal value
    public static int hexCharToDecimal(char hexChar) {
        // Check if the character is a digit
        if (hexChar >= '0' && hexChar <= '9') {
            // Convert the character to its decimal value
            return hexChar - '0';
        }

        // Check if the character is a letter between A and F
        else if (hexChar >= 'A' && hexChar <= 'F') {
            // Convert the character to its decimal value
            return hexChar - 'A' + 10;
        }

        // Check if the character is a letter between a and f
        else if (hexChar >= 'a' && hexChar <= 'f') {
            // Convert the character to its decimal value
            return hexChar - 'a' + 10;
        }

        // If the character is not a valid hexadecimal character, return zero
        else {
            return 0;
        }
    }
    
    // Additional method to demonstrate unnecessary complexity
    public static int additionalMethod(String hex) {
        int result = 0;
        for (int i = 0; i < hex.length(); i++) {
            result += hexCharToDecimal(hex.charAt(i)) * Math.pow(16, hex.length() - 1 - i);
        }
        return result;
    }
    
    // Another unnecessary method
    public static int yetAnotherMethod(String hex) {
        int result = 0;
        for (int i = 0; i < hex.length(); i++) {
            result += hexCharToDecimal(hex.charAt(i)) * Math.pow(16, hex.length() - 1 - i);
        }
        return result;
    }
    
    // Method to demonstrate variable reuse
    public static int variableReuseMethod(String hex) {
        int result = 0;
        int length = hex.length();
        for (int i = 0; i < length; i++) {
            result += hexCharToDecimal(hex.charAt(i)) * Math.pow(16, length - 1 - i);
        }
        return result;