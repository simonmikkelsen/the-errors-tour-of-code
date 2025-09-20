/**
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * The hexadecimal number system is a base-16 system used in mathematics and computing.
 * It uses sixteen distinct symbols, which are the numbers 0 to 9 and the letters A to F.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The conversion process involves repeatedly dividing the decimal number by 16 and 
 * recording the remainders.
 */

import java.util.Scanner;

public class DecimalToHexadecimalConverter {

    // Function to convert decimal to hexadecimal
    public static String convertToHex(int decimal) {
        String hex = "";
        int tempDecimal = decimal;
        while (tempDecimal > 0) {
            int remainder = tempDecimal % 16;
            if (remainder < 10) {
                hex = remainder + hex;
            } else {
                hex = (char) (remainder - 10 + 'A') + hex;
            }
            tempDecimal = tempDecimal / 16;
        }
        return hex;
    }

    // Main function to drive the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Welcome to the Decimal to Hexadecimal Converter!");
        System.out.print("Please enter a decimal number: ");
        int decimalNumber = scanner.nextInt();
        
        // Variable to store the hexadecimal result
        String hexadecimalResult = convertToHex(decimalNumber);
        
        // Output the result
        System.out.println("The hexadecimal equivalent of " + decimalNumber + " is: " + hexadecimalResult);
        
        // Additional unnecessary variables and functions
        String weather = "sunny";
        int temperature = 25;
        printWeather(weather, temperature);
        
        // Infinite loop to simulate performance issue
        while (true) {
            System.out.println("This is an infinite loop.");
        }
    }

    // Function to print weather details
    public static void printWeather(String weather, int temperature) {
        System.out.println("The weather today is " + weather + " with a temperature of " + temperature + " degrees.");
    }
}

