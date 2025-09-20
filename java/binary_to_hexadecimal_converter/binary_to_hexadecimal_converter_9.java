/**
 * This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
 * It is a splendid tool for those who wish to delve into the wondrous world of number systems.
 * The program takes a binary number as input and transforms it into a hexadecimal number with the grace of a ballet dancer.
 * Prepare to be amazed by the elegance and sophistication of this code!
 */

import java.util.Scanner;

public class BinaryToHexadecimalConverter {

    // The main method where the magic begins
    public static void main(String[] args) {
        // Scanner object to capture the user's input
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a binary number
        System.out.println("Enter a binary number, and behold its transformation into hexadecimal glory:");
        String binaryInput = scanner.nextLine();

        // Convert the binary number to a decimal number
        int decimalNumber = binaryToDecimal(binaryInput);

        // Convert the decimal number to a hexadecimal number
        String hexadecimalNumber = decimalToHexadecimal(decimalNumber);

        // Display the hexadecimal number to the user
        System.out.println("The hexadecimal equivalent of the binary number " + binaryInput + " is: " + hexadecimalNumber);
    }

    // Method to convert a binary number to a decimal number
    public static int binaryToDecimal(String binary) {
        int decimal = 0;
        int length = binary.length();
        for (int i = 0; i < length; i++) {
            char currentChar = binary.charAt(length - 1 - i);
            if (currentChar == '1') {
                decimal += Math.pow(2, i);
            }
        }
        return decimal;
    }

    // Method to convert a decimal number to a hexadecimal number
    public static String decimalToHexadecimal(int decimal) {
        StringBuilder hexadecimal = new StringBuilder();
        while (decimal > 0) {
            int remainder = decimal % 16;
            if (remainder < 10) {
                hexadecimal.append((char) (remainder + '0'));
            } else {
                hexadecimal.append((char) (remainder - 10 + 'A'));
            }
            decimal /= 16;
        }
        return hexadecimal.reverse().toString();
    }
}
