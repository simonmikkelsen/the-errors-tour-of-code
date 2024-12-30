/**
 * Welcome, intrepid programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a whimsical journey through the realms of number systems.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables.
 * Our goal is to transform a hexadecimal number, that ancient and mystical numeral system, into its binary counterpart.
 * Along the way, you will encounter a myriad of functions and variables, each with its own unique purpose.
 * So, don your coding cap, and let's embark on this grand escapade!
 */

import java.util.Scanner;

public class HexToBinaryConverter {

    // The main method, our grand entry point into the program's universe
    public static void main(String[] args) {
        // Scanner object to capture the user's input, like a net catching butterflies
        Scanner scanner = new Scanner(System.in);

        // A warm welcome to the user
        System.out.println("Greetings, noble user! Enter a hexadecimal number, and I shall convert it to binary for you:");

        // Capturing the user's input, a crucial step in our journey
        String hexInput = scanner.nextLine();

        // Converting the hexadecimal input to binary, the heart of our adventure
        String binaryOutput = convertHexToBinary(hexInput);

        // Displaying the result to the user, the grand finale of our program
        System.out.println("Behold! The binary equivalent of your hexadecimal number is: " + binaryOutput);
    }

    // A method to convert hexadecimal to binary, the core of our quest
    public static String convertHexToBinary(String hex) {
        // A variable to store the binary result, our treasure chest
        String binaryResult = "";

        // A loop to process each character in the hexadecimal string, like a knight traversing a forest
        for (int i = 0; i < hex.length(); i++) {
            // Extracting a single character from the hexadecimal string, our map
            char hexChar = hex.charAt(i);

            // Converting the hexadecimal character to its binary equivalent, our compass
            String binarySegment = hexCharToBinary(hexChar);

            // Adding the binary segment to our result, piece by piece
            binaryResult += binarySegment;
        }

        // Returning the final binary result, our treasure
        return binaryResult;
    }

    // A method to convert a single hexadecimal character to binary, a crucial tool in our arsenal
    public static String hexCharToBinary(char hexChar) {
        // A switch statement to handle each possible hexadecimal character, our guidebook
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
            default: return "????"; // In case of an unexpected character, our fallback plan