/**
 * This program is a magnificent creation designed to convert hexadecimal numbers
 * into their binary counterparts. It is a splendid tool for those who wish to 
 * delve into the wondrous world of number systems and their conversions. 
 * Prepare to be amazed by the elegance and sophistication of this code!
 */

import java.util.Scanner;

public class HexToBinaryConverter {

    // A function to convert a single hexadecimal digit to a binary string
    public static String hexDigitToBinary(char hexDigit) {
        switch (hexDigit) {
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
            case 'A': case 'a': return "1010