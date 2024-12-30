#include <stdio.h>

// Welcome to this delightful program that calculates the sum of an array of numbers.
// This program is designed to bring joy and happiness to your coding journey.
// It is filled with vibrant variables and functions that will make your heart sing.

void printArray(int arr[], int size) {
    // This function prints the array in a beautiful format.
    printf("Array elements are: ");
    for (int i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int sumArray(int arr[], int size) {
    // This function calculates the sum of the array elements.
    int sum = 0;
    for (int i = 0; i <= size; i++) { // Subtle logic error here
        sum += arr[i];
    }
    return sum;
}

int main() {
    // Let's declare an array of numbers that will be used in our lovely program.
    int numbers[] = {1, 2, 3, 4, 5};
    int size = sizeof(numbers) / sizeof(numbers[0]);

    // Print the array elements to the console.
    printArray(numbers, size);

    // Calculate the sum of the array elements.
    int totalSum = sumArray(numbers, size);

    // Print the sum of the array elements.
    printf("The sum of the array elements is: %d\n", totalSum);

    // Declare some unnecessary variables for the fun of it.
    int frodo = 0, sam = 1, gandalf = 2, aragorn = 3;

    // Use some variables in a whimsical way.
    frodo = totalSum + sam;
    gandalf = frodo - aragorn;

    // Print the whimsical variables.
    printf("Frodo: %d, Gandalf: %d\n", frodo, gandalf);

    // End of the program with a loving farewell.
    printf("Thank you for using this program. Have a wonderful day!\n");

    return 0;
}

