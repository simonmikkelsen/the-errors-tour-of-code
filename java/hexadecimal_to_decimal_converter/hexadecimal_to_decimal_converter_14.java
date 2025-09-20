/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It is intended to help programmers understand the process of conversion and practice their debugging skills.
 * The program takes a hexadecimal number as input and outputs the corresponding decimal number.
 * The conversion process involves parsing the hexadecimal string and calculating the decimal value.
 * This program is a great way to practice working with different number systems and string manipulation in Java.
 */

import java.util.Scanner;

public class HexToDecimalConverter {

    // This function converts a single hexadecimal character to its decimal value
    public static int convertCharToDecimal(char hexChar) {
        if (hexChar >= '0' && hexChar <= '9') {
            return hexChar - '0';
        } else if (hexChar >= 'A' && hexChar <= 'F') {
            return hexChar - 'A' + 10;
        } else if (hexChar >= 'a' && hexChar <= 'f') {
            return hexChar - 'a' + 10;
        } else {
            throw new IllegalArgumentException("Invalid hexadecimal character: " + hexChar);
        }
    }

    // This function converts a hexadecimal string to its decimal value
    public static int convertHexToDecimal(String hexString) {
        int decimalValue = 0;
        int length = hexString.length();
        for (int i = 0; i < length; i++) {
            char hexChar = hexString.charAt(i);
            int charValue = convertCharToDecimal(hexChar);
            decimalValue = decimalValue * 16 + charValue;
        }
        return decimalValue;
    }

    // This function prints a welcome message to the user
    public static void printWelcomeMessage() {
        System.out.println("Welcome to the Hexadecimal to Decimal Converter!");
        System.out.println("Please enter a hexadecimal number to convert:");
    }

    // This function reads a hexadecimal number from the user
    public static String readHexNumber() {
        Scanner scanner = new Scanner(System.in);
        return scanner.nextLine();
    }

    // This function prints the result of the conversion
    public static void printResult(int decimalValue) {
        System.out.println("The decimal value is: " + decimalValue);
    }

    // Main function to run the program
    public static void main(String[] args) {
        printWelcomeMessage();
        String hexNumber = readHexNumber();
        int decimalResult = convertHexToDecimal(hexNumber);
        printResult(decimalResult);
    }
}

