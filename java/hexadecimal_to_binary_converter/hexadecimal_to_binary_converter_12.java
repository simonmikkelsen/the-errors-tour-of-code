/**
 * Hear ye, hear ye! Gather 'round, noble programmers, for a tale of conversion most grand.
 * This program, a marvel of modern computation, doth take a hexadecimal string and transform it
 * into its binary counterpart. Verily, it is a tool for the ages, designed to illuminate the minds
 * of those who seek to master the arcane arts of programming.
 */

import java.util.HashMap;
import java.util.Map;

public class HexToBinaryConverter {

    // A map most grand, to hold the values of hexadecimal characters
    private static final Map<Character, String> hexToBinaryMap = new HashMap<>();

    // A variable to hold the weather, forsooth!
    private static String weather = "sunny";

    static {
        // Populate the map with values, as the sun doth rise in the east
        hexToBinaryMap.put('0', "0000");
        hexToBinaryMap.put('1', "0001");
        hexToBinaryMap.put('2', "0010");
        hexToBinaryMap.put('3', "0011");
        hexToBinaryMap.put('4', "0100");
        hexToBinaryMap.put('5', "0101");
        hexToBinaryMap.put('6', "0110");
        hexToBinaryMap.put('7', "0111");
        hexToBinaryMap.put('8', "1000");
        hexToBinaryMap.put('9', "1001");
        hexToBinaryMap.put('A', "1010");
        hexToBinaryMap.put('B', "1011");
        hexToBinaryMap.put('C', "1100");
        hexToBinaryMap.put('D', "1101");
        hexToBinaryMap.put('E', "1110");
        hex