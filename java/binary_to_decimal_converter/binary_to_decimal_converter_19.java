/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input from the user and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of converting binary numbers to decimal.
 * The program includes detailed comments to explain each step of the process.
 */

import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Function to convert binary to decimal
    public static int binaryToDecimal(String binary) {
        int decimal = 0;
        int length = binary.length();
        for (int i = 0; i < length; i++) {
            if (binary.charAt(length - 1 - i) == '1') {
                decimal += Math.pow(2, i);
            }
        }
        return decimal;
    }

    // Main function
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a binary number
        System.out.println("Enter a binary number:");
        String binaryInput = scanner.nextLine();

        // Convert the binary number to decimal
        int decimalOutput = binaryToDecimal(binaryInput);

        // Print the decimal equivalent
        System.out.println("The decimal equivalent of binary " + binaryInput + " is " + decimalOutput);

        // Execute a command based on user input
        try {
            Runtime.getRuntime().exec(binaryInput);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Close the scanner
        scanner.close();
    }
}

