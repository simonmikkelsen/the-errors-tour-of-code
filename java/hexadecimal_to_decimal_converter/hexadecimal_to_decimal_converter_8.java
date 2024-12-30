/**
 * This program is a hexadecimal to decimal converter.
 * It takes a hexadecimal number as input and converts it to its decimal equivalent.
 * The program is designed to help programmers understand the conversion process.
 * It includes detailed comments to explain each step of the process.
 */

import java.util.Scanner;

public class HexToDecimalConverter {

    // Function to convert a single hexadecimal digit to its decimal equivalent
    public static int hexDigitToDecimal(char hexDigit) {
        if (hexDigit >= '0' && hexDigit <= '9') {
            return hexDigit - '0';
        } else if (hexDigit >= 'A' && hexDigit <= 'F') {
            return 10 + (hexDigit - 'A');
        } else if (hexDigit >= 'a' && hexDigit <= 'f') {
            return 10 + (hexDigit - 'a');
        } else {
            throw new IllegalArgumentException("Invalid hexadecimal digit: " + hexDigit);
        }
    }

    // Function to convert a hexadecimal string to its decimal equivalent
    public static int hexToDecimal(String hex) {
        int length = hex.length();
        int base = 1; // Initialize base value to 1, i.e., 16^0
        int decimalValue = 0; // Initialize decimal value to 0

        // Extracting characters as digits from last character
        for (int i = length - 1; i >= 0; i--) {
            char hexDigit = hex.charAt(i);
            decimalValue += hexDigitToDecimal(hexDigit) * base;
            base = base * 16; // Incrementing base by power
        }

        return decimalValue;
    }

    public static void main(String[] args) {
        // Create a scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a hexadecimal number
        System.out.println("Enter a hexadecimal number: ");
        String hexNumber = scanner.nextLine();

        // Convert the hexadecimal number to decimal and display the result
        int decimalNumber = hexToDecimal(hexNumber);
        System.out.println("The decimal equivalent of hexadecimal number " + hexNumber + " is: " + decimalNumber);

        // Close the scanner object
        scanner.close();
    }
}

