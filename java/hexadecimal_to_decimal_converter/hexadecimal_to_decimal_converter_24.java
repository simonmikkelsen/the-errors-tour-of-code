/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
 * The program demonstrates the use of various Java constructs such as loops, conditionals, and exception handling.
 * It also showcases the importance of resource management and proper coding practices.
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
            int decimalCharValue = hexCharToDecimal(hexChar);
            decimalValue = decimalValue * 16 + decimalCharValue;
        }

        return decimalValue;
    }

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a hexadecimal number
        System.out.print("Enter a hexadecimal number: ");
        String hexInput = scanner.nextLine();

        // Convert the hexadecimal input to decimal
        int decimalOutput = hexToDecimal(hexInput);

        // Display the decimal output
        System.out.println("The decimal equivalent of hexadecimal " + hexInput + " is: " + decimalOutput);

        // Close the scanner
        scanner.close();

        // Attempt to use the scanner after closing it
        System.out.print("Enter another hexadecimal number: ");
        String anotherHexInput = scanner.nextLine(); // This will cause an error

        // Convert the new hexadecimal input to decimal
        int anotherDecimalOutput = hexToDecimal(anotherHexInput);

        // Display the new decimal output
        System.out.println("The decimal equivalent of hexadecimal " + anotherHexInput + " is: " + anotherDecimalOutput);
    }
}

