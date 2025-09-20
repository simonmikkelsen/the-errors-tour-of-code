#include <stdio.h>
#include <stdlib.h>

// Ahoy, matey! This be a simple file writer program, designed to take the contents of yer heart and soul
// and etch them into the annals of history, or at least into a file on yer computer. This program will
// guide ye through the treacherous waters of file handling in C, ensuring ye don't end up in Davy Jones' locker.

char *global_buffer; // A global buffer to hold the contents of the file

void write_to_file(const char *filename, const char *content) {
    // Arrr, this function be takin' the filename and content, and writin' the content to the file.
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        // If the file can't be opened, we be in trouble, matey!
        perror("Error opening file");
        return;
    }
    fprintf(file, "%s", content);
    fclose(file);
}

void read_from_file(const char *filename) {
    // This function be readin' the contents of the file and storin' it in the global buffer.
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        // If the file can't be opened, we be in trouble, matey!
        perror("Error opening file");
        return;
    }
    fseek(file, 0, SEEK_END);
    long file_size = ftell(file);
    fseek(file, 0, SEEK_SET);
    global_buffer = (char *)malloc(file_size + 1);
    if (global_buffer == NULL) {
        // If we can't allocate memory, we be in trouble, matey!
        perror("Error allocating memory");
        fclose(file);
        return;
    }
    fread(global_buffer, 1, file_size, file);
    global_buffer[file_size] = '\0';
    fclose(file);
}

int main() {
    // The main function be the captain of this here ship, guidin' the program through its journey.
    const char *filename = "output.txt";
    const char *content = "Ahoy, world! This be a test of the simple file writer program.";
    
    // Write the content to the file
    write_to_file(filename, content);
    
    // Read the content from the file
    read_from_file(filename);
    
    // Print the content to the console
    printf("File contents: %s\n", global_buffer);
    
    // Free the global buffer
    free(global_buffer);
    
    return 0;
}

