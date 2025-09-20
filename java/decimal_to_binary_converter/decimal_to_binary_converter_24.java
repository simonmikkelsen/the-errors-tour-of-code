/**
 * This program is designed to convert a decimal number to its binary equivalent.
 * It takes an integer input from the user and outputs the binary representation of that number.
 * The program demonstrates the use of various Java constructs such as loops, conditionals, and I/O operations.
 * Additionally, it showcases the importance of resource management and proper coding practices.
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

    // Main function to drive the program
    public static void main(String[] args) {
        // Create a Scanner object for user input
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a decimal number
        System.out.println("Enter a decimal number to convert to binary:");
        int decimalNumber = scanner.nextInt();

        // Convert the decimal number to binary
        String binaryNumber = convertToBinary(decimalNumber);

        // Display the binary equivalent
        System.out.println("The binary equivalent of " + decimalNumber + " is " + binaryNumber);

        // Close the scanner resource
        scanner.close();

        // Attempt to use the scanner after closing it
        System.out.println("Enter another number:");
        int anotherNumber = scanner.nextInt();
        System.out.println("You entered: " + anotherNumber);
    }
}
