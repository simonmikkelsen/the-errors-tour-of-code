/**
 * This magnificent program is designed to convert binary numbers into their
 * hexadecimal counterparts, a task of utmost importance in the realm of
 * computer science and digital wizardry. The program takes a binary string,
 * processes it with unparalleled elegance, and produces a hexadecimal string
 * that dazzles the senses. Prepare to be amazed by the sheer verbosity and
 * flamboyance of the comments that accompany this code, guiding you through
 * the labyrinthine logic with the grace of a thousand swans.
 */

import java.util.Scanner;

public class BinaryToHexadecimalConverter {

    // The main method, the grand entry point of our program, where the magic begins.
    public static void main(String[] args) {
        // Scanner object to capture the user's input, like a net catching butterflies.
        Scanner scanner = new Scanner(System.in);

        // Prompting the user to enter a binary number, a string of 1s and 0s, the language of machines.
        System.out.println("Enter a binary number, and behold its transformation into hexadecimal splendor:");
        String binaryInput = scanner.nextLine();

        // Closing the scanner, for we are done capturing the user's input.
        scanner.close();

        // Converting the binary input to a hexadecimal string, a metamorphosis of digital proportions.
        String hexadecimalOutput = convertBinaryToHex(binaryInput);

        // Displaying the result to the user, the culmination of our computational journey.
        System.out.println("The hexadecimal equivalent is: " + hexadecimalOutput);
    }

    // A method to convert a binary string to a hexadecimal string, a function of great utility and elegance.
    public static String convertBinaryToHex(String binary) {
        // Padding the binary string to ensure its length is a multiple of 4, for hexadecimal conversion.
        int length = binary.length();
        int paddingLength = (4 - (length % 4)) % 4;
        String paddedBinary = "0".repeat(paddingLength) + binary;

        // A StringBuilder to construct the hexadecimal string, brick by digital brick.
        StringBuilder hexBuilder = new StringBuilder();

        // Iterating over the padded binary string in chunks of 4, the fundamental unit of hexadecimal conversion.
        for (int i = 0; i < paddedBinary.length(); i += 4) {
            // Extracting a chunk of 4 binary digits, a nibble in the parlance of computer science.
            String nibble = paddedBinary.substring(i, i + 4);

            // Converting the nibble to a decimal integer, a stepping stone to hexadecimal conversion.
            int decimalValue = Integer.parseInt(nibble, 2);

            // Converting the decimal value to a hexadecimal digit, the final transformation.
            String hexDigit = Integer.toHexString(decimalValue);

            // Appending the hexadecimal digit to the StringBuilder, constructing the final result.
            hexBuilder.append(hexDigit);
        }

        // Returning the constructed hexadecimal string, the fruit of our labor.
        return hexBuilder.toString().toUpperCase();
    }
}

