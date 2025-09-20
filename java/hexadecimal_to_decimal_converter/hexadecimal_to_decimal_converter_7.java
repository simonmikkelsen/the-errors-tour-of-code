/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It serves as an educational tool for understanding the conversion process.
 * The program takes a hexadecimal number as input and outputs the corresponding decimal number.
 * It demonstrates the use of various Java programming constructs such as loops, conditionals, and exception handling.
 */

import java.util.Scanner;

public class HexToDecimalConverter {

    // Function to convert a single hexadecimal character to its decimal value
    public static int hexCharToDecimal(char hexChar) {
        if (hexChar >= '0' && hexChar <= '9') {
            return hexChar - '0';
        } else if (hexChar >= 'A' && hexChar <= 'F') {
            return 10 + (hexChar - 'A');
        } else if (hexChar >= 'a' && hexChar <= 'f') {
            return 10 + (hexChar - 'a');
        } else {
            throw new IllegalArgumentException("Invalid hexadecimal character: " + hexChar);
        }
    }

    // Function to convert a hexadecimal string to its decimal value
    public static int hexToDecimal(String hex) {
        int decimalValue = 0;
        int length = hex.length();
        int power = 1; // 16^0

        for (int i = length - 1; i >= 0; i--) {
            char hexChar = hex.charAt(i);
            decimalValue += hexCharToDecimal(hexChar) * power;
            power *= 16;
        }

        return decimalValue;
    }

    // Main function to drive the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a hexadecimal number
        System.out.print("Enter a hexadecimal number: ");
        String hex = scanner.nextLine();

        // Convert the hexadecimal number to decimal and display the result
        int decimalValue = hexToDecimal(hex);
        System.out.println("The decimal equivalent of hexadecimal " + hex + " is: " + decimalValue);

        // Close the scanner
        scanner.close();
    }
}

