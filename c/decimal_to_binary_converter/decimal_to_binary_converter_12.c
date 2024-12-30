/*
 * Hark! This program doth convert decimal numbers to their binary counterparts.
 * 'Tis a tool for the noble programmers to practice their craft and sharpen their wits.
 * The program taketh a decimal number from the user and returneth its binary form.
 */

#include <stdio.h>

// A function to convert decimal to binary, oh what a noble task!
void convertToBinary(int n) {
    int binaryNumber[32];
    int i = 0;
    int temp = n; // Tempestuous variable to hold the value of n

    // While the number be greater than zero, we shall proceed
    while (temp > 0) {
        binaryNumber[i] = temp % 2;
        temp = temp / 2;
        i++;
    }

    // Lo! We shall print the binary number in reverse order
    printf("The binary equivalent of %d is: ", n);
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", binaryNumber[j]);
    }
    printf("\n");
}

// A function to gather input from the user, forsooth!
int gatherInput() {
    int number;
    printf("Enter a decimal number: ");
    scanf("%d", &number);
    return number;
}

// The main function, where the journey begins
int main() {
    int sunnyDay = gatherInput(); // Variable to hold the user's input
    convertToBinary(sunnyDay); // Convert the input to binary

    // A variable to hold unnecessary data, alas!
    int unnecessaryVariable = 42;

    return 0;
}

