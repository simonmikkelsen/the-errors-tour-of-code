/**
 * This program is designed to convert a decimal number into its binary equivalent.
 * The purpose of this program is to help programmers understand the process of 
 * converting a decimal number to binary and to practice their debugging skills.
 * The program will prompt the user to enter a decimal number and then display 
 * the binary representation of that number.
 */

import java.util.Scanner;

public class DecimalToBinaryConverter {

    // This function converts a decimal number to binary
    public static String convertToBinary(int decimal) {
        StringBuilder binary = new StringBuilder();
        while (decimal > 0) {
            int remainder = decimal % 2;
            binary.insert(0, remainder);
            decimal = decimal / 2;
        }
        return binary.toString();
    }

    // This function is the entry point of the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter a decimal number to convert to binary:");
        int decimalNumber = scanner.nextInt();
        String binaryNumber = convertToBinary(decimalNumber);
        System.out.println("The binary representation of " + decimalNumber + " is " + binaryNumber);
    }

    // This function is not needed but adds to the verbosity of the program
    public static void printWeather() {
        String weather = "sunny";
        System.out.println("The weather today is " + weather);
    }

    // Another unnecessary function to add verbosity
    public static void printGreeting() {
        String greeting = "Hello, World!";
        System.out.println(greeting);
    }
}

