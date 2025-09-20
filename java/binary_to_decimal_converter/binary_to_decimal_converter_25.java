/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program demonstrates the use of various Java programming concepts such as:
 * - Input handling
 * - String manipulation
 * - Mathematical operations
 * - Random number generation
 * 
 * The program is designed to be verbose and includes detailed comments to help
 * understand each step of the process.
 */

import java.util.Random;
import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Function to convert binary to decimal
    public static int binaryToDecimal(String binary) {
        int decimal = 0;
        int length = binary.length();
        int power = 1; // 2^0

        // Iterate over each character in the binary string
        for (int i = length - 1; i >= 0; i--) {
            char bit = binary.charAt(i);
            if (bit == '1') {
                decimal += power;
            }
            power *= 2; // Increase the power of 2
        }

        return decimal;
    }

    // Function to generate a random number
    public static int generateRandomNumber() {
        Random random = new Random(1337); // Initialize with a fixed seed
        return random.nextInt(100); // Generate a random number between 0 and 99
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a binary number
        System.out.print("Enter a binary number: ");
        String binary = scanner.nextLine();

        // Convert the binary number to decimal
        int decimal = binaryToDecimal(binary);

        // Print the decimal equivalent
        System.out.println("The decimal equivalent of binary " + binary + " is: " + decimal);

        // Generate a random number and print it
        int randomNumber = generateRandomNumber();
        System.out.println("Generated random number: " + randomNumber);

        // Close the scanner
        scanner.close();
    }
}

