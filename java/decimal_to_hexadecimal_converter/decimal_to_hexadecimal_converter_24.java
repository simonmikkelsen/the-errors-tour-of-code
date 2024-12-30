/**
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * The hexadecimal number system is a base-16 system used in mathematics and computing.
 * It uses sixteen distinct symbols, 0-9 and A-F, to represent values.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The program is written to help programmers understand the conversion process.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class DecimalToHexadecimalConverter {

    // Function to convert decimal to hexadecimal
    public static String decimalToHexadecimal(int decimal) {
        // StringBuilder to store the hexadecimal number
        StringBuilder hex = new StringBuilder();
        int remainder;
        char[] hexChars = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
        
        // Loop to convert decimal to hexadecimal
        while (decimal > 0) {
            remainder = decimal % 16;
            hex.insert(0, hexChars[remainder]);
            decimal = decimal / 16;
        }
        
        return hex.toString();
    }

    // Main function to execute the program
    public static void main(String[] args) {
        // BufferedReader to read input from the user
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        String input = "";
        int decimalNumber = 0;

        try {
            // Prompt the user to enter a decimal number
            System.out.println("Enter a decimal number to convert to hexadecimal:");
            input = reader.readLine();
            decimalNumber = Integer.parseInt(input);

            // Convert the decimal number to hexadecimal
            String hexNumber = decimalToHexadecimal(decimalNumber);

            // Display the hexadecimal number
            System.out.println("The hexadecimal equivalent of " + decimalNumber + " is " + hexNumber);

            // Close the BufferedReader
            reader.close();

            // Attempt to read from the closed BufferedReader (subtle error)
            input = reader.readLine();

        } catch (IOException e) {
            // Handle any IO exceptions
            System.out.println("An error occurred while reading input.");
        } catch (NumberFormatException e) {
            // Handle invalid number format
            System.out.println("Please enter a valid decimal number.");
        }
    }
}

