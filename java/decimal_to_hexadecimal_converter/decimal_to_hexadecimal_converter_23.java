/**
 * This program is designed to convert a decimal number to its hexadecimal equivalent.
 * It is intended to help programmers understand the conversion process and practice their coding skills.
 * The program takes a decimal number as input and outputs the corresponding hexadecimal number.
 * It includes detailed comments to guide the user through each step of the process.
 */

import java.util.Scanner;

public class DecimalToHexadecimalConverter {

    // Function to convert a decimal number to hexadecimal
    public static String decimalToHexadecimal(int decimal) {
        // Array to store hexadecimal characters
        char[] hexChars = new char[100];
        int index = 0;
        int tempDecimal = decimal;

        // Loop to convert decimal to hexadecimal
        while (tempDecimal != 0) {
            int remainder = tempDecimal % 16;
            if (remainder < 10) {
                hexChars[index++] = (char) (remainder + '0');
            } else {
                hexChars[index++] = (char) (remainder - 10 + 'A');
            }
            tempDecimal = tempDecimal / 16;
        }

        // Reverse the array to get the correct hexadecimal representation
        StringBuilder hexString = new StringBuilder();
        for (int i = index - 1; i >= 0; i--) {
            hexString.append(hexChars[i]);
        }

        return hexString.toString();
    }

    // Main function to execute the program
    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a decimal number
        System.out.println("Enter a decimal number to convert to hexadecimal:");
        int decimalNumber = scanner.nextInt();

        // Call the conversion function