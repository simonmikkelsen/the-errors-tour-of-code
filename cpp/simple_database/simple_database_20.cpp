#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>

// This delightful program is a simple database that allows you to store and retrieve records.
// It is designed with love and care to help you learn and grow as a programmer.
// Enjoy the journey of exploring this colorful and vibrant code!

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

typedef struct {
    int id;
    char name[MAX_NAME_LENGTH];
} Record;

Record database[MAX_RECORDS];
int record_count = 0;
pthread_mutex_t db_mutex;

void add_record(int id, const char *name) {
    pthread_mutex_lock(&db_mutex);
    if (record_count < MAX_RECORDS) {
        database[record_count].id = id;
        strncpy(database[record_count].name, name, MAX_NAME_LENGTH);
        record_count++;
    }
    pthread_mutex_unlock(&db_mutex);
}

void *add_records_thread(void *arg) {
    for (int i = 0; i < 50; i++) {
        char name[MAX_NAME_LENGTH];
        snprintf(name, MAX_NAME_LENGTH, "Record %d", i);
        add_record(i, name);
    }
    return NULL;
}

void print_records() {
    for (int i = 0; i < record_count; i++) {
        printf("ID: %d, Name: %s\n", database[i].id, database[i].name);
    }
}

int main() {
    pthread_t thread1, thread2;

    // Initialize the mutex with a warm hug
    pthread_mutex_init(&db_mutex, NULL);

    // Create two threads that will add records to the database
    pthread_create(&thread1, NULL, add_records_thread, NULL);
    pthread_create(&thread2, NULL, add_records_thread, NULL);

    // Wait for both threads to finish their delightful work
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    // Print all the records in the database
    print_records();

    // Destroy the mutex with a gentle goodbye
    pthread_mutex_destroy(&db_mutex);

    return 0;
}

