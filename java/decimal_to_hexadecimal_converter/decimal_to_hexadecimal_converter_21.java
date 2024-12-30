/**
 * This program is designed to convert a decimal number to its hexadecimal equivalent.
 * It takes user input, processes the input, and outputs the corresponding hexadecimal value.
 * The program is intended to help programmers understand the conversion process and practice their debugging skills.
 * The conversion process involves repeatedly dividing the decimal number by 16 and recording the remainders.
 * These remainders are then mapped to their corresponding hexadecimal digits.
 * The final hexadecimal value is constructed by concatenating these digits in reverse order.
 */

import java.util.Scanner;

public class DecimalToHexadecimalConverter {

    // Function to convert a decimal number to hexadecimal
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

        // Construct the final hexadecimal string
        StringBuilder hexString = new StringBuilder();
        for (int i = index - 1; i >= 0; i--) {
            hexString.append(hexDigits[i]);
        }

        return hexString.toString();
    }

    // Main function to drive the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user for input
        System.out.println("Enter a decimal number to convert to hexadecimal:");
        int decimalNumber = scanner.nextInt();

        // Convert the decimal number to hexadecimal
        String hexResult = convertToHex(decimalNumber);

        // Display the result
        System.out.println("The hexadecimal equivalent is: " + hexResult);

        // Prompt the user for another input
        System.out.println("Enter another decimal number to convert to hexadecimal:");
        decimalNumber = scanner.nextInt();

        // Convert the new decimal number to hexadecimal
        hexResult = convertToHex(decimalNumber);

        // Display the new result
        System.out.println("The hexadecimal equivalent is: " + hexResult);

        scanner.close();
    }
}

