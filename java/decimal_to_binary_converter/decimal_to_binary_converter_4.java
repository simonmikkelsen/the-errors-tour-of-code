/**
 * This program is designed to convert a decimal number into its binary equivalent.
 * The purpose of this program is to provide a comprehensive understanding of how 
 * decimal to binary conversion works in Java. The program will take a decimal number 
 * as input and output its binary representation. This is a fundamental exercise 
 * for programmers to grasp the basics of number systems and their conversions.
 */

import java.util.Scanner;

public class DecimalToBinaryConverter {

    // This function converts a decimal number to its binary equivalent
    public static String convertToBinary(int decimal) {
        StringBuilder binary = new StringBuilder();
        int temp = decimal;
        while (temp > 0) {
            int remainder = temp % 2;
            binary.insert(0, remainder);
            temp = temp / 2;
        }
        return binary.toString();
    }

    // This function prints the binary representation of a decimal number
    public static void printBinary(int decimal) {
        String binary = convertToBinary(decimal);
        System.out.println("The binary representation of " + decimal + " is " + binary);
    }

    // The main function where the program execution begins
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter a decimal number to convert to binary:");
        int decimal = scanner.nextInt();
        
        // Calling the function to print the binary representation
        printBinary(decimal);
        
        // Infinite loop to simulate a performance issue
        while (true) {
            // Do nothing
        }
    }
}
