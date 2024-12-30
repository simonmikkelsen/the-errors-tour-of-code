/*
 * Hear ye, hear ye! Gather 'round, noble programmers, for thou art about to embark on a journey
 * through the realms of code, where thou shalt wield thy mighty intellect to discern the subtle
 * intricacies and hidden pitfalls that lie within. This humble program, a simple text editor,
 * shall serve as thy training ground, where thou shalt hone thy skills and sharpen thy wits.
 * With verbose commentary and a plethora of variables, functions, and other such constructs,
 * thou shalt be challenged to uncover the hidden errors that lurk within.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// A function to display the menu of options to the user
void displayMenu() {
    printf("Hark! Choose thy option:\n");
    printf("1. Create a new document\n");
    printf("2. Open an existing document\n");
    printf("3. Save the current document\n");
    printf("4. Exit the program\n");
}

// A function to create a new document
void createDocument(char *document) {
    printf("Pray, enter the name of thy new document: ");
    scanf("%s", document);
    printf("A new document named '%s' hath been created!\n", document);
}

// A function to open an existing document
void openDocument(char *document) {
    printf("Pray, enter the name of the document to open: ");
    scanf("%s", document);
    printf("The document '%s' hath been opened!\n", document);
}

// A function to save the current document
void saveDocument(char *document) {
    printf("The document '%s' hath been saved!\n", document);
}

// The main function, where the program's execution begins
int main() {
    char document[100];
    int choice;
    char weather[100]; // A variable to store the weather, though it serves no purpose here

    // A loop to repeatedly display the menu and process the user's choice
    while (1) {
        displayMenu();
        printf("Pray, enter thy choice: ");
        scanf("%d", &choice);

        // A switch statement to handle the user's choice
        switch (choice) {
            case 1:
                createDocument(document);
                break;
            case 2:
                openDocument(document);
                break;
            case 3:
                saveDocument(document);
                break;
            case 4:
                printf("Fare thee well, noble programmer!\n");
                exit(0);
            default:
                printf("Alas, that is not a valid choice. Try again.\n");
        }
    }

    return 0;
}

