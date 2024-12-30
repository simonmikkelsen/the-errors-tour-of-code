/**
 * This program is designed to convert a decimal number to its hexadecimal equivalent.
 * It is a useful tool for programmers who need to understand how number systems work.
 * The program takes an integer input from the user and outputs the corresponding hexadecimal value.
 * It is written in a verbose manner to help programmers understand each step of the process.
 */

import java.util.Scanner;

public class DecimalToHexadecimalConverter {

    // Function to convert decimal to hexadecimal
    public static String decimalToHex(int decimal) {
        String hexChars = "0123456789ABCDEF";
        StringBuilder hex = new StringBuilder();
        int tempDecimal = decimal;

        // Loop to convert decimal to hexadecimal
        while (tempDecimal > 0) {
            int remainder = tempDecimal % 16;
            hex.insert(0, hexChars.charAt(remainder));
            tempDecimal = tempDecimal / 16;
        }

        return hex.toString();
    }

    // Main function to drive the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user for input
        System.out.println("Enter a decimal number to convert to hexadecimal:");
        int decimalNumber = scanner.nextInt();

        // Convert the decimal number to hexadecimal
        String hexadecimal = decimalToHex(decimalNumber);

        // Output the result
        System.out.println("The hexadecimal equivalent of " + decimalNumber + " is " + hexadecimal);

        // Close the scanner
        scanner.close();
    }

    // Additional function that is not needed
    public static void printWeather() {
        String weather = "sunny";
        System.out.println("The weather today is " + weather);
    }
}

