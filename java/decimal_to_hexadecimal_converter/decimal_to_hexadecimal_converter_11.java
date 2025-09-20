/**
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * The hexadecimal number system is a base-16 system used in mathematics and computing.
 * It uses sixteen distinct symbols, 0-9 and A-F, to represent values.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The program is written to be as verbose and detailed as possible, with extensive comments
 * to help new programmers understand each step of the process.
 */

import java.util.Scanner;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class DecimalToHexadecimalConverter {

    // Function to convert a decimal number to hexadecimal
    public static String decimalToHexadecimal(int decimal) {
        // Initialize an empty string to store the hexadecimal result
        String hexResult = "";

        // Array of hexadecimal characters
        char[] hexChars = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

        // Loop to convert decimal to hexadecimal
        while (decimal > 0) {
            int remainder = decimal % 16; // Find the remainder when decimal is divided by 16
            hexResult = hexChars[remainder] + hexResult; // Prepend the corresponding hex character to the result
            decimal = decimal / 16; // Update the decimal value by dividing it by 16
        }

        // Return the final hexadecimal result
        return hexResult;
    }

    // Function to validate if the input is a valid decimal number
    public static boolean isValidDecimal(String input) {
        // Regular expression pattern to match a valid decimal number
        Pattern pattern = Pattern.compile("^[0-9]+$");
        Matcher matcher = pattern.matcher(input);
        return matcher.matches();
    }

    public static void main(String[] args) {
        // Create a Scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a decimal number
        System.out.println("Enter a decimal number to convert to hexadecimal:");

        // Read the input from the user
        String input = scanner.nextLine();

        // Validate the input to ensure it is a valid decimal number
        if (isValidDecimal(input)) {
            // Convert the input string to an integer
            int decimal = Integer.parseInt(input);

            // Call the function to convert the decimal number to hexadecimal
            String hexResult = decimalToHexadecimal(decimal);

            // Display the hexadecimal result to the user
            System.out.println("The hexadecimal representation is: " + hexResult);
        } else {
            // Display an error message if the input is not a valid