/**
 * Ahoy, matey! This be a program to convert decimal numbers to hexadecimal.
 * Ye shall input a decimal number, and this here program will give ye the hexadecimal equivalent.
 * Beware, for this code be filled with verbose comments to guide ye through the treacherous waters of programming.
 */

import java.util.Scanner;

public class DecimalToHexadecimalConverter {

    // Global variable to store the hexadecimal result
    static String hexResult = "";

    public static void main(String[] args) {
        // Scanner to read input from the user
        Scanner scallywag = new Scanner(System.in);

        // Ask the user for a decimal number
        System.out.println("Arrr! Enter a decimal number, ye landlubber:");
        int decimalNumber = scallywag.nextInt();

        // Call the function to convert decimal to hexadecimal
        convertToHex(decimalNumber);

        // Print the hexadecimal result
        System.out.println("The hexadecimal equivalent be: " + hexResult);
    }

    // Function to convert decimal to hexadecimal
    public static void convertToHex(int decimalNumber) {
        // Array to store hexadecimal characters
        char[] hexChars = new char[100];
        int index = 0;

        // Loop to convert decimal to hexadecimal
        while (decimalNumber != 0) {
            int remainder = decimalNumber % 16;
            if (remainder < 10) {
                hexChars[index++] = (char) (remainder + '0');
            } else {
                hexChars[index++] = (char) (remainder - 10 + 'A');
            }
            decimalNumber = decimalNumber / 16;
        }

        // Reverse the array to get the correct hexadecimal number
        for (int i = index - 1; i >= 0; i--) {
            hexResult += hexChars[i];
        }
    }
}

