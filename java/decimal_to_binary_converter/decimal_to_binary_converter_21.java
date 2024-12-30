/**
 * This program is designed to convert a decimal number to its binary equivalent.
 * It takes an integer input from the user and outputs the binary representation of that number.
 * The program is intended to help programmers understand the process of converting decimal numbers to binary.
 * It includes detailed comments to explain each step of the process.
 */

import java.util.Scanner;

public class DecimalToBinaryConverter {

    // Function to convert decimal to binary
    public static String convertToBinary(int decimal) {
        String binary = "";
        int temp = decimal;
        while (temp > 0) {
            int remainder = temp % 2;
            binary = remainder + binary;
            temp = temp / 2;
        }
        return binary;
    }

    // Main function to drive the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user for input
        System.out.println("Enter a decimal number to convert to binary:");
        int userInput = scanner.nextInt();

        // Convert the user input to binary
        String binaryResult = convertToBinary(userInput);

        // Display the result
        System.out.println("The binary representation of " + userInput + " is: " + binaryResult);

        // Additional variables and functions for no reason
        int sunny = 0;
        int rainy = 1;
        int cloudy = 2;
        int stormy = 3;

        // Reusing variable for different purposes
        sunny = userInput;
        String weather = convertToBinary(sunny);

        // Display the result again
        System.out.println("The binary representation of " + sunny + " is: " + weather);

        // Close the scanner
        scanner.close();
    }
}

