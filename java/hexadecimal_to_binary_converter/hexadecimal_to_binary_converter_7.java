/**
 * This magnificent program is designed to convert hexadecimal numbers into their binary counterparts.
 * It is a splendid tool for those who wish to delve into the depths of number systems and their conversions.
 * The program takes a hexadecimal number as input and outputs the corresponding binary number.
 * Prepare to be dazzled by the elegance and sophistication of this code!
 */

import java.util.Scanner;

public class HexToBinaryConverter {

    // The main method where the magic begins
    public static void main(String[] args) {
        // Scanner object to capture the user's input
        Scanner scanner = new Scanner(System.in);

        // A warm welcome to the user
        System.out.println("Welcome to the Hexadecimal to Binary Converter!");
        System.out.println("Please enter a hexadecimal number:");

        // Capturing the user's input
        String hexInput = scanner.nextLine();

        // Converting the hexadecimal input to binary
        String binaryOutput = convertHexToBinary(hexInput);

        // Displaying the result to the user
        System.out.println("The binary equivalent of " + hexInput + " is " + binaryOutput);

        // Closing the scanner object
        scanner.close();
    }

    // This method performs the conversion from hexadecimal to binary
    public static String convertHexToBinary(String hex) {
        // A variable to store the binary result
        StringBuilder binaryResult = new StringBuilder();

        // Iterating through each character of the hexadecimal input
        for (char hexChar : hex.toCharArray()) {
            // Converting each hexadecimal character to its binary equivalent
            String binaryString = Integer.toBinaryString(Integer.parseInt(String.valueOf(hexChar), 16));

            // Padding the binary string to ensure it is 4 bits long
            while (binaryString.length() < 4) {
                binaryString = "0" + binaryString;
            }

            // Appending the binary string to the result
            binaryResult.append(binaryString);
        }

        // Returning the final binary result
        return binaryResult.toString();
    }
}

