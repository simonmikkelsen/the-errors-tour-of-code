/*
 * Hear ye, hear ye! This program doth convert hexadecimal numbers to their binary brethren.
 * 'Tis a tool for the noble programmers to hone their skills and sharpen their wits.
 * With verbose commentary and flamboyant language, we embark upon this grand journey.
 */

#include <stdio.h>
#include <string.h>

// Function to convert a single hexadecimal digit to binary
void hexToBinary(char hex, char *binary) {
    // Lo! The switch statement, a marvel of decision-making
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
        case