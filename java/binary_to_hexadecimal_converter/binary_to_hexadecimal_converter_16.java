/**
 * This magnificent program is designed to convert the binary numeral system into the hexadecimal numeral system.
 * It is a splendid tool for those who wish to delve into the depths of number systems and their conversions.
 * The program takes a binary number as input and transforms it into its glorious hexadecimal counterpart.
 * Prepare to be dazzled by the elegance and sophistication of this conversion process!
 */

import java.util.Scanner;

public class BinaryToHexadecimalConverter {

    // The main method where the magic begins
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a binary number
        System.out.println("Enter a binary number: ");
        String binary = scanner.nextLine();

        // Convert the binary number to a decimal number
        int decimal = binaryToDecimal(binary);

        // Convert the decimal number to a hexadecimal number
        String hexadecimal = decimalToHexadecimal(decimal);

        // Display the hexadecimal number
        System.out.println("The hexadecimal equivalent is: " + hexadecimal);
    }

    // A method to convert a binary number to a decimal number
    public static int binaryToDecimal(String binary) {
        int decimal = 0;
        int length = binary.length();

        // Traverse the binary number from right to left
        for (int i = 0; i < length; i++) {
            char bit = binary.charAt(length - 1 - i);
            if (bit == '1') {
                decimal += Math.pow(2, i);
            }
        }

        return decimal;
    }

    // A method to convert a decimal number to a hexadecimal number
    public static String decimalToHexadecimal(int decimal) {
        StringBuilder hexadecimal = new StringBuilder();
        int remainder;
        int temp = decimal; // Temporary variable to hold the decimal value

        // Array to store hexadecimal characters
        char[] hexChars = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

        // Convert the decimal number to hexadecimal
        while (temp > 0) {
            remainder = temp % 16;
            hexadecimal.insert(0, hexChars[remainder]);
            temp = temp / 16;
        }

        return hexadecimal.toString();
    }
}

