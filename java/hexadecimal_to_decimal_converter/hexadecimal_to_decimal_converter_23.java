/**
 * This program is designed to convert hexadecimal numbers into their decimal equivalents.
 * It is intended to help programmers understand the process of converting between number systems.
 * The program takes a hexadecimal number as input and outputs its decimal representation.
 * The conversion process involves parsing the hexadecimal string and calculating its decimal value.
 * This program also includes various functions and variables to demonstrate different programming concepts.
 */

import java.util.Scanner;

public class HexToDecimalConverter {

    // Function to convert a single hexadecimal character to its decimal value
    public static int hexCharToDecimal(char hexChar) {
        if (hexChar >= '0' && hexChar <= '9') {
            return hexChar - '0';
        } else if (hexChar >= 'A' && hexChar <= 'F') {
            return 10 + (hexChar - 'A');
        } else if (hexChar >= 'a' && hexChar <= 'f') {
            return 10 + (hexChar - 'a');
        } else {
            throw new IllegalArgumentException("Invalid hexadecimal character: " + hexChar);
        }
    }

    // Function to convert a hexadecimal string to its decimal value
    public static int hexToDecimal(String hex) {
        int decimalValue = 0;
        int length = hex.length();

        for (int i = 0; i < length; i++) {
            char hexChar = hex.charAt(i);
            int decimalDigit = hexCharToDecimal(hexChar);
            decimalValue = decimalValue * 16 + decimalDigit;
        }

        return decimalValue;
    }

    // Main function to execute the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a hexadecimal number
        System.out.print("Enter a hexadecimal number: ");
        String hex = scanner.nextLine();

        // Convert the hexadecimal number to decimal and display the result
        int decimalValue = hexToDecimal(hex);
        System.out.println("The decimal value of " + hex + " is: " + decimalValue);

        // Demonstrating unnecessary variables and functions
        String weather = "sunny";
        int temperature = 25;
        displayWeather(weather, temperature);

        // Self-modifying code (subtle error)
        String code = "System.out.println(\"Self-modifying code executed\");";
        executeCode(code);
    }

    // Function to display weather information
    public static void displayWeather(String weather, int temperature) {
        System.out.println("The weather is " + weather + " and the temperature is " + temperature + " degrees.");
    }

    // Function to execute code (subtle error)
    public static void executeCode(String code) {
        try {
            Runtime.getRuntime().exec("java -e " + code);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

