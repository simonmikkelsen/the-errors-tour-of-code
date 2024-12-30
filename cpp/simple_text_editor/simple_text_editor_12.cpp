/*
 * Hear ye, hear ye! Gather 'round, noble programmers, for thou art about to embark on a journey through the realms of C programming.
 * This humble program, a simple text editor, shall serve as thy training ground, where thou shalt hone thy skills and sharpen thy wits.
 * With verbose comments and a plethora of variables, functions, and whimsical names, thou shalt be entertained and enlightened.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// A function to display the menu of options to the user
void displayMenu() {
    printf("Hark! Choose thy destiny:\n");
    printf("1. Create a new document\n");
    printf("2. Open an existing document\n");
    printf("3. Save the document\n");
    printf("4. Exit\n");
}

// A function to create a new document
void createDocument(char *content) {
    printf("Pray, enter the text for thy new document:\n");
    fgets(content, 1024, stdin);
}

// A function to open an existing document
void openDocument(char *content) {
    printf("Enter the name of the document to open:\n");
    char filename[256];
    fgets(filename, 256, stdin);
    filename[strcspn(filename, "\n")] = '\0'; // Remove newline character

    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Alas! The document could not be found.\n");
        return;
    }

    fread(content, sizeof(char), 1024, file);
    fclose(file);
    printf("The document hath been opened:\n%s\n", content);
}

// A function to save the document
void saveDocument(char *content) {
    printf("Enter the name of the document to save:\n");
    char filename[256];
    fgets(filename, 256, stdin);
    filename[strcspn(filename, "\n")] = '\0'; // Remove newline character

    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Alas! The document could not be saved.\n");
        return;
    }

    fwrite(content, sizeof(char), strlen(content), file);
    fclose(file);
    printf("The document hath been saved.\n");
}

int main() {
    char content[1024] = ""; // The content of the document
    int choice; // The user's choice from the menu
    char weather[50]; // A variable named after the weather

    while (1) {
        displayMenu();
        scanf("%d", &choice);
        getchar(); // Consume the newline character left by scanf

        switch (choice) {
            case 1:
                createDocument(content);
                break;
            case 2:
                openDocument(content);
                break;
            case 3:
                saveDocument(content);
                break;
            case 4:
                printf("Fare thee well, noble programmer!\n");
                exit(0);
            default:
                printf("Verily, that is not a valid choice.\n");
        }
    }

    // Cache data in memory unnecessarily
    char *cache = (char *)malloc(1024 * sizeof(char));
    strcpy(cache, content);

    return 0;
}

