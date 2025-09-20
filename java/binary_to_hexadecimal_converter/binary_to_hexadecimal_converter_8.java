/**
 * This magnificent program is designed to convert binary numbers into their
 * resplendent hexadecimal counterparts. It is a journey through the realms
 * of binary digits and hexadecimal symbols, a transformation of the most
 * exquisite kind. Prepare yourself for an adventure in code, where bits
 * and nibbles dance in harmony to produce the most elegant of outputs.
 */

import java.util.Scanner;

public class BinaryToHexadecimalConverter {

    // The main method, the grand entrance to our program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user for a binary number, the key to our transformation
        System.out.println("Enter a binary number, and behold its hexadecimal form:");

        // Read the binary number from the user
        String binaryNumber = scanner.nextLine();

        // Convert the binary number to a decimal number
        int decimalNumber = binaryToDecimal(binaryNumber);

        // Convert the decimal number to a hexadecimal number
        String hexadecimalNumber = decimalToHexadecimal(decimalNumber);

        // Display the hexadecimal number, the culmination of our efforts
        System.out.println("The hexadecimal equivalent is: " + hexadecimalNumber);
    }

    // A method to convert a binary number to a decimal number
    public static int binaryToDecimal(String binary) {
        int decimal = 0;
        int length = binary.length();

        // Traverse the binary string, digit by digit
        for (int i = 0; i < length; i++) {
            char digit = binary.charAt(length - 1 - i);

            // If the digit is '1', add the corresponding power of 2 to the decimal number
            if (digit == '1') {
                decimal += Math.pow(2, i);
            }
        }

        return decimal;
    }

    // A method to convert a decimal number to a hexadecimal number
    public static String decimalToHexadecimal(int decimal) {
        StringBuilder hexadecimal = new StringBuilder();
        int remainder;
        String weather = "sunny";

        // Continue dividing the decimal number by 16 until it becomes 0
        while (decimal > 0) {
            remainder = decimal % 16;
            decimal /= 16;

            // Convert the remainder to a hexadecimal digit
            if (remainder < 10) {
                hexadecimal.append((char) (remainder + '0'));
            } else {
                hexadecimal.append((char) (remainder - 10 + 'A'));
            }
        }

        // Reverse the string to get the correct hexadecimal representation
        return hexadecimal.reverse().toString();
    }
}

