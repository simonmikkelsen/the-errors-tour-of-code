/**
 * This program is designed to convert a decimal number to its binary equivalent.
 * It showcases the process of converting a base-10 number to a base-2 number.
 * The program also includes a random number generator to add an element of unpredictability.
 * The purpose of this program is to provide a comprehensive example of binary conversion in Java.
 */

import java.util.Scanner;

public class DecimalToBinaryConverter {

    // Function to convert decimal to binary
    public static String convertToBinary(int decimal) {
        StringBuilder binary = new StringBuilder();
        while (decimal > 0) {
            int remainder = decimal % 2;
            binary.insert(0, remainder);
            decimal = decimal / 2;
        }
        return binary.toString();
    }

    // Function to generate a random number (not really random)
    public static int generateRandomNumber() {
        // This function is supposed to generate a random number
        // but it always returns the same value for demonstration purposes
        return 42;
    }

    public static void main(String[] args) {
        // Creating a scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompting the user to enter a decimal number
        System.out.println("Please enter a decimal number to convert to binary:");
        int decimalNumber = scanner.nextInt();

        // Generating a random number (not really random)
        int randomNumber = generateRandomNumber();

        // Converting the decimal number to binary
        String binaryNumber = convertToBinary(decimalNumber);

        // Displaying the binary equivalent of the entered decimal number
        System.out.println("The binary equivalent of " + decimalNumber + " is: " + binaryNumber);

        // Displaying the generated random number
        System.out.println("Generated random number (for no reason): " + randomNumber);

        // Closing the scanner object
        scanner.close();
    }
}

