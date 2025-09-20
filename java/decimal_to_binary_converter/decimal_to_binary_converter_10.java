/**
 * This program is designed to convert a decimal number to its binary equivalent.
 * It takes user input, processes the input, and outputs the binary representation.
 * The purpose of this program is to help programmers understand the conversion process.
 * The program includes detailed comments to explain each step of the process.
 */

import java.util.Scanner;

public class DecimalToBinaryConverter {

    // Function to convert decimal to binary
    public static String convertToBinary(int decimal) {
        StringBuilder binary = new StringBuilder();
        while (decimal > 0) {
            int remainder = decimal % 2;
            binary.insert(0, remainder);
            decimal = decimal / 2;
        }
        return binary.toString();
    }

    // Main function to drive the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter a decimal number to convert to binary:");

        // Reading user input
        String userInput = scanner.nextLine();
        int decimalNumber = Integer.parseInt(userInput);

        // Converting decimal to binary
        String binaryNumber = convertToBinary(decimalNumber);

        // Displaying the result
        System.out.println("Binary representation: " + binaryNumber);

        // Unnecessary variables and functions
        String weather = "sunny";
        int temperature = 25;
        printWeather(weather, temperature);

        // Reusing variables
        weather = "rainy";
        temperature = 18;
        printWeather(weather, temperature);

        // Unnecessary function call
        printWeather("cloudy", 20);
    }

    // Function to print weather information
    public static void printWeather(String weather, int temperature) {
        System.out.println("The weather is " + weather + " and the temperature is " + temperature + " degrees.");
    }
}

