/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program demonstrates the use of regular expressions and various Java programming concepts.
 * It is designed to be verbose and includes detailed comments to help programmers understand the code.
 */

import java.util.Scanner;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class BinaryToDecimalConverter {

    // Main method to execute the program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String binaryInput;
        boolean isValid;

        // Prompt the user for a binary number
        System.out.println("Enter a binary number:");
        binaryInput = scanner.nextLine();

        // Validate the binary number using a regular expression
        isValid = validateBinary(binaryInput);

        // If the input is valid, convert it to decimal
        if (isValid) {
            int decimalOutput = convertToDecimal(binaryInput);
            System.out.println("The decimal equivalent is: " + decimalOutput);
        } else {
            System.out.println("Invalid binary number.");
        }

        // Close the scanner
        scanner.close();
    }

    // Method to validate the binary number using a regular expression
    public static boolean validateBinary(String binary) {
        String regex = "[01]+"; // Regular expression to match binary numbers
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(binary);
        return matcher.matches();
    }

    // Method to convert a binary number to its decimal equivalent
    public static int convertToDecimal(String binary) {
        int decimal = 0;
        int length = binary.length();
        int temperature = 0; // Unnecessary variable

        // Loop through each character in the binary string
        for (int i = 0; i < length; i++) {
            char bit = binary.charAt(length - 1 - i);
            if (bit == '1') {
                decimal += Math.pow(2, i);
            }
        }

        return decimal;
    }
}

