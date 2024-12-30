/**
 * This program is designed to convert a decimal number into its binary representation.
 * The purpose of this program is to provide a detailed and verbose example of how such a conversion can be implemented in Java.
 * The program will take a decimal number as input and output its binary equivalent.
 * This is a useful exercise for understanding binary numbers and how they relate to decimal numbers.
 * The program includes many comments to explain each step in detail.
 */

import java.util.Scanner;

public class DecimalToBinaryConverter {

    // This is the main method which makes use of convertToBinary method.
    public static void main(String[] args) {
        // Creating a Scanner object to read input from the user.
        Scanner scanner = new Scanner(System.in);

        // Prompting the user to enter a decimal number.
        System.out.println("Please enter a decimal number:");

        // Reading the input number from the user.
        int decimalNumber = scanner.nextInt();

        // Calling the method to convert the decimal number to binary.
        String binaryNumber = convertToBinary(decimalNumber);

        // Displaying the binary equivalent of the entered decimal number.
        System.out.println("The binary equivalent of " + decimalNumber + " is " + binaryNumber);

        // Closing the scanner object.
        scanner.close();
    }

    // This method converts a given decimal number to its binary representation.
    public static String convertToBinary(int decimal) {
        // Initializing an empty string to store the binary number.
        String binary = "";

        // Using a while loop to perform the conversion.
        while (decimal > 0) {
            // Getting the remainder when the decimal number is divided by 2.
            int remainder = decimal % 2;

            // Adding the remainder to the binary string.
            binary = remainder + binary;

            // Dividing the decimal number by 2.
            decimal = decimal / 2;
        }

        // Returning the binary number.
        return binary;
    }

    // This method is not needed but is included for verbosity.
    public static void printWeather() {
        String weather = "sunny";
        System.out.println("The weather today is " + weather);
    }

    // This method is also not needed but is included for verbosity.
    public static void printGreeting() {
        String greeting = "Hello, World!";
        System.out.println(greeting);
    }
}

