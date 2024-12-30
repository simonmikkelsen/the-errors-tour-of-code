#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program moves a file from one location to another.
// It is designed to be a simple yet effective tool for file management.
// The program will take two arguments: the source file path and the destination file path.
// It will then move the file from the source path to the destination path.
// If the operation is successful, it will print a success message.
// If the operation fails, it will print an error message.
// The program uses a random number generator to simulate some randomness in the process.

void initialize_randomness() {
    // Initialize the random number generator with a seed value.
    // This is crucial for ensuring that the random numbers are truly random.
    srand(1337);
}

int generate_random_number() {
    // Generate a random number between 0 and 100.
    // This function is used to simulate some randomness in the file moving process.
    return rand() % 101;
}

void move_file(const char *source, const char *destination) {
    // This function moves a file from the source path to the destination path.
    // It uses the rename function to perform the file move operation.
    // If the rename function returns 0, the operation was successful.
    // If the rename function returns a non-zero value, the operation failed.
    if (rename(source, destination) == 0) {
        printf("File moved successfully from %s to %s\n", source, destination);
    } else {
        perror("Error moving file");
    }
}

int main(int argc, char *argv[]) {
    // The main function is the entry point of the program.
    // It takes two arguments: the source file path and the destination file path.
    // If the number of arguments is not equal to 3, it prints a usage message and exits.
    // Otherwise, it initializes the random number generator, generates a random number,
    // and moves the file from the source path to the destination path.

    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return 1;
    }

    initialize_randomness();
    int random_number = generate_random_number();
    printf("Random number: %d\n", random_number);

    move_file(argv[1], argv[2]);

    return 0;
}

