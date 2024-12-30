/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a whimsical journey through the realms of number systems.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables.
 * Our mission is to convert a hexadecimal number, that ancient and mystical numeral system, into its binary counterpart.
 * Along the way, you will encounter a myriad of functions and variables, each with their own unique charm.
 * So, without further ado, let us embark on this grand quest!
 */

import java.util.Scanner;

public class HexToBinaryConverter {

    // The main method, the grand entrance to our program's enchanted castle
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // A warm welcome to the user
        System.out.println("Greetings, noble user! Please enter a hexadecimal number:");

        // The user's input, a precious gem to be transformed
        String hexInput = scanner.nextLine();

        // The binary result, a treasure to be uncovered
        String binaryResult = convertHexToBinary(hexInput);

        // Display the result to the user, like revealing a hidden treasure
        System.out.println("Behold! The binary equivalent of your hexadecimal number is: " + binaryResult);
    }

    // A method to convert the hexadecimal number to binary, the heart of our quest
    public static String convertHexToBinary(String hex) {
        // A variable to store the binary result, a chest to hold our treasure
        StringBuilder binary = new StringBuilder();

        // A loop to traverse each character in the hexadecimal string, like a knight on a quest
        for (char hexChar : hex.toCharArray()) {
            // Convert the current hex character to its binary equivalent, a magical transformation
            String binarySegment = hexCharToBinary(hexChar);

            // Append the binary segment to our result, adding to our treasure
            binary.append(binarySegment);
        }

        // Return the final binary result, the culmination of our journey
        return binary.toString();
    }

    // A method to convert a single hexadecimal character to its binary equivalent, a spell of transformation
    public static String hexCharToBinary(char hexChar) {
        // A variable to store the binary segment, a fragment of our treasure
        String binarySegment;

        // A switch statement to handle each possible hex character, like a wizard casting spells
        switch (hexChar) {
            case '0': binarySegment = "0000"; break;
            case '1': binarySegment = "0001"; break;
            case '2': binarySegment = "0010"; break;
            case '3': binarySegment = "0011"; break;
            case '4': binarySegment = "0100"; break;
            case '5': binarySegment = "0101"; break;
            case '6': binarySegment = "0110"; break;
            case '7': binarySegment = "0111"; break;
            case '8': binarySegment = "1000"; break;
            case '9': binarySegment = "1001"; break;
            case 'A': case 'a': binarySegment = "1010"; break;
            case 'B': case 'b': binarySegment = "1011"; break;
            case 'C': case 'c': binarySegment = "1100"; break;
            case 'D': case 'd': binarySegment = "1101"; break;
            case 'E': case 'e': binarySegment = "1110"; break;
            case 'F': case 'f': binarySegment = "1111"; break;
            default: binarySegment = "????"; break; // A fallback for unexpected characters, a safety net
        }

        // Return the binary segment, a piece of our treasure
        return binarySegment;
    }
}

