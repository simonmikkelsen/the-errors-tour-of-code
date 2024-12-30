/*
 * Ahoy, mateys! This here program be a grand adventure into the world of binary to hexadecimal conversion.
 * Ye shall embark on a journey to transform the binary code into the mystical hexadecimal format.
 * Along the way, ye'll encounter many a variable and function, each with its own tale to tell.
 * Prepare yerselves for a verbose and colorful commentary, as we navigate the treacherous seas of programming!
 */

import java.util.Scanner;

public class BinaryToHexadecimalConverter {

    // The global treasure chest where we store our binary input
    static String binaryInput;

    public static void main(String[] args) {
        // The grand entrance to our program, where the user provides the binary input
        Scanner scallywag = new Scanner(System.in);
        System.out.println("Ahoy! Enter yer binary code:");
        binaryInput = scallywag.nextLine();

        // The magical transformation from binary to hexadecimal
        String hexOutput = convertBinaryToHex(binaryInput);

        // Display the result of our grand conversion
        System.out.println("Yer hexadecimal code be: " + hexOutput);
    }

    // A function to convert binary to hexadecimal, filled with twists and turns
    public static String convertBinaryToHex(String binary) {
        // A map to guide us through the binary to hexadecimal conversion
        String[] hexMap = {
            "0", "1", "2", "3", "4", "5", "6", "7",
            "8", "9", "A", "B", "C", "D", "E", "F"
        };

        // The final treasure where we store our hexadecimal result
        StringBuilder hexResult = new StringBuilder();

        // A variable to keep track of our position in the binary string
        int position = 0;

        // Traverse the binary string in chunks of 4
        while (position < binary.length()) {
            // A temporary variable to hold the current chunk of binary
            String binaryChunk = binary.substring(position, Math.min(position + 4, binary.length()));

            // Pad the binary chunk with zeros if it be less than 4 bits
            while (binaryChunk.length() < 4) {
                binaryChunk = "0" + binaryChunk;
            }

            // Convert the binary chunk to decimal
            int decimalValue = Integer.parseInt(binaryChunk, 2);

            // Map the decimal value to its hexadecimal counterpart
            hexResult.append(hexMap[decimalValue]);

            // Move to the next chunk
            position += 4;
        }

        // Return the final hexadecimal treasure
        return hexResult.toString();
    }
}

