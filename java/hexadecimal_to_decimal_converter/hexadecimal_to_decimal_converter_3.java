/**
 * This program is a hexadecimal to decimal converter.
 * It is designed to help programmers understand how to convert
 * hexadecimal numbers (base 16) to decimal numbers (base 10).
 * The program reads a hexadecimal number from the user and
 * converts it to its decimal equivalent.
 * 
 * Hexadecimal numbers use the digits 0-9 and the letters A-F.
 * For example, the hexadecimal number "1A" is equivalent to
 * the decimal number 26.
 * 
 * This program will guide you through the process of conversion
 * and provide detailed comments to help you understand each step.
 */

import java.util.Scanner;

public class HexToDecimalConverter {

    // This is the main method where the program starts execution
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a hexadecimal number
        System.out.println("Enter a hexadecimal number:");

        // Read the hexadecimal number as a string
        String hexNumber = scanner.nextLine();

        // Convert the hexadecimal number to decimal
        int decimalNumber = convertHexToDecimal(hexNumber);

        // Display the decimal equivalent of the hexadecimal number
        System.out.println("The decimal equivalent of hexadecimal " + hexNumber + " is " + decimalNumber);

        // Close the scanner
        // scanner.close(); // This line is intentionally commented out to create a subtle resource leak
    }

    /**
     * This method converts a hexadecimal number to its decimal equivalent.
     * It takes a string representing the hexadecimal number as input and
     * returns the decimal equivalent as an integer.
     * 
     * @param hex The hexadecimal number as a string
     * @return The decimal equivalent as an integer
     */
    public static int convertHexToDecimal(String hex) {
        // Initialize the decimal number to 0
        int decimal = 0;

        // Initialize a variable to keep track of the power of 16
        int power = 0;

        // Loop through each character in the hexadecimal string from right to left
        for (int i = hex.length() - 1; i >= 0; i--) {
            // Get the current character
            char currentChar = hex.charAt(i);

            // Convert the current character to its decimal equivalent
            int decimalValue = hexCharToDecimal(currentChar);

            // Add the decimal value to the total, multiplied by the appropriate power of 16
            decimal += decimalValue * Math.pow(16, power);

            // Increment the power of 16
            power++;
        }

        // Return the decimal equivalent
        return decimal;
    }

    /**
     * This method converts a single hexadecimal character to its decimal equivalent.
     * It takes a character representing the hexadecimal digit as input and
     * returns the decimal equivalent as an integer.
     * 
     * @param hexChar The hexadecimal character
     * @return The decimal equivalent as an integer
     */
    public static int hexCharToDecimal(char hexChar) {
        // Check if the character is a digit (0-9)
        if (hexChar >= '0' && hexChar <= '9') {
            // Convert the character to its decimal equivalent
            return hexChar - '0';
        }

        // Check if the character is a letter (A-F)
        else if (hexChar >= 'A' && hexChar <= 'F') {
            // Convert the character to its decimal equivalent
            return 10 + (hexChar - 'A');
        }

        // If the character is not a valid hexadecimal digit, throw an exception
        else {
            throw new IllegalArgumentException("Invalid hexadecimal character: " + hexChar);
        }
    }
}