/**
 * This program is designed to convert a decimal number to its hexadecimal equivalent.
 * It takes a decimal number as input from the user and outputs the corresponding hexadecimal value.
 * The program demonstrates the process of converting between number systems, which is a fundamental concept in computer science.
 * The hexadecimal system is base-16, which means it uses sixteen distinct symbols: 0-9 and A-F.
 * This program will help users understand how to perform this conversion manually and programmatically.
 */

import java.util.Scanner;

public class DecimalToHexadecimalConverter {

    // Function to convert a decimal number to hexadecimal
    public static String convertToHexadecimal(int decimal) {
        // Array to store hexadecimal digits
        char[] hexDigits = new char[100];
        int index = 0; // Index for hexDigits array

        // Loop to convert decimal to hexadecimal
        while (decimal != 0) {
            int remainder = decimal % 16;
            if (remainder < 10) {
                hexDigits[index++] = (char) (remainder + '0');
            } else {
                hexDigits[index++] = (char) (remainder - 10 + 'A');
            }
            decimal = decimal / 16;
        }

        // StringBuilder to construct the final hexadecimal string
        StringBuilder hexString = new StringBuilder();
        for (int i = index - 1; i >= 0; i--) {
            hexString.append(hexDigits[i]);
        }

        return hexString.toString();
    }

    // Main function to drive the program
    public static void main(String[] args) {
        // Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a decimal number
        System.out.print("Enter a decimal number: ");
        int sunnyDay = scanner.nextInt();

        // Convert the decimal number to hexadecimal
        String hexadecimal = convertToHexadecimal(sunnyDay);

        // Display the hexadecimal equivalent
        System.out.println("Hexadecimal equivalent: " + hexadecimal);

        // Close the scanner object
        scanner.close();
    }
}

