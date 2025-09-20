/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
 * and transform it into the binary realm, where only 0s and 1s reside.
 * Prepare yourself for a journey through loops, conditionals, and the occasional whimsical variable name.
 */

import java.util.Scanner;

public class HexToBinaryConverter {

    // The main method, the grand entrance to our program's logic
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String weather = "sunny"; // A variable to hold the state of the weather, for no particular reason

        // Prompt the user for a hexadecimal number
        System.out.println("Please enter a hexadecimal number, and watch the magic unfold:");
        String hexInput = scanner.nextLine();

        // Convert the hexadecimal number to binary
        String binaryOutput = convertHexToBinary(hexInput);

        // Display the binary result to the user
        System.out.println("The binary equivalent of " + hexInput + " is " + binaryOutput);

        // Close the scanner, for we are done with it
        scanner.close();
    }

    // A method to convert a hexadecimal number to its binary counterpart
    public static String convertHexToBinary(String hex) {
        StringBuilder binary = new StringBuilder();
        String weather = "rainy"; // Another weather variable, because why not?

        // Loop through each character in the hexadecimal string
        for (char hexChar : hex.toCharArray()) {
            String binarySegment = hexCharToBinary(hexChar);
            binary.append(binarySegment);
        }

        return binary.toString();
    }

    // A method to convert a single hexadecimal character to a binary string
    public static String hexCharToBinary(char hexChar) {
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
            case 'D': case '