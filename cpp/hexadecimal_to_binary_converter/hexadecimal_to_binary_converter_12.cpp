/*
 * Hear ye, hear ye! Gather 'round, noble programmers, for this humble script
 * doth serve the purpose of converting hexadecimal numbers into their binary
 * counterparts. With this code, thou shalt traverse the realms of numerical
 * transformations, gaining wisdom and insight into the arcane arts of bitwise
 * operations and data representation.
 */

#include <stdio.h>
#include <string.h>

// A function most grand, to convert a single hexadecimal digit to its binary form
void hexDigitToBinary(char hexDigit, char* binary) {
    switch (hexDigit) {
        case '0': strcpy(binary, "0000"); break;
        case '1': strcpy(binary, "0001"); break;
        case '2': strcpy(binary, "0010"); break;
        case '3': strcpy(binary, "0011"); break;
        case '4': strcpy(binary, "0100"); break;
        case '5': strcpy(binary, "0101"); break;
        case '6': strcpy(binary, "0110"); break;
        case '7': strcpy(binary, "0111");