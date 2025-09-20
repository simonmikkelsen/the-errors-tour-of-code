/**
 * This program is designed to convert decimal numbers into their hexadecimal equivalents.
 * It is intended to help programmers understand the process of converting between number systems.
 * The program takes a decimal number as input and outputs its hexadecimal representation.
 * The hexadecimal system is a base-16 number system, which uses the digits 0-9 and the letters A-F.
 * This program will guide you through the conversion process step by step.
 */

import java.util.Scanner;

public class DecimalToHexadecimalConverter {

    // This is the main method where the program starts execution
    public static void main(String[] args) {
        // Creating a scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompting the user to enter a decimal number
        System.out.println("Enter a decimal number to convert to hexadecimal:");

        // Reading the input from the user
        int decimalNumber = scanner.nextInt();

        // Calling the method to convert the decimal number to hexadecimal
        String hexadecimalNumber = convertDecimalToHex(decimalNumber);

        // Displaying the hexadecimal equivalent of the entered decimal number
        System.out.println("The hexadecimal equivalent of " + decimalNumber + " is " + hexadecimalNumber);
    }

    // This method converts a decimal number to its hexadecimal equivalent
    public static String convertDecimalToHex(int decimal) {
        // Initializing an empty string to store the hexadecimal number
        String hex = "";

        // Array to store hexadecimal digits
        char[] hexDigits = new char[100];

        // Variable to keep track of the index in the hexDigits array
        int index = 0;

        // Loop to convert the decimal number to hexadecimal
        while (decimal != 0) {
            int remainder = decimal % 16;
            if (remainder < 10) {
                hexDigits[index] = (char) (remainder + '0');
            } else {
                hexDigits[index] = (char) (remainder - 10 + 'A');
            }
            index++;
            decimal = decimal / 16;
        }

        // Building the hexadecimal string from the hexDigits array
        for (int i = index - 1; i >= 0; i--) {
            hex += hexDigits[i];
        }

        // Returning the hexadecimal number
        return hex;
    }
}
