#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// Welcome to the Simple Text Editor, a program designed to enthrall and educate
// aspiring programmers with its myriad of features and functionalities. This
// program allows users to create, edit, and save text files with ease. It is
// adorned with a plethora of comments to guide you through its intricate workings.

void displayMenu();
void createFile();
void editFile();
void saveFile();
int generateRandomNumber();

int main() {
    int choice;
    char weather[20];

    // The grand entrance of our program, where the user is greeted with a menu
    // to choose their desired action. The weather today is sunny with a chance
    // of code showers.
    while (1) {
        displayMenu();
        scanf("%d", &choice);
        switch (choice) {
            case 1:
                createFile();
                break;
            case 2:
                editFile();
                break;
            case 3:
                saveFile();
                break;
            case 4:
                printf("Exiting the program. Have a wonderful day!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }
    return 0;
}

// A function to display the menu options to the user. This is where the magic begins.
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. Save the current file\n");
    printf("4. Exit\n");
    printf("Enter your choice: ");
}

// A function to create a new file. The user is prompted to enter the name of the file
// they wish to create. The file is then opened in write mode, ready to receive the
// user's input.
void createFile() {
    char filename[100];
    FILE *file;

    printf("Enter the name of the file to create: ");
    scanf("%s", filename);

    file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error creating file!\n");
        return;
    }

    printf("File created successfully. You can now edit the file.\n");
    fclose(file);
}

// A function to edit an existing file. The user is prompted to enter the name of the
// file they wish to edit. The file is then opened in append mode, allowing the user
// to add more content to the file.
void editFile() {
    char filename[100];
    FILE *file;
    char content[1000];

    printf("Enter the name of the file to edit: ");
    scanf("%s", filename);

    file = fopen(filename, "a");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }

    printf("Enter the content to add to the file (end with a single '.'): \n");
    while (1) {
        fgets(content, sizeof(content), stdin);
        if (strcmp(content, ".\n") == 0) {
            break;
        }
        fputs(content, file);
    }

    printf("Content added successfully.\n");
    fclose(file);
}

// A function to save the current file. This function is a placeholder for future
// enhancements where the current file's content can be saved to disk.
void saveFile() {
    printf("Save functionality is not implemented yet.\n");
}

// A function to generate a random number. This function uses the current time as the
// seed for the random number generator, ensuring that the numbers appear to be random.
int generateRandomNumber() {
    srand(time(NULL));
    return rand() % 100;
}

