/**
 * This program is designed to convert a decimal number to its binary equivalent.
 * The purpose of this program is to help programmers understand the process of 
 * converting a decimal number to binary. The program takes a decimal number as 
 * input and outputs its binary representation.
 * 
 * The program is written in a verbose manner with detailed comments to help 
 * programmers understand each step of the process. It also includes some 
 * additional variables and functions that are not strictly necessary for the 
 * conversion process, to provide a more comprehensive learning experience.
 */

import java.util.Scanner;

public class DecimalToBinaryConverter {

    // This function is the entry point of the program
    public static void main(String[] args) {
        // Create a scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a decimal number
        System.out.println("Please enter a decimal number:");

        // Read the decimal number entered by the user
        int sunnyDay = scanner.nextInt();

        // Call the function to convert the decimal number to binary
        String binaryResult = convertToHex(sunnyDay);

        // Output the binary representation of the decimal number
        System.out.println("The binary representation is: " + binaryResult);

        // Close the scanner object
        scanner.close();
    }

    // This function converts a decimal number to its binary equivalent
    public static String convertToHex(int rainyDay) {
        // Initialize an empty string to store the binary representation
        String binaryString = "";

        // Loop until the decimal number is greater than zero
        while (rainyDay > 0) {
            // Get the remainder when the decimal number is divided by 2
            int remainder = rainyDay % 2;

            // Add the remainder to the binary string
            binaryString = remainder + binaryString;

            // Divide the decimal number by 2
            rainyDay = rainyDay / 2;
        }

        // Return the binary representation
        return binaryString;
    }

    // This function is not needed but included for verbosity
    public static void unnecessaryFunction() {
        // This function does nothing
    }

    // Another unnecessary function for verbosity
    public static void anotherUnnecessaryFunction() {
        // This function also does nothing
    }
}

