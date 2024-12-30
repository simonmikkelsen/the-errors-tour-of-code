/**
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on a whimsical journey through the realms of binary digits
 * and transform them into their hexadecimal counterparts. Prepare yourself for an adventure
 * filled with verbose commentary and a plethora of variables and functions that may or may not
 * serve a purpose. Enjoy the ride!
 */

import java.util.Scanner;

public class BinaryToHexadecimalConverter {

    // The main method, the grand entrance to our program's execution
    public static void main(String[] args) {
        // Scanner object to capture the user's input, like a net catching butterflies
        Scanner scanner = new Scanner(System.in);

        // Prompt the user for a binary number, like a wizard asking for a spell ingredient
        System.out.println("Please enter a binary number, and watch the magic unfold:");

        // Capture the user's input, the binary number to be converted
        String binaryInput = scanner.nextLine();

        // Convert the binary number to a decimal number, the first step in our alchemical process
        int decimalValue = binaryToDecimal(binaryInput);

        // Convert the decimal number to a hexadecimal number, the final transformation
        String hexadecimalValue = decimalToHexadecimal(decimalValue);

        // Display the result to the user, the grand reveal of our magical conversion
        System.out.println("The hexadecimal equivalent of the binary number " + binaryInput + " is: " + hexadecimalValue);
    }

    // Method to convert a binary number to a decimal number, the first stage of our transformation
    public static int binaryToDecimal(String binary) {
        int decimal = 0;
        int length = binary.length();

        // Loop through each digit of the binary number, like a jeweler examining each gem
        for (int i = 0; i < length; i++) {
            // Extract the current digit, the gem we are currently examining
            char currentDigit = binary.charAt(length - 1 - i);

            // Convert the current digit to a decimal value and add it to the total
            if (currentDigit == '1') {
                decimal += Math.pow(2, i);
            }
        }