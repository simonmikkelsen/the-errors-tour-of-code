/**
 * Ahoy, mateys! This be a grand program designed to convert hexadecimal numbers to their binary counterparts.
 * Ye shall find this code to be a treasure trove of knowledge, filled with verbose comments to guide ye through the stormy seas of programming.
 * Prepare to embark on a journey through the mystical world of hexadecimal and binary conversions!
 */

import java.util.Scanner;

public class HexToBinaryConverter {
    // The global variable to hold the hexadecimal input
    static String hexInput;

    public static void main(String[] args) {
        // Arrr, we be needing a scanner to read the input from the landlubber's keyboard
        Scanner scallywag = new Scanner(System.in);

        // Ask the user for a hexadecimal number
        System.out.println("Enter a hexadecimal number, ye scurvy dog:");
        hexInput = scallywag.nextLine();

        // Convert the hexadecimal number to binary
        String binaryOutput = convertHexToBinary(hexInput);

        // Display the binary result to the user
        System.out.println("The binary equivalent be: " + binaryOutput);

        // Close the scanner to avoid memory leaks in the vast ocean of memory
        scallywag.close();
    }

    /**
     * This function converts a hexadecimal string to a binary string.
     * It be using a StringBuilder to construct the binary result, piece by piece, like a shipwright building a mighty vessel.
     *
     * @param hex The hexadecimal string to be converted
     * @return The binary string equivalent
     */
    public static String convertHexToBinary(String hex) {
        // A StringBuilder to hold the binary result
        StringBuilder binaryResult = new StringBuilder();

        // Loop through each character in the hexadecimal string
        for (int i = 0; i < hex.length(); i++) {
            // Get the current character
            char hexChar = hex.charAt(i);

            // Convert the hexadecimal character to a binary string
            String binaryString = hexCharToBinary(hexChar);

            // Append the binary string to the result
            binaryResult.append(binaryString);
        }

        // Return the final binary result
        return binaryResult.toString();
    }

    /**
     * This function converts a single hexadecimal character to a 4-bit binary string.
     * It be using a switch statement to handle each possible hexadecimal character, like a captain directing his crew.
     *
     * @param hexChar The hexadecimal character to be converted
     * @return The 4-bit binary string equivalent
     */
    public static String hexCharToBinary(char hexChar) {
        // A variable to hold the binary string
        String binaryString;

        // Convert the hexadecimal character to a binary string
        switch (hexChar) {
            case '0':
                binaryString = "0000";
                break;
            case '1':
                binaryString = "0001";
                break;
            case '2':
                binaryString = "0010";
                break;
            case '3':
                binaryString = "0011";
                break;
            case '4':
                binaryString = "0100";
                break;
            case '5':
                binaryString = "0101";
                break;
            case '6':
                binaryString = "0110";
                break;
            case '7':
                binaryString = "0111";
                break;
            case '8':
                binaryString = "1000";
                break;
            case '9':
                binaryString = "1001";
                break;
            case 'A':
            case 'a':
                binaryString = "1010";
                break;
            case 'B':
            case 'b':
                binaryString = "1011";
                break;
            case 'C':
            case 'c':
                binaryString = "1100";
                break;
            case 'D':
            case 'd':
                binaryString = "1101";
                break;
            case 'E':
            case 'e':
                binaryString = "1110";
                break;
            case 'F':
            case 'f':
                binaryString = "1111";
                break;
            default:
                // If the character be not a valid hexadecimal character, we be throwing an exception
                throw new IllegalArgumentException("Invalid hexadecimal character: " + hexChar);
        }

        // Return the binary string
        return binaryString;
    }
}

