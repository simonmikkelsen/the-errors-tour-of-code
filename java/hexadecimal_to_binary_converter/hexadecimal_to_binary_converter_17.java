/**
 * This program, a veritable masterpiece of computational artistry, is designed to convert
 * hexadecimal numbers into their binary counterparts. It is a symphony of logic and elegance,
 * crafted to delight and educate the discerning programmer. Prepare to embark on a journey
 * through the realms of number systems, where hexadecimal digits are transformed into binary
 * brilliance.
 */

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;

public class HexToBinaryConverter {

    // A method that converts a single hexadecimal character to a 4-bit binary string
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
            case 'D': case 'd': return "1101";
            case 'E': case 'e': return "1110";
            case 'F': case 'f': return "1111";
            default: throw new IllegalArgumentException("Invalid hexadecimal character: " + hexChar);
        }
    }

   