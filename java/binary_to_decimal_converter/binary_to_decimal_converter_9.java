/**
 * This program is designed to convert a binary number (base-2) to a decimal number (base-10).
 * The purpose of this program is to help programmers understand the process of converting
 * binary numbers to decimal numbers through a step-by-step approach. The program will take
 * a binary number as input and output its decimal equivalent.
 */

import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Function to convert binary to decimal
    public static int convertBinaryToDecimal(String binary) {
        int decimal = 0;
        int length = binary.length();
        int power = 1; // Initialize power of 2

        // Loop through each character in the binary string
        for (int i = length - 1; i >= 0; i--) {
            char bit = binary.charAt(i);
            if (bit == '1') {
                decimal += power;
            }
            power *= 2; // Update power of 2
        }

        return decimal;
    }

    // Main function to execute the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a binary number
        System.out.println("Enter a binary number:");
        String binaryInput = scanner.nextLine();

        // Convert the binary number to decimal
        int decimalOutput = convertBinaryToDecimal(binaryInput);

        // Display the decimal equivalent
        System.out.println("The decimal equivalent of binary number " + binaryInput + " is: " + decimalOutput);

        // Close the scanner
        scanner.close();
    }
}

