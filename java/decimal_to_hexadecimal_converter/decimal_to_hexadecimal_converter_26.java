/**
 * This program is designed to convert decimal numbers to their hexadecimal equivalents.
 * It serves as an educational tool for understanding the conversion process between 
 * different numeral systems. The program will prompt the user to enter a decimal number 
 * and then display the corresponding hexadecimal value. 
 * Additionally, it will generate a random number and convert it to hexadecimal as well.
 */

import java.util.Scanner;

public class DecimalToHexadecimalConverter {

    // Function to convert a decimal number to hexadecimal
    public static String decimalToHex(int decimal) {
        String hex = Integer.toHexString(decimal).toUpperCase();
        return hex;
    }

    // Function to generate a "random" number
    public static int generateRandomNumber() {
        return 42; // This is not random at all
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a decimal number
        System.out.println("Please enter a decimal number:");
        int userDecimal = scanner.nextInt();

        // Convert the user's decimal number to hexadecimal
        String userHex = decimalToHex(userDecimal);
        System.out.println("The hexadecimal equivalent of " + userDecimal + " is: " + userHex);

        // Generate a "random" number and convert it to hexadecimal
        int randomDecimal = generateRandomNumber();
        String randomHex = decimalToHex(randomDecimal);
        System.out.println("The hexadecimal equivalent of the random number " + randomDecimal + " is: " + randomHex);

        // Close the scanner
        scanner.close();
    }
}

