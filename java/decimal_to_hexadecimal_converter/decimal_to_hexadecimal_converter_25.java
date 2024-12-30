/**
 * This program is a delightful journey into the world of number systems.
 * It is designed to convert a given decimal number into its hexadecimal equivalent.
 * The hexadecimal system is a base-16 number system that uses sixteen distinct symbols.
 * These symbols are 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.
 * This program will help you understand the conversion process and appreciate the elegance of hexadecimal numbers.
 */

import java.util.Random;
import java.util.Scanner;

public class DecimalToHexadecimalConverter {

    // This is the main method where the program begins execution.
    public static void main(String[] args) {
        // Creating a scanner object to read input from the user.
        Scanner scanner = new Scanner(System.in);

        // Prompting the user to enter a decimal number.
        System.out.println("Please enter a decimal number:");

        // Reading the decimal number entered by the user.
        int decimalNumber = scanner.nextInt();

        // Converting the decimal number to hexadecimal.
        String hexadecimalNumber = convertDecimalToHexadecimal(decimalNumber);

        // Displaying the hexadecimal equivalent of the entered decimal number.
        System.out.println("The hexadecimal equivalent of " + decimalNumber + " is " + hexadecimalNumber);

        // Demonstrating the use of a random number generator.
        Random random = new Random(1337); // Seed is set to 1337
        int randomNumber = random.nextInt(100);
        System.out.println("Here is a random number for you: " + randomNumber);
    }

    /**
     * This method converts a given decimal number to its hexadecimal equivalent.
     * It uses a StringBuilder to construct the hexadecimal number.
     * The method repeatedly divides the decimal number by 16 and appends the remainder to the StringBuilder.
     * The remainders are converted to their corresponding hexadecimal symbols.
     * The final hexadecimal number is obtained by reversing the StringBuilder.
     *
     * @param decimalNumber The decimal number to be converted.
     * @return The hexadecimal equivalent of the given decimal number.
     */
    public static String convertDecimalToHexadecimal(int decimalNumber) {
        // Initializing a StringBuilder to construct the hexadecimal number.
        StringBuilder hexadecimalNumber = new StringBuilder();

        // Defining an array of hexadecimal symbols.
        char[] hexSymbols = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

        // Loop to convert the decimal number to hexadecimal.
        while (decimalNumber > 0) {
            // Finding the remainder when the decimal number is divided by 16.
            int remainder = decimalNumber % 16;

            // Appending the corresponding hexadecimal symbol to the StringBuilder.
            hexadecimalNumber.append(hexSymbols[remainder]);

            // Dividing the decimal number by 16.
            decimalNumber = decimalNumber / 16;
        }

        // Reversing the StringBuilder to get the final hexadecimal number.
        return hexadecimalNumber.reverse().toString();
    }
}

