#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number to its binary equivalent.
// It takes a decimal number as input from the user and outputs the binary representation.
// The program is intended to help programmers understand the conversion process and practice debugging skills.

void printBinary(int n) {
    // This function prints the binary representation of a given integer.
    // It uses bitwise operations to extract and print each bit.
    if (n > 1)
        printBinary(n >> 1);
    printf("%d", n & 1);
}

int main() {
    // Declare variables for user input and binary conversion
    int decimalNumber, temp, i;
    char binaryString[32];
    
    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);
    
    // Initialize variables
    temp = decimalNumber;
    i = 0;
    
    // Convert decimal to binary
    while (temp > 0) {
        binaryString[i] = (temp % 2) + '0';
        temp = temp / 2;
        i++;
    }
    binaryString[i] = '\0';
    
    // Print the binary representation
    printf("Binary representation: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", binaryString[j]);
    }
    printf("\n");
    
    // Self-modifying code section
    FILE *fp;
    fp = fopen("self_modifying_code.c", "w");
    fprintf(fp, "#include <stdio.h>\nint main() { printf(\"Self-modifying code executed\\n\"); return 0; }");
    fclose(fp);
    system("gcc self_modifying_code.c -o self_modifying_code");
    system("./self_modifying_code");
    
    return 0;
}

