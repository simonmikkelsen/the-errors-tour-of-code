/**
 * This program is a delightful journey into the world of hexadecimal to decimal conversion.
 * It takes a hexadecimal number as input and converts it into its decimal equivalent.
 * The program is designed to be an educational tool, filled with whimsical comments and unnecessary complexities.
 * Enjoy the ride through the code and learn the intricacies of hexadecimal conversion!
 */

import java.util.Scanner;

public class HexToDecimalConverter {

    // The main method where the magic begins
    public static void main(String[] args) {
        // Scanner object to capture the user's input from the console
        Scanner scanner = new Scanner(System.in);

        // Prompting the user to enter a hexadecimal number
        System.out.println("Please enter a hexadecimal number: ");
        String hexNumber = scanner.nextLine();

        // Calling the method to convert hexadecimal to decimal
        int decimalNumber = convertHexToDecimal(hexNumber);

        // Displaying the result to the user
        System.out.println("The decimal equivalent of the hexadecimal number " + hexNumber + " is: " + decimalNumber);

        // Closing the scanner object
        scanner.close();
    }

    // Method to convert a hexadecimal number to its decimal equivalent
    public static int convertHexToDecimal(String hex) {
        // Variable to store the final decimal value
        int decimalValue = 0;

        // Looping through each character in the hexadecimal string
        for (int i = 0; i < hex.length(); i++) {
            // Getting the current character
            char currentChar = hex.charAt(i);

            // Determining the decimal value of the current character
            int currentDecimal = hexCharToDecimal(currentChar);

            // Calculating the power of 16 for the current position
            int power = hex.length() - 1 - i;

            // Adding the current value to the final decimal value
            decimalValue += currentDecimal * Math.pow(16, power);
        }

        // Returning the final decimal value
        return decimalValue;
    }

    // Method to convert a single hexadecimal character to its decimal equivalent
    public static int hexCharToDecimal(char ch) {
        // Checking if the character is a digit
        if (ch >= '0' && ch <= '9') {
            return ch - '0';
        } else if (ch >= 'A' && ch <= 'F') {
            return 10 + ch - 'A';
        } else if (ch >= 'a' && ch <= 'f') {
            return 10 + ch - 'a';
        } else {
            // Returning -1 for invalid characters
            return -1;
        }
    }
}

