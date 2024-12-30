#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a simple database that allows users to store and retrieve information about their favorite books.
// It is designed to be a delightful experience, full of joy and wonder, as you interact with your beloved books.
// The program will guide you through adding new books, viewing the list of books, and searching for a specific book by title.

#define MAX_BOOKS 100
#define TITLE_LENGTH 50
#define AUTHOR_LENGTH 50

typedef struct {
    char title[TITLE_LENGTH];
    char author[AUTHOR_LENGTH];
    int year;
} Book;

Book library[MAX_BOOKS];
int bookCount = 0;

// Function to add a new book to the library
void addBook() {
    if (bookCount >= MAX_BOOKS) {
        printf("The library is full, my dear. No more books can be added.\n");
        return;
    }

    Book newBook;
    printf("Enter the title of the book: ");
    fgets(newBook.title, TITLE_LENGTH, stdin);
    newBook.title[strcspn(newBook.title, "\n")] = '\0'; // Remove newline character

    printf("Enter the author of the book: ");
    fgets(newBook.author, AUTHOR_LENGTH, stdin);
    newBook.author[strcspn(newBook.author, "\n")] = '\0'; // Remove newline character

    printf("Enter the year of publication: ");
    scanf("%d", &newBook.year);
    getchar(); // Consume the newline character left by scanf

    library[bookCount] = newBook;
    bookCount++;
    printf("The book has been added to your lovely library!\n");
}

// Function to view all books in the library
void viewBooks() {
    if (bookCount == 0) {
        printf("Your library is empty, my dear. Please add some books first.\n");
        return;
    }

    printf("Here are the books in your library:\n");
    for (int i = 0; i < bookCount; i++) {
        printf("Title: %s, Author: %s, Year: %d\n", library[i].title, library[i].author, library[i].year);
    }
}

// Function to search for a book by title
void searchBook() {
    char searchTitle[TITLE_LENGTH];
    printf("Enter the title of the book you are looking for: ");
    fgets(searchTitle, TITLE_LENGTH, stdin);
    searchTitle[strcspn(searchTitle, "\n")] = '\0'; // Remove newline character

    for (int i = 0; i < bookCount; i++) {
        if (strcmp(library[i].title, searchTitle) == 0) {
            printf("Book found! Title: %s, Author: %s, Year: %d\n", library[i].title, library[i].author, library[i].year);
            return;
        }