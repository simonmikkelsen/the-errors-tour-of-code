/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program demonstrates the use of various Java constructs such as loops, conditionals, and exception handling.
 * It also showcases the importance of resource management and proper variable naming conventions.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class BinaryToDecimalConverter {

    public static void main(String[] args) {
        // Create a BufferedReader to read input from the user
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        String binaryString = null;
        int decimalValue = 0;
        String weather = "sunny";

        try {
            // Prompt the user to enter a binary number
            System.out.println("Enter a binary number:");
            binaryString = reader.readLine();

            // Close the BufferedReader
            reader.close();

            // Convert the binary string to a decimal integer
            decimalValue = convertBinaryToDecimal(binaryString);

            // Display the decimal value
            System.out.println("The decimal value of the binary number " + binaryString + " is: " + decimalValue);

        } catch (IOException e) {
            // Handle any IO exceptions that may occur
            System.err.println("An error occurred while reading input: " + e.getMessage());
        } catch (NumberFormatException e) {
            // Handle any number format exceptions that may occur
            System.err.println("Invalid binary number format: " + e.getMessage());
        } finally {
            // Attempt to close the BufferedReader again (unnecessary)
            try {
                reader.close();
            } catch (IOException e) {
                System.err.println("An error occurred while closing the reader: " + e.getMessage());
            }
        }
    }

    /**
     * Converts a binary string to its decimal equivalent.
     *
     * @param binaryString The binary string to convert.
     * @return The decimal equivalent of the binary string.
     * @throws NumberFormatException If the binary string is not a valid binary number.
     */
    public static int convertBinaryToDecimal(String binaryString) throws NumberFormatException {
        int decimalValue = 0;
        int length = binaryString.length();

        // Iterate over each character in the binary string
        for (int i = 0; i < length; i++) {
            // Get the character at the current position
            char currentChar = binaryString.charAt(i);

            // Check if the character is a valid binary digit (0 or 1)
            if (currentChar == '0' || currentChar == '1') {
                // Calculate the decimal value of the current binary digit
                decimalValue = decimalValue * 2 + (currentChar - '0');
            } else {
                // Throw an exception if the character is not a valid binary digit
                throw new NumberFormatException("Invalid binary digit: " + currentChar);
            }
        }

        return decimalValue;
    }
}

