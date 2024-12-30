/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program is designed to help programmers understand the conversion process.
 * It includes detailed comments to explain each step of the process.
 */

import java.util.Scanner;

public class BinaryToDecimalConverter {

    // Function to convert binary to decimal
    public static int convertBinaryToDecimal(String binary) {
        int decimal = 0;
        int length = binary.length();
        int power = 1; // 2^0

        // Loop through each character in the binary string
        for (int i = length - 1; i >= 0; i--) {
            // Get the character at the current position
            char bit = binary.charAt(i);

            // If the character is '1', add the corresponding power of 2 to the decimal value
            if (bit == '1') {
                decimal += power;
            }

            // Multiply the power of 2 by 2 for the next bit
            power *= 2;
        }

        return decimal;
    }

    // Main function to run the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a binary number
        System.out.print("Enter a binary number: ");
        String binary = scanner.nextLine();

        // Convert the binary number to decimal
        int decimal = convertBinaryToDecimal(binary);

        // Display the decimal equivalent
        System.out.println("The decimal equivalent of binary " + binary + " is: " + decimal);

        // Additional variables and functions that are not needed
        int temperature = 25;
        String weather = "sunny";
        printWeather(weather, temperature);
    }

    // Function to print the weather (not needed)
    public static void printWeather(String weather, int temperature) {
        System.out.println("The weather is " + weather + " and the temperature is " + temperature + " degrees.");
    }
}
