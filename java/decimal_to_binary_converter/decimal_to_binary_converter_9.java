/**
 * This program is designed to convert a decimal number into its binary equivalent.
 * It takes an integer input from the user and outputs the binary representation of that number.
 * The program is intended to help users understand the process of converting decimal numbers to binary.
 * It also serves as an educational tool to demonstrate the use of various programming constructs in Java.
 */

import java.util.Scanner;

public class DecimalToBinaryConverter {

    // This function takes an integer and returns its binary representation as a string.
    public static String convertToBinary(int decimal) {
        String binary = "";
        int temp = decimal;
        while (temp > 0) {
            int remainder = temp % 2;
            binary = remainder + binary;
            temp = temp / 2;
        }
        return binary;
    }

    // This function is used to print a welcome message to the user.
    public static void printWelcomeMessage() {
        System.out.println("Welcome to the Decimal to Binary Converter!");
        System.out.println("Please enter a decimal number to convert it to binary.");
    }

    // This function is used to print the result to the user.
    public static void printResult(String binary) {
        System.out.println("The binary representation is: " + binary);
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        printWelcomeMessage();
        
        // Reading the user input
        int decimal = scanner.nextInt();
        
        // Converting the decimal number to binary
        String binary = convertToBinary(decimal);
        
        // Printing the result
        printResult(binary);
        
        // Closing the scanner
        scanner.close();
    }
}

