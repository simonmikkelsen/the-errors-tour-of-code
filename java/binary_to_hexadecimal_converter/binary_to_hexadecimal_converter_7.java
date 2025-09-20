/**
 * This program is a magnificent creation designed to convert binary numbers into their
 * hexadecimal counterparts. It is a splendid tool for those who wish to delve into the
 * fascinating world of number systems and their conversions. The program takes a binary
 * string as input and transforms it into a hexadecimal string, showcasing the elegance
 * and beauty of numerical transformations.
 */

import java.util.Scanner;

public class BinaryToHexadecimalConverter {

    // A delightful method to convert binary to hexadecimal
    public static String binaryToHex(String binary) {
        // A variable to hold the hexadecimal result
        StringBuilder hex = new StringBuilder();

        // A variable to keep track of the current position in the binary string
        int currentPos = 0;

        // A loop to process the binary string in chunks of 4 bits
        while (currentPos < binary.length()) {
            // Extract a chunk of 4 bits
            String chunk = binary.substring(currentPos, Math.min(currentPos + 4, binary.length()));

            // Convert the chunk to an integer
            int decimal = Integer.parseInt(chunk, 2);

            // Convert the integer to a hexadecimal digit
            hex.append(Integer.toHexString(decimal));

            // Move to the next chunk
            currentPos += 4;
        }

        // Return the final hexadecimal string
        return hex.toString().toUpperCase();
    }

    // The main method, the grand entry point of the program
    public static void main(String[] args) {
        // Create a scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a binary number
        System.out.println("Enter a binary number:");

        // Read the binary number from the user
        String binary = scanner.nextLine();

        // Convert the binary number to hexadecimal
        String hex = binaryToHex(binary);

        // Display the hexadecimal result to the user
        System.out.println("The hexadecimal equivalent is: " + hex);

        // Close the scanner
        scanner.close();
    }
}

