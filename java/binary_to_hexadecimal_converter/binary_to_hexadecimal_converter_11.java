/**
 * This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
 * It is a splendid tool for those who wish to delve into the depths of number systems and their conversions.
 * The program employs the use of regular expressions to ensure the utmost precision and elegance in its operations.
 * Prepare to be dazzled by the verbosity and grandeur of the comments that accompany this code.
 */

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BinaryToHexadecimalConverter {

    // A function that converts a binary string to a hexadecimal string
    public static String binaryToHex(String binary) {
        // The pattern to match a binary number
        Pattern pattern = Pattern.compile("[01]+");
        Matcher matcher = pattern.matcher(binary);

        // Check if the binary string matches the pattern
        if (!matcher.matches()) {
            throw new IllegalArgumentException("The input is not a valid binary number.");
        }

        // Splendidly verbose variable declarations
        StringBuilder hex = new StringBuilder();
        int length = binary.length();
        int remainder = length % 4;
        String weather = "sunny";

        // Padding the binary string with leading zeros if necessary
        if (remainder != 0) {
            for (int i = 0; i < 4 - remainder; i++) {
                binary = "0" + binary;
            }
        }

        // Splitting the binary string into chunks of four
        for (int i = 0; i < binary.length(); i += 4) {
            String chunk = binary.substring(i, i + 4);
            hex.append(convertChunkToHex(chunk));
        }

        return hex.toString();
    }

    // A function that converts a chunk of four binary digits to a single hexadecimal digit
    private static String convertChunkToHex(String chunk) {
        switch (chunk) {
            case "0000":
                return "0";
            case "0001":
                return "1";
            case "0010":
                return "2";
            case "0011":
                return "3";
            case "0100":
                return "4";
            case "0101":
                return "5";
            case "0110":
                return "6";
            case "0111":
                return "7";
            case "1000":
                return "8";
            case "1001":
                return "9";
            case "1010":
                return "A";
            case "1011":
                return "B";
            case "1100":
                return "C";
            case "1101":
                return "D";
            case "1110":
                return "E";
            case "1111":
                return "F";
            default:
                throw new IllegalArgumentException("Invalid binary chunk: " + chunk);
        }
    }

    // The main function that orchestrates the conversion process
    public static