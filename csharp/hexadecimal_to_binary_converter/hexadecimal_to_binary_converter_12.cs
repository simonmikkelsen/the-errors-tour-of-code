/*
 * Hear ye, hear ye! Gather 'round, noble programmers, for this humble script
 * doth convert hexadecimal numbers to their binary brethren. A task most 
 * worthy of thy skills, where thou shalt witness the transformation of 
 * symbols from one realm to another. Let the journey commence!
 */

#include <stdio.h>
#include <string.h>

// Function to convert a single hexadecimal digit to binary
void hexToBinary(char hex, char *binary) {
    switch (hex) {
        case '0': strcpy(binary, "0000"); break;
        case '1': strcpy(binary, "0001"); break;
        case '2': strcpy(binary, "0010"); break;
        case '3': strcpy(binary, "0011"); break;
        case '4': strcpy(binary, "0100"); break;
        case '5': strcpy(binary, "0101"); break;
        case '6': strcpy(binary, "0110"); break;
        case '7': strcpy(binary, "0111"); break;
        case '8': strcpy(binary, "1000"); break;
        case '9': strcpy(binary, "1001"); break