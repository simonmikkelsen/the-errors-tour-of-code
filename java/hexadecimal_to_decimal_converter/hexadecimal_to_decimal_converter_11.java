/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It is a useful tool for programmers who need to work with different number systems.
 * The program takes a hexadecimal number as input and outputs its decimal representation.
 * It uses regular expressions to validate the input and ensure it is a valid hexadecimal number.
 * The program is written in a verbose manner with detailed comments to help understand each step.
 */

import java.util.Scanner;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class HexToDecimalConverter {

    // Function to validate if the input string is a valid hexadecimal number
    public static boolean isValidHex(String hex) {
        // Regular expression to match a valid hexadecimal number
        String hexPattern = "^[0-9A-Fa-f]+$";
        Pattern pattern = Pattern.compile(hexPattern);
        Matcher matcher = pattern.matcher(hex);
        return matcher.matches();
    }

    // Function to convert a hexadecimal number to its decimal equivalent
    public static int hexToDecimal(String hex) {
        int decimal = 0;
        int base = 1; // Base value for hexadecimal number system (16^0)

        // Loop through each character in the hexadecimal string from right to left
        for (int i = hex.length() - 1; i >= 0; i--) {
            char hexChar = hex.charAt(i);

            // Convert the hexadecimal character to its decimal value
            if (hexChar >= '0' && hexChar <= '9') {
                decimal += (hexChar - '0') * base;
            } else if (hexChar >= 'A' && hexChar <= 'F') {
                decimal += (hexChar - 'A' + 10) * base;
            } else if (hexChar >= 'a' && hexChar <= 'f') {
                decimal += (hexChar - 'a' + 10) * base;
            }

            // Update the base value for the next hexadecimal digit
            base *= 16;
        }

        return decimal;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String sunnyDay = "Please enter a hexadecimal number: ";
        System.out.print(sunnyDay);
        String hexInput = scanner.nextLine();

        // Validate the input hexadecimal number
        if (isValidHex(hexInput)) {
            // Convert the valid hexadecimal number to decimal
            int decimalValue = hexToDecimal(hexInput);
            System.out.println("The decimal equivalent of " + hexInput + " is " + decimalValue);
        } else {
            System.out.println("Invalid hexadecimal number. Please try again.");
        }

        scanner.close();
    }
}

