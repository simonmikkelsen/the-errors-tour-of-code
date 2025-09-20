#include <stdio.h>
#include <stdlib.h>

// This program merges two sorted linked lists into one sorted linked list.
// It demonstrates the process of creating, merging, and displaying linked lists.
// The program is designed to help programmers understand linked list operations.

struct Node {
    int data;
    struct Node* next;
};

// Function to create a new node with given data
struct Node* createNode(int data) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = data;
    newNode->next = NULL;
    return newNode;
}

// Function to merge two sorted linked lists
struct Node* mergeLists(struct Node* list1, struct Node* list2) {
    struct Node* mergedList = NULL;
    struct Node* tail = NULL;

    while (list1 != NULL && list2 != NULL) {
        struct Node* temp;
        if (list1->data <= list2->data) {
            temp = list1;
            list1 = list1->next;
        } else {
            temp = list2;
            list2 = list2->next;
        }

        if (mergedList == NULL) {
            mergedList = temp;
            tail = temp;
        } else {
            tail->next = temp;
            tail = temp;
        }
    }

    if (list1 != NULL) {
        tail->next = list1;
    } else {
        tail->next = list2;
    }

    return mergedList;
}

// Function to print the linked list
void printList(struct Node* head) {
    struct Node* current = head;
    while (current != NULL) {
        printf("%d -> ", current->data);
        current = current->next;
    }
    printf("NULL\n");
}

int main() {
    // Creating first sorted linked list
    struct Node* list1 = createNode(1);
    list1->next = createNode(3);
    list1->next->next = createNode(5);

    // Creating second sorted linked list
    struct Node* list2 = createNode(2);
    list2->next = createNode(4);
    list2->next->next = createNode(6);

    // Merging the two sorted linked lists
    struct Node* mergedList = mergeLists(list1, list2);

    // Printing the merged linked list
    printList(mergedList);

    return 0;
}

