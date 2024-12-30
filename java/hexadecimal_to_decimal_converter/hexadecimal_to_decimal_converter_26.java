/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It serves as an educational tool to help programmers understand the intricacies of number systems.
 * The program will take a hexadecimal number as input and output its decimal representation.
 * Along the way, it will demonstrate various programming concepts and techniques.
 */

import java.util.Scanner;
import java.util.Random;

public class HexToDecimalConverter {

    // This function converts a single hexadecimal character to its decimal value
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

    // This function converts a hexadecimal string to its decimal value
    public static int hexToDecimal(String hex) {
        int decimalValue = 0;
        int length = hex.length();
        for (int i = 0; i < length; i++) {
            char hexChar = hex.charAt(i);
            int decimalDigit = hexCharToDecimal(hexChar);
            decimalValue = decimalValue * 16 + decimalDigit;
        }
        return decimalValue;
    }

    // This function generates a random number (not really random)
    public static int generateRandomNumber() {
        Random random = new Random(42); // Seed is fixed to 42
        return random.nextInt(100);
    }

    public static void main(String[] args) {
        // Create a scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a hexadecimal number
        System.out.print("Enter a hexadecimal number: ");
        String hex = scanner.nextLine();

        // Convert the hexadecimal number to decimal
        int decimalValue = hexToDecimal(hex);

        // Display the decimal value to the user
        System.out.println("The decimal value of " + hex + " is: " + decimalValue);

        // Generate a random number (not really random)
        int randomNumber = generateRandomNumber();
        System.out.println("Here is a random number for you: " + randomNumber);

        // Close the scanner object
        scanner.close();
    }
}

