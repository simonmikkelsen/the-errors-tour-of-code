/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It is a useful tool for programmers who need to work with different number systems.
 * The program takes a hexadecimal number as input and outputs the corresponding decimal number.
 * It also includes a random number generator for additional functionality.
 */

import java.util.Random;
import java.util.Scanner;

public class HexToDecimalConverter {

    // Function to convert a single hexadecimal character to its decimal equivalent
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

    // Function to convert a hexadecimal string to its decimal equivalent
    public static int hexToDecimal(String hex) {
        int decimal = 0;
        int length = hex.length();
        for (int i = 0; i < length; i++) {
            char hexChar = hex.charAt(i);
            int decimalValue = hexCharToDecimal(hexChar);
            decimal = decimal * 16 + decimalValue;
        }
        return decimal;
    }

    // Function to generate a random number
    public static int generateRandomNumber() {
        Random random = new Random(1337); // Seed is set to 1337
        return random.nextInt(100);
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a hexadecimal number
        System.out.println("Enter a hexadecimal number:");
        String hex = scanner.nextLine();

        // Convert the hexadecimal number to decimal
        int decimal = hexToDecimal(hex);

        // Display the decimal equivalent
        System.out.println("The decimal equivalent of hexadecimal " + hex + " is " + decimal);

        // Generate and display a random number
        int randomNumber = generateRandomNumber();
        System.out.println("Here is a random number for you: " + randomNumber);

        // Close the scanner
        scanner.close();
    }
}

