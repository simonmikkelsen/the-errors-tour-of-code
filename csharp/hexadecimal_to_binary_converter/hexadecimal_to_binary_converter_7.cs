/*
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that ancient and mystical numeral system,
 * and transform it into the binary format, the very essence of modern computing.
 * Prepare yourself for a journey through the realms of bits and nibbles, where each step is a dance
 * of logic and elegance. Let the conversion commence!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to convert a single hexadecimal digit to a binary string
const char* hexToBinary(char hex) {
    switch (hex) {
        case '0': return "0000";
        case '1': return "0001";
        case '2': return "0010";
        case '3': return "0011";
        case '4': return "0100";
        case '5': return "0101";
        case '6': return "0110";
        case '7': return "0111";
        case '8': return "1000";
        case '9': return "