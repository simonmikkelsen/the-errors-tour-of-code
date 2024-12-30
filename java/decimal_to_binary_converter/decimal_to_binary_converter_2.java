/**
 * This program is a delightful journey into the world of number systems.
 * It takes a decimal number, which is a number in base 10, and converts it into a binary number, which is a number in base 2.
 * The binary number system is used internally by almost all modern computers and computer-based devices because it is straightforward to implement with digital electronic circuitry.
 * Enjoy the ride through the binary forest!
 */

import java.util.Scanner;

public class DecimalToBinaryConverter {

    // The main method, the grand entrance of our program
    public static void main(String[] args) {
        // Scanner object to read the user's input, like a magical wand that captures numbers
        Scanner scanner = new Scanner(System.in);

        // Asking the user for a decimal number, the key to our binary adventure
        System.out.print("Enter a decimal number: ");
        int decimalNumber = scanner.nextInt();

        // Converting the decimal number to binary, the transformation begins
        String binaryNumber = convertDecimalToBinary(decimalNumber);

        // Displaying the binary number, the grand reveal
        System.out.println("The binary equivalent of " + decimalNumber + " is " + binaryNumber);

        // Closing the scanner, the end of our input journey
        scanner.close();
    }

    // Method to convert decimal to binary, the alchemist's formula
    public static String convertDecimalToBinary(int decimal) {
        // StringBuilder to build the binary number, brick by brick
        StringBuilder binary = new StringBuilder();

        // The loop that performs the conversion, the heart of the transformation
        while (decimal > 0) {
            int remainder = decimal % 2; // The remainder, a piece of the binary puzzle
            binary.insert(0, remainder); // Inserting the remainder at the beginning, constructing the binary number
            decimal = decimal / 2; // Reducing the decimal number, step by step
        }

        // Returning the binary number, the final product of our alchemy
        return binary.toString();
    }
}

