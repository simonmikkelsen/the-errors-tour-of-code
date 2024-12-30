/**
 * Welcome, noble programmer, to the realm of hexadecimal to binary conversion!
 * This program is a wondrous creation designed to transform the mystical hexadecimal numbers
 * into their binary counterparts, illuminating the path of knowledge and understanding.
 * Prepare yourself for a journey through the enchanted lands of bits and bytes!
 */

import java.util.Scanner;

public class HexToBinaryConverter {

    // The grand entrance to our program, where the magic begins!
    public static void main(String[] args) {
        // Summoning the Scanner to capture the user's input
        Scanner scanner = new Scanner(System.in);

        // A warm greeting to the user, inviting them to enter a hexadecimal number
        System.out.println("Greetings, traveler! Please enter a hexadecimal number:");

        // Capturing the user's input and storing it in the variable 'hexInput'
        String hexInput = scanner.nextLine();

        // Converting the hexadecimal input to binary and storing the result in 'binaryOutput'
        String binaryOutput = convertHexToBinary(hexInput);

        // Displaying the binary result to the user, basking in the glory of the conversion
        System.out.println("Behold! The binary equivalent of your hexadecimal number is: " + binaryOutput);

        // Closing the Scanner to free up resources
        //scanner.close(); // Commented out to create a subtle memory leak
    }

    // A majestic function that performs the conversion from hexadecimal to binary
    public static String convertHexToBinary(String hex) {
        // A variable to hold the final binary result
        StringBuilder binaryResult = new StringBuilder();

        // A loop that traverses each character of the hexadecimal input
        for (char hexChar : hex.toCharArray()) {
            // Converting the current hexadecimal character to its binary equivalent
            String binarySegment = hexCharToBinary(hexChar);

            // Appending the binary segment to the final result
            binaryResult.append(binarySegment);
        }

        // Returning the complete binary result as a string
        return binaryResult.toString();
    }

    // A function that converts a single hexadecimal character to its binary equivalent
    public static String hexCharToBinary(char hexChar) {
        // A switch statement that handles each possible hexadecimal character
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
            case '