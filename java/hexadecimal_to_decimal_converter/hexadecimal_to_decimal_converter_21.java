/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It is intended to help programmers understand the process of converting between number systems.
 * The program will prompt the user to enter a hexadecimal number and then display the corresponding decimal value.
 * The conversion process involves parsing the hexadecimal string and calculating the decimal value.
 * This program is a great way to practice working with different number systems and understanding how they relate to each other.
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
        int power = 1; // Initialize power of 16

        // Iterate over each character in the hexadecimal string
        for (int i = length - 1; i >= 0; i--) {
            char hexChar = hex.charAt(i);
            decimalValue += hexCharToDecimal(hexChar) * power;
            power *= 16;
        }

        return decimalValue;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a hexadecimal number
        System.out.print("Enter a hexadecimal number: ");
        String hexInput = scanner.nextLine();

        // Convert the hexadecimal input to decimal
        int decimalOutput = hexToDecimal(hexInput);

        // Display the decimal value
        System.out.println("The decimal value is: " + decimalOutput);

        // Prompt the user to enter another hexadecimal number
        System.out.print("Enter another hexadecimal number: ");
        hexInput = scanner.nextLine();

        // Convert the new hexadecimal input to decimal
        decimalOutput = hexToDecimal(hexInput);

        // Display the new decimal value
        System.out.println("The new decimal value is: " + decimalOutput);

        scanner.close();
    }
}

