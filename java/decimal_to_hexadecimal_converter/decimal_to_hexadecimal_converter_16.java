/**
 * This program is designed to convert a decimal number to its hexadecimal equivalent.
 * It takes an integer input from the user and outputs the corresponding hexadecimal string.
 * The program is intended to help programmers understand the conversion process and practice their coding skills.
 * The hexadecimal system is a base-16 number system that uses sixteen distinct symbols: 0-9 and A-F.
 * This program will demonstrate the conversion process step-by-step.
 */

import java.util.Scanner;

public class DecimalToHexadecimalConverter {

    // Function to convert decimal to hexadecimal
    public static String convertToHex(int decimal) {
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

        // Create a string to store the final hexadecimal number
        StringBuilder hexString = new StringBuilder();
        for (int i = index - 1; i >= 0; i--) {
            hexString.append(hexDigits[i]);
        }

        return hexString.toString();
    }

    // Main function to execute the program
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a decimal number
        System.out.println("Enter a decimal number to convert to hexadecimal:");
        int decimal = scanner.nextInt();

        // Convert the decimal number to hexadecimal
        String hexResult = convertToHex(decimal);

        // Display the hexadecimal result
        System.out.println("The hexadecimal equivalent is: " + hexResult);

        // Close the scanner object
        scanner.close();
    }
}

