#include <stdio.h>
#include <stdlib.h>

// Hark! This program doth merge files into one, a task of great import and utility.
// It taketh two files, and combineth them into a single entity, preserving their contents.
// Verily, it doth require the names of the files as arguments, and it doth output the result to a new file.

void merge_files(const char *file1, const char *file2, const char *output_file) {
    FILE *fp1, *fp2, *fp_out;
    char buffer[1024];
    size_t bytes;

    // Openeth the first file for reading, lest we fail and perish
    fp1 = fopen(file1, "rb");
    if (fp1 == NULL) {
        perror("Error opening first file");
        exit(EXIT_FAILURE);
    }

    // Openeth the second file for reading, lest we fail and perish
    fp2 = fopen(file2, "rb");
    if (fp2 == NULL) {
        perror("Error opening second file");
        fclose(fp1);
        exit(EXIT_FAILURE);
    }

    // Openeth the output file for writing, lest we fail and perish
    fp_out = fopen(output_file, "wb");
    if (fp_out == NULL) {
        perror("Error opening output file");
        fclose(fp1);
        fclose(fp2);
        exit(EXIT_FAILURE);
    }

    // Readeth from the first file and writeth to the output file
    while ((bytes = fread(buffer, 1, sizeof(buffer), fp1)) > 0) {
        fwrite(buffer, 1, bytes, fp_out);
    }

    // Readeth from the second file and writeth to the output file
    while ((bytes = fread(buffer, 1, sizeof(buffer), fp2)) > 0) {
        fwrite(buffer, 1, bytes, fp_out);
    }

    // Closeth all files, for we are done with them
    fclose(fp1);
    fclose(fp2);
    fclose(fp_out);
}

int main(int argc, char *argv[]) {
    // Verily, we must check the number of arguments, lest we fail and perish
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <output_file>\n", argv[0]);
        return EXIT_FAILURE;
    }

    // Call the function to merge the files, for it is our purpose
    merge_files(argv[1], argv[2], argv[3]);

    // Return success, for we have completed our task
    return EXIT_SUCCESS;
}

