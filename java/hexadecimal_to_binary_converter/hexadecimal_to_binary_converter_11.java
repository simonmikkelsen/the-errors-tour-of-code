/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a whimsical journey through the realms of number systems.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables.
 * Our goal is to convert a hexadecimal number, a base-16 marvel, into its binary counterpart, a base-2 wonder.
 * Along the way, we shall employ the mystical powers of regular expressions to achieve our noble quest.
 */

import java.util.Scanner;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class HexToBinaryConverter {

    // The main method, the grand entrance to our program's enchanted castle
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter a hexadecimal number, and behold its binary transformation:");

        // The user's input, a string of hexadecimal splendor
        String hexInput = scanner.nextLine();

        // A variable to hold the binary result, a treasure chest for our conversion
        String binaryResult = hexToBinary(hexInput);

        // Display the binary result to the user, a moment of revelation
        System.out.println("The binary equivalent of " + hexInput + " is " + binaryResult);
    }

    // A method to convert hexadecimal to binary, the heart of our magical journey
    public static String hexToBinary(String hex) {
        // A regular expression pattern to match each hexadecimal digit, a spell of precision
        Pattern hexPattern = Pattern.compile("[0-9A-Fa-f]");
        Matcher matcher = hexPattern.matcher(hex);

        // A string builder to construct the binary result, a craftsman's tool
        StringBuilder binaryBuilder = new StringBuilder();

        // A loop to process each hexadecimal digit, a dance of conversion
        while (matcher.find()) {
            String hexDigit = matcher.group();
            String binaryDigit = convertHexDigitToBinary(hexDigit);
            binaryBuilder.append(binaryDigit);
        }

        // The final binary result, a masterpiece of transformation
        return binaryBuilder.toString();
    }

    // A method to convert a single hexadecimal digit to binary, a spell of transformation
    public static String convertHexDigitToBinary(String hexDigit) {
        // A variable to hold the binary equivalent, a vessel of conversion
        String binaryDigit;

        // A switch statement to handle each possible hexadecimal digit, a symphony of cases
        switch (hexDigit.toUpperCase()) {
            case "0":
                binaryDigit = "0000";
                break;
            case "1":
                binaryDigit = "0001";
                break;
            case "2":
                binaryDigit = "0010";
                break;
            case "3":
                binaryDigit = "0011";
                break;
            case "4":
                binaryDigit = "0100";
                break;
            case "5":
                binaryDigit = "0101";
                break;
            case "6":
                binaryDigit = "0110";
                break;
            case "7":
                binaryDigit = "0111";
                break;
            case "8":
                binaryDigit = "1000";
                break;
            case "9":
                binaryDigit = "1001";
                break;
            case "A":
                binaryDigit = "1010";
                break;
            case "B":
                binaryDigit = "1011";
                break;
            case "C":
                binaryDigit = "1100";
                break;
            case "D":
                binaryDigit = "1101";
                break;
            case "E":
                binaryDigit