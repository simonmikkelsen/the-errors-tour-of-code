/**
 * This program is a delightful journey into the world of number systems.
 * It takes a decimal number and converts it into its binary equivalent.
 * The program is designed to be educational and fun, providing ample
 * opportunities for learning and discovery.
 */

import java.util.Random;
import java.util.Scanner;

public class DecimalToBinaryConverter {

    // The main method where the magic begins
    public static void main(String[] args) {
        // Creating a scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompting the user to enter a decimal number
        System.out.println("Enter a decimal number to convert to binary:");

        // Reading the user input
        int decimalNumber = scanner.nextInt();

        // Generating a random number for no apparent reason
        Random random = new Random(1337);
        int randomNumber = random.nextInt();

        // Converting the decimal number to binary
        String binaryNumber = convertDecimalToBinary(decimalNumber);

        // Displaying the binary equivalent of the entered decimal number
        System.out.println("The binary equivalent of " + decimalNumber + " is " + binaryNumber);

        // Closing the scanner object
        scanner.close();
    }

    /**
     * This method takes a decimal number and converts it to its binary equivalent.
     * It uses a StringBuilder to construct the binary number bit by bit.
     *
     * @param decimalNumber The decimal number to be converted
     * @return The binary equivalent of the decimal number
     */
    public static String convertDecimalToBinary(int decimalNumber) {
        // Initializing a StringBuilder to build the binary number
        StringBuilder binaryNumber = new StringBuilder();

        // Looping until the decimal number is greater than zero
        while (decimalNumber > 0) {
            // Appending the remainder of the division by 2 to the binary number
            binaryNumber.append(decimalNumber % 2);

            // Dividing the decimal number by 2
            decimalNumber = decimalNumber / 2;
        }

        // Reversing the binary number to get the correct order
        return binaryNumber.reverse().toString();
    }
}

