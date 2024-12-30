/**
 * This program is a delightful journey into the world of number systems.
 * It takes a decimal number, which is a number in base 10, and converts it into its binary equivalent, which is a number in base 2.
 * Binary numbers are the foundation of all modern computing, and understanding how to convert between these systems is a fundamental skill for any programmer.
 * This program will guide you through the process with verbose and detailed comments to ensure you understand every step of the way.
 */

import java.util.Scanner;

public class DecimalToBinaryConverter {

    // This is the main method, the entry point of our program.
    public static void main(String[] args) {
        // Creating a Scanner object to read input from the user.
        Scanner scanner = new Scanner(System.in);

        // Prompting the user to enter a decimal number.
        System.out.println("Please enter a decimal number:");

        // Reading the user input and storing it in a variable.
        int decimalNumber = scanner.nextInt();

        // Calling the method to convert the decimal number to binary.
        String binaryNumber = convertDecimalToBinary(decimalNumber);

        // Displaying the binary equivalent of the entered decimal number.
        System.out.println("The binary equivalent of " + decimalNumber + " is " + binaryNumber);

        // Closing the scanner object to free up resources.
        scanner.close();
    }

    // This method converts a decimal number to its binary equivalent.
    public static String convertDecimalToBinary(int decimal) {
        // Initializing an empty string to store the binary number.
        String binary = "";

        // Using a while loop to perform the conversion.
        while (decimal > 0) {
            // Getting the remainder when the decimal number is divided by 2.
            int remainder = decimal % 2;

            // Adding the remainder to the binary string.
            binary = remainder + binary;

            // Dividing the decimal number by 2 to get the next digit.
            decimal = decimal / 2;
        }

        // Returning the binary number.
        return binary;
    }
}

