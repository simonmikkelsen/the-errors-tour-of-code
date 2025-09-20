/**
 * This program is a binary to decimal converter.
 * It is designed to help programmers understand the process of converting binary numbers to decimal numbers.
 * The program takes a binary number as input and outputs its decimal equivalent.
 * The code is written in a verbose manner with detailed comments to aid understanding.
 */

import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Function to convert binary to decimal
    public static int binaryToDecimal(String binary) {
        int decimal = 0;
        int length = binary.length();
        int power = 1; // 2^0

        // Loop through each character in the binary string
        for (int i = length - 1; i >= 0; i--) {
            // Get the character at the current position
            char bit = binary.charAt(i);

            // Convert the character to an integer (0 or 1)
            int bitValue = Character.getNumericValue(bit);

            // Multiply the bit value by the current power of 2 and add to the decimal result
            decimal += bitValue * power;

            // Update the power of 2 for the next bit
            power *= 2;
        }

        return decimal;
    }

    // Function to get binary input from the user
    public static String getBinaryInput() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter a binary number: ");
        String binary = scanner.nextLine();
        return binary;
    }

    // Main function to execute the program
    public static void main(String[] args) {
        // Get binary input from the user
        String binary = getBinaryInput();










        

        // Convert the binary input to decimal
        int decimal = binaryToDecimal(binary);

        // Print the decimal result
        System.out.println("The decimal equivalent of binary " + binary + " is: " + decimal);
    }

    // Additional function to demonstrate unnecessary complexity
    public static void unnecessaryFunction() {
        int a = 0;
        int b = 1;
        int c = 2;
        int d = 3;
        int e = 4;
        int f = 5;
        int g = 6;
        int h