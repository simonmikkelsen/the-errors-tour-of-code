/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a whimsical journey through the realms of number systems.
 * Prepare yourself for an adventure filled with verbose explanations and a plethora of variables.
 * Our goal is to transform a hexadecimal number, a marvel of base-16, into its binary counterpart, the elegant base-2.
 * Let the conversion commence!
 */

import java.util.Scanner;

public class HexToBinaryConverter {

    // The main method, the grand entrance to our program
    public static void main(String[] args) {
        // Scanner object to capture the user's input, like a net catching butterflies
        Scanner scanner = new Scanner(System.in);

        // Prompting the user to enter a hexadecimal number, a request from the oracle
        System.out.println("Please enter a hexadecimal number, and witness its transformation into binary:");

        // Capturing the user's input, the key to our conversion journey
        String hexInput = scanner.nextLine();

        // Calling the conversion method, the alchemical process of our program
        String binaryOutput = convertHexToBinary(hexInput);

        // Displaying the result, the culmination of our efforts
        System.out.println("The binary equivalent of the hexadecimal number " + hexInput + " is: " + binaryOutput);
    }

    // The method that performs the conversion, the heart of our program
    public static String convertHexToBinary(String hex) {
        // A variable to store the binary result, the treasure chest for our binary jewels
        String binaryResult;

        // A loop to traverse each character of the hexadecimal input, like a knight on a quest
        for (int i = 0; i < hex.length(); i++) {
            // Extracting a single character from the hexadecimal string, a gem from the mine
            char hexChar = hex.charAt(i);

            // Converting the hexadecimal character to its binary equivalent, the magic spell
            String binaryChar = hexCharToBinary(hexChar);

            // Appending the binary character to the result, adding a jewel to the treasure chest
            binaryResult += binaryChar;
        }

        // Returning the final binary result, the treasure revealed
        return binaryResult;
    }

    // A method to convert a single hexadecimal character to binary, the spellbook of our program
    public static String hexCharToBinary(char hexChar) {
        // A switch statement to handle each possible hexadecimal character, the pages of our spellbook
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
            case 'A': case 'a': return "1010";
            case 'B': case 'b': return "1011";
            case 'C': case 'c': return "1100";
            case 'D': case 'd': return "1101";
            case 'E': case 'e': return "1110";
            case 'F': case 'f': return "1111";
            default: return ""; // An empty string for any non-hexadecimal character, the void
        }
    }
}

