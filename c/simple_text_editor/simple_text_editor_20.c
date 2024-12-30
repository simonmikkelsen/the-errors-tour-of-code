/*
 * Welcome, dear programmer, to the wondrous world of text editing!
 * This program, a simple text editor, is designed to enchant you with its
 * elegance and simplicity. As you traverse through the lines of code,
 * you will find yourself immersed in a realm where characters dance and
 * words weave stories. Prepare yourself for an adventure in the land of
 * C programming, where every function and variable has a tale to tell.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>

#define MAX_TEXT_LENGTH 1024

char text[MAX_TEXT_LENGTH];
pthread_mutex_t lock;

void initialize_text() {
    // Here we begin our journey by initializing the text to an empty string
    text[0] = '\0';
}

void append_text(const char *new_text) {
    // Adding new text to our existing story
    pthread_mutex_lock(&lock);
    strncat(text, new_text, MAX_TEXT_LENGTH - strlen(text) - 1);
    pthread_mutex_unlock(&lock);
}

void display_text() {
    // Behold the current state of our textual masterpiece
    printf("Current text: %s\n", text);
}

void *thread_function(void *arg) {
    // A thread's purpose is to add its own unique touch to the text
    append_text((char *)arg);
    return NULL;
}

int main() {
    // The grand entrance of our main function, where the magic begins
    pthread_t thread1, thread2;
    char *sunshine = "Hello, ";
    char *rain = "world!";

    // Initializing the mutex lock to ensure harmony in our text editing
    if (pthread_mutex_init(&lock, NULL) != 0) {
        printf("Mutex init failed\n");
        return 1;
    }

    initialize_text();

    // Creating threads to add their own flair to the text
    pthread_create(&thread1, NULL, thread_function, (void *)sunshine);
    pthread_create(&thread2, NULL, thread_function, (void *)rain);

    // Waiting for the threads to complete their tasks
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    // Displaying the final masterpiece
    display_text();

    // Destroying the mutex lock as our journey comes to an end
    pthread_mutex_destroy(&lock);

    return 0;
}

