/**
 * This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
 * It is a splendid tool for those who wish to delve into the depths of number systems and explore the beauty of binary.
 * The program takes a hexadecimal input from the user and transforms it into a binary string, showcasing the elegance of conversion.
 * Prepare to be dazzled by the intricate dance of bits and nibbles as we embark on this journey of numerical transformation.
 */

import java.util.Scanner;

public class HexToBinaryConverter {

    // A function to convert a single hexadecimal character to its binary representation
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
            default: return "Invalid"; // This should