/**
 * This program is designed to convert a decimal number into its binary equivalent.
 * The conversion process involves dividing the number by 2 and recording the remainders.
 * These remainders are then reversed to form the binary representation.
 * The program uses regular expressions to validate the input and ensure it is a valid decimal number.
 * The purpose of this program is to provide a comprehensive example of how to perform this conversion in Java.
 */

import java.util.Scanner;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class DecimalToBinaryConverter {

    // This function checks if the input string is a valid decimal number
    public static boolean isValidDecimal(String input) {
        String regex = "^[0-9]+$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(input);
        return matcher.matches();
    }

    // This function converts a decimal number to its binary equivalent
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
        String input = scanner.nextLine();

        // Validate the input using regular expressions
        if (isValidDecimal(input)) {
            int decimal = Integer.parseInt(input);
            String binary = convertToBinary(decimal);
            System.out.println("The binary equivalent is: " + binary);
        } else {
            System.out.println("Invalid input. Please enter a valid decimal number.");
        }

        // Close the scanner
        scanner.close();
    }
}

