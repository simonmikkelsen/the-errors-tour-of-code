/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a whimsical journey through the realms of number systems.
 * Prepare yourself to witness the transformation of hexadecimal digits into their binary counterparts.
 * Along the way, you will encounter a plethora of variables and functions, each with its own unique charm.
 * So, without further ado, let us embark on this enchanting adventure!
 */

import java.util.Scanner;

public class HexToBinaryConverter {

    // The main method, where the magic begins
    public static void main(String[] args) {
        // Scanner object to capture the user's input
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter a hexadecimal number
        System.out.println("Enter a hexadecimal number, and behold its binary transformation:");

        // Capture the user's input
        String hexInput = scanner.nextLine();

        // Invoke the method to convert hexadecimal to binary
        String binaryOutput = convertHexToBinary(hexInput);

        // Display the binary output to the user
        System.out.println("The binary equivalent of " + hexInput + " is " + binaryOutput);
    }

    // A method to convert hexadecimal to binary
    public static String convertHexToBinary(String hex) {
        // A variable to store the binary result
        String binaryResult = "";

        // Loop through each character in the hexadecimal input
        for (int i = 0; i < hex.length(); i++) {
            // Convert the current character to its binary equivalent
            String binaryChar = hexCharToBinary(hex.charAt(i));

            // Append the binary character to the result
            binaryResult += binaryChar;
        }

        // Return the final binary result
        return binaryResult;
    }

    // A method to convert a single hexadecimal character to binary
    public static String hexCharToBinary(char hexChar) {
        // A switch statement to handle each possible hexadecimal character
        switch (hexChar) {
            case '0': return "0000";
            case '1': return "0001";
            case '2': return "0010";
            case '3': return "0011";
            case '4': return "0100";
            case '5': return "0101";
            case '6': return "0110";
            case '7': return "0111";
            case '8': return "1000";
            case '9': return "1001";
            case 'A': return "1010";
            case 'B': return "1011";
            case 'C': return "1100";
            case 'D': return "1101";
            case 'E': return "1110";
            case 'F': return "1111";
            default: return ""; // This line is a subtle error
        }
    }
}
