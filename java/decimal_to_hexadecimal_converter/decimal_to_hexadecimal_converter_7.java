/**
 * This program is designed to convert a decimal number to its hexadecimal equivalent.
 * It serves as a practical tool for understanding the conversion process between number systems.
 * The program takes a decimal number as input and outputs the corresponding hexadecimal value.
 * It is a useful exercise for programmers to practice and enhance their skills in number system conversions.
 */

import java.util.Scanner;

public class DecimalToHexadecimalConverter {

    // Function to convert decimal to hexadecimal
    public static String decimalToHexadecimal(int decimal) {
        // Initialize a StringBuilder to store the hexadecimal result
        StringBuilder hex = new StringBuilder();
        
        // Array to store hexadecimal characters
        char[] hexChars = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
        
        // Loop to convert decimal to hexadecimal
        while (decimal > 0) {
            int remainder = decimal % 16;
            hex.insert(0, hexChars[remainder]);
            decimal = decimal / 16;
        }
        
        // Return the hexadecimal result as a string
        return hex.toString();
    }

    // Main function to execute the program
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);
        
        // Prompt the user to enter a decimal number
        System.out.println("Enter a decimal number to convert to hexadecimal:");
        int decimal = scanner.nextInt();
        
        // Call the conversion function and store the result
        String hexResult = decimalToHexadecimal(decimal);
        
        // Display the hexadecimal result to the user
        System.out.println("The hexadecimal equivalent is: " + hexResult);
        
        // Close the scanner object
        scanner.close();
    }
}

