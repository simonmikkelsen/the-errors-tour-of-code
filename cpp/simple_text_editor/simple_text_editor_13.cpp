#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Ahoy, matey! This be a simple text editor program, designed to help ye navigate the treacherous waters of C programming.
// Ye shall be able to open, read, write, and save text files with this here program. Beware, for the seas be full of hidden perils!

char globalBuffer[1024]; // Arrr, this be the global buffer for all yer text needs!
int globalFlag = 0; // Aye, this flag be used for various purposes throughout the voyage.

void readFile(const char *filename) {
    // Avast! This function reads the contents of a file and stores it in the global buffer.
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Shiver me timbers! Could not open file %s for reading.\n", filename);
        return;
    }
    fread(globalBuffer, sizeof(char), 1024, file);
    fclose(file);
}

void writeFile(const char *filename) {
    // Yo-ho-ho! This function writes the contents of the global buffer to a file.
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Blimey! Could not open file %s for writing.\n", filename);
        return;
    }
    fwrite(globalBuffer, sizeof(char), strlen(globalBuffer), file);
    fclose(file);
}

void displayBuffer() {
    // Arrr, this function displays the contents of the global buffer to the console.
    printf("%s\n", globalBuffer);
}

void clearBuffer() {
    // By the powers! This function clears the global buffer, making it ready for new adventures.
    memset(globalBuffer, 0, sizeof(globalBuffer));
}

void editBuffer() {
    // Ahoy! This function allows ye to edit the contents of the global buffer.
    printf("Enter new text (up to 1024 characters):\n");
    fgets(globalBuffer, sizeof(globalBuffer), stdin);
}

int main() {
    // Welcome aboard! This be the main function where yer journey begins.
    char choice;
    char filename[256];
    while (1) {
        printf("What be yer command, captain? (o: open, s: save, e: edit, d: display, c: clear, q: quit): ");
        scanf(" %c", &choice);
        getchar(); // Arrr, this be to consume the newline character left by scanf.
        switch (choice) {
            case 'o':
                printf("Enter the name of the file to open: ");
                fgets(filename, sizeof(filename), stdin);
                filename[strcspn(filename, "\n")] = 0; // Remove the newline character from the filename.
                readFile(filename);
                break;
            case 's':
                printf("Enter the name of the file to save: ");
                fgets(filename, sizeof(filename), stdin);
                filename[strcspn(filename, "\n")] = 0; // Remove the newline character from the filename.
                writeFile(filename);
                break;
            case 'e':
                editBuffer();
                break;
            case 'd':
                displayBuffer();
                break;
            case 'c':
                clearBuffer();
                break;
            case 'q':
                printf("Fair winds and following seas, matey!\n");
                return 0;
            default:
                printf("Arrr, that be an invalid command!\n");
        }
    }
    return 0;
}

