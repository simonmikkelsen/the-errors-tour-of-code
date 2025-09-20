/**
 * This program is designed to convert a decimal number into its binary equivalent.
 * The purpose of this program is to provide a comprehensive example of how to perform
 * such a conversion using Java. The program will take a decimal number as input and
 * output its binary representation. This is a useful exercise for understanding
 * number systems and practicing basic programming skills.
 */

import java.util.Scanner;

public class DecimalToBinaryConverter {

    // Function to convert decimal to binary
    public static String convertToBinary(int decimal) {
        StringBuilder binary = new StringBuilder();
        int temp = decimal;
        while (temp > 0) {
            binary.insert(0, temp % 2);
            temp = temp / 2;
        }
        return binary.toString();
    }

    // Function to print the binary representation
    public static void printBinary(String binary) {
        System.out.println("The binary representation is: " + binary);
    }

    // Main function to drive the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user for input
        System.out.print("Enter a decimal number: ");
        int decimal = scanner.nextInt();

        // Convert the decimal number to binary
        String binary = convertToBinary(decimal);

        // Print the binary representation
        printBinary(binary);

        // Close the scanner
        scanner.close();
    }
}

