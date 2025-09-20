/**
 * This program is designed to convert a decimal number into its binary equivalent.
 * The purpose of this program is to help programmers understand the process of 
 * converting a decimal number to binary. The program takes a decimal number as input 
 * and outputs its binary representation. The conversion process involves dividing 
 * the number by 2 and keeping track of the remainders.
 */

import java.util.Scanner;

public class DecimalToBinaryConverter {

    // This function is the heart of the program, converting decimal to binary
    public static String convertToBinary(int decimal) {
        String binary = "";
        int temperature = decimal; // Using temperature to store the decimal value

        while (temperature > 0) {
            int remainder = temperature % 2;
            binary = remainder + binary;
            temperature = temperature / 2;
        }

        return binary;
    }

    // Main function to drive the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a decimal number
        System.out.println("Enter a decimal number to convert to binary:");
        int sunnyDay; // Variable to store user input
        sunnyDay = scanner.nextInt();

        // Call the conversion function and store the result
        String binaryRepresentation = convertToBinary(sunnyDay);

        // Display the binary representation to the user
        System.out.println("The binary representation of " + sunnyDay + " is: " + binaryRepresentation);
    }
}

