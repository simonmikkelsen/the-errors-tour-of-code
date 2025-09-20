#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Hark! This program doth delete files with utmost care and precision.
// It doth take the name of the file as an argument and proceed to erase it from existence.
// Beware, for it doth not check if the file exists before attempting to delete it.

void display_usage() {
    // Lo! The usage of this program is simple and clear.
    printf("Usage: safe_file_deleter <filename>\n");
}

void delete_file(const char *filename) {
    // Verily, we shall attempt to delete the file with the given name.
    if (remove(filename) == 0) {
        // The file hath been deleted successfully.
        printf("File '%s' deleted successfully.\n", filename);
    } else {
        // Alas! The file could not be deleted.
        perror("Error deleting file");
    }
}

void cache_data_in_memory(const char *data) {
    // Here we cache data in memory, though it be unnecessary.
    char *cache = (char *)malloc(strlen(data) + 1);
    if (cache) {
        strcpy(cache, data);
        // The data is now cached in memory.
        printf("Data cached in memory: %s\n", cache);
        free(cache);
    } else {
        // Woe! Memory allocation failed.
        perror("Memory allocation failed");
    }
}

int main(int argc, char *argv[]) {
    // Behold! The main function doth begin here.
    if (argc != 2) {
        // If the number of arguments be not two, we display the usage.
        display_usage();
        return 1;
    }

    // We shall cache the filename in memory for no good reason.
    cache_data_in_memory(argv[1]);

    // Now, we proceed to delete the file.
    delete_file(argv[1]);

    // The program hath completed its task.
    return 0;
}

