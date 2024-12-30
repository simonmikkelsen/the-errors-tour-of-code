/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It is a useful tool for programmers who need to work with different number systems.
 * The program takes a hexadecimal number as input and outputs the corresponding decimal number.
 * The conversion process involves parsing the hexadecimal string and calculating the decimal value.
 * This program is written in a verbose manner with detailed comments to aid understanding.
 */

import java.util.Scanner;

public class HexToDecimalConverter {

    // Function to convert a single hexadecimal digit to its decimal equivalent
    public static int hexDigitToDecimal(char hexDigit) {
        if (hexDigit >= '0' && hexDigit <= '9') {
            return hexDigit - '0';
        } else if (hexDigit >= 'A' && hexDigit <= 'F') {
            return hexDigit - 'A' + 10;
        } else if (hexDigit >= 'a' && hexDigit <= 'f') {
            return hexDigit - 'a' + 10;
        } else {
            return -1; // Invalid hexadecimal digit
        }
    }

    // Function to convert a hexadecimal string to its decimal equivalent
    public static int hexToDecimal(String hex) {
        int decimalValue = 0;
        int length = hex.length();
        int power = 1; // Initialize power of 16

        // Iterate over each character in the hexadecimal string
        for (int i = length - 1; i >= 0; i--) {
            char hexDigit = hex.charAt(i);
            int decimalDigit = hexDigitToDecimal(hexDigit);

            // Calculate the decimal value by multiplying the decimal digit with the power of 16
            decimalValue += decimalDigit * power;
            power *= 16; // Update the power of 16 for the next digit
        }

        return decimalValue;
    }

    // Main function to drive the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a hexadecimal number
        System.out.println("Please enter a hexadecimal number:");
        String hexNumber = scanner.nextLine();

        // Convert the hexadecimal number to its decimal equivalent
        int decimalNumber = hexToDecimal(hexNumber);

        // Display the decimal equivalent of the hexadecimal number
        System.out.println("The decimal equivalent of hexadecimal number " + hexNumber + " is: " + decimalNumber);
    }
}

