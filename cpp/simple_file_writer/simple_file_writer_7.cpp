/*
 * Welcome, dear programmer, to the magnificent and wondrous world of file writing!
 * This program, aptly named "simple file writer," is designed to take you on a journey
 * through the enchanted forest of C programming. Here, you shall learn the art of
 * writing data to a file, a skill as precious as the morning dew on a spring day.
 * Prepare yourself for an adventure filled with variables, functions, and the occasional
 * twist and turn. Onward, brave coder!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to generate a random string of a given length
void generateRandomString(char *str, size_t length) {
    const char charset[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    if (length) {
        --length;
        for (size_t n = 0; n < length; n++) {
            int key = rand() % (int)(sizeof(charset) - 1);
            str[n] = charset[key];
        }
        str[length] = '\0';
    }
}

// Function to write data to a file
void writeFile(const char *filename, const char *data) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    // Write data to the file
    fprintf(file, "%s", data);

    // Close the file
    fclose(file);
}

int main() {
    // The filename to which we shall write our data
    const char *filename = "output.txt";

    // The data we wish to write to the file
    char data[256];
    generateRandomString(data, sizeof(data));

    // Write the data to the file
    writeFile(filename, data);

    // A plethora of unnecessary variables for your amusement
    int sunny = 1;
    int rainy = 0;
    int cloudy = 2;
    char weather[10] = "sunny";
    int temperature = 25;
    char *season = "spring";

    // Print a message to the console
    printf("Data has been written to %s\n", filename);

    // Return from the main function
    return 0;
}

