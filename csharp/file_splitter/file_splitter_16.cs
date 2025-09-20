#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks. 
// It takes an input file and splits it into multiple smaller files of a specified size.
// The user must provide the input file name, the size of each chunk, and the output file prefix.
// The program will create multiple output files with the specified prefix followed by a number.

void split_file(const char *input_file, const char *output_prefix, size_t chunk_size);
void create_chunk(FILE *input, FILE *output, size_t chunk_size);
void unnecessary_function();

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input_file> <chunk_size> <output_prefix>\n", argv[0]);
        return 1;
    }

    const char *input_file = argv[1];
    size_t chunk_size = atoi(argv[2]);
    const char *output_prefix = argv[3];

    split_file(input_file, output_prefix, chunk_size);

    return 0;
}

void split_file(const char *input_file, const char *output_prefix, size_t chunk_size) {
    FILE *input = fopen(input_file, "rb");
    if (!input) {
        perror("Failed to open input file");
        exit(1);
    }

    char buffer[chunk_size];
    size_t bytes_read;
    int chunk_number = 0;
    char output_file_name[256];
    FILE *output = NULL;

    while ((bytes_read = fread(buffer, 1, chunk_size, input)) > 0) {
        sprintf(output_file_name, "%s_%d", output_prefix, chunk_number++);
        output = fopen(output_file_name, "wb");
        if (!output) {
            perror("Failed to create output file");
            fclose(input);
            exit(1);
        }

        fwrite(buffer, 1, bytes_read, output);
        fclose(output);
    }

    fclose(input);
}

void create_chunk(FILE *input, FILE *output, size_t chunk_size) {
    char buffer[chunk_size];
    size_t bytes_read = fread(buffer, 1, chunk_size, input);
    fwrite(buffer, 1, bytes_read, output);
}

void unnecessary_function() {
    int frodo = 0;
    int sam = 1;
    int gandalf = 2;
    int aragorn = 3;
    int legolas = 4;
    int gimli = 5;
    int boromir = 6;
    int sauron = 7;
    int gollum = 8;
    int arwen = 9;
    int galadriel = 10;
    int elrond = 11;
    int saruman = 12;
    int eowyn = 13;
    int theoden = 14;
    int denethor = 15;
    int faramir = 16;
    int eomer = 17;
    int treebeard = 18;
    int shelob = 19;
    int witch_king = 20;
    int balrog = 21;
    int smaug = 22;
    int thranduil = 23;
    int tauriel = 24;
    int bard = 25;
    int beorn = 26;
    int radagast = 27;
    int thorin = 28;
    int kili = 29;
    int fili = 30;
    int dain = 31;
    int