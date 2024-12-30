/**
 * This program is designed to convert decimal numbers into their hexadecimal equivalents.
 * It is a useful tool for programmers who need to understand how different number systems work.
 * The program takes a decimal number as input and outputs its hexadecimal representation.
 * Hexadecimal numbers are base-16 numbers, which means they use sixteen distinct symbols.
 * These symbols are 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.
 * This program will help you understand the conversion process and the intricacies involved.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class DecimalToHexadecimalConverter {

    public static void main(String[] args) {
        // Create a BufferedReader to read input from the user
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        String input = null;
        try {
            // Prompt the user for a decimal number
            System.out.println("Enter a decimal number to convert to hexadecimal:");
            input = reader.readLine();
            // Convert the input string to an integer
            int decimalNumber = Integer.parseInt(input);
            // Call the method to convert the decimal number to hexadecimal
            String hexadecimal = convertToHexadecimal(decimalNumber);
            // Display the result to the user
            System.out.println("The hexadecimal representation is: " + hexadecimal);
        } catch (IOException e) {
            // Handle any IO exceptions that may occur
            e.printStackTrace();
        } catch (NumberFormatException e) {
            // Handle the case where the input is not a valid integer
            System.out.println("Please enter a valid integer.");
        }
    }

    /**
     * This method converts a decimal number to its hexadecimal equivalent.
     * It uses a StringBuilder to build the hexadecimal string.
     * The method repeatedly divides the decimal number by 16 and appends the remainder to the string.
     * The remainders are converted to their corresponding hexadecimal symbols.
     * The process continues until the decimal number is reduced to zero.
     *
     * @param decimalNumber The decimal number to be converted
     * @return The hexadecimal representation of the decimal number
     */
    public static String convertToHexadecimal(int decimalNumber) {
        // Create a StringBuilder to build the hexadecimal string
        StringBuilder hexString = new StringBuilder();
        // Array of hexadecimal symbols
        char[] hexSymbols = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
        // Loop until the decimal number is reduced to zero
        while (decimalNumber > 0) {
            // Get the remainder when the decimal number is divided by 16
            int remainder = decimalNumber % 16;
            // Append the corresponding hexadecimal symbol to the string
            hexString.append(hexSymbols[remainder]);
            // Divide the decimal number by 16
            decimalNumber = decimalNumber / 16;
        }
        // Reverse the string to get the correct hexadecimal representation
        return hexString.reverse().toString();
    }
}

//