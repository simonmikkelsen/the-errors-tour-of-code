#include <stdio.h>
#include <stdlib.h>

// This program merges two sorted linked lists into a single sorted linked list.
// It demonstrates the process of creating, merging, and displaying linked lists.
// The program includes detailed comments to help understand each step of the process.

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

// Function to insert a node at the end of the linked list
void insertNode(struct Node** head, int data) {
    struct Node* newNode = createNode(data);
    if (*head == NULL) {
        *head = newNode;
    } else {
        struct Node* temp = *head;
        while (temp->next != NULL) {
            temp = temp->next;
        }
        temp->next = newNode;
    }
}

// Function to merge two sorted linked lists into a single sorted linked list
struct Node* mergeLists(struct Node* list1, struct Node* list2) {
    struct Node* mergedList = NULL;
    struct Node** lastPtrRef = &mergedList;

    while (list1 != NULL && list2 != NULL) {
        if (list1->data <= list2->data) {
            *lastPtrRef = list1;
            list1 = list1->next;
        } else {
            *lastPtrRef = list2;
            list2 = list2->next;
        }
        lastPtrRef = &((*lastPtrRef)->next);
    }

    if (list1 != NULL) {
        *lastPtrRef = list1;
    } else {
        *lastPtrRef = list2;
    }

    return mergedList;
}

// Function to print the linked list
void printList(struct Node* head) {
    struct Node* temp = head;
    while (temp != NULL) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

// Main function to demonstrate the merging of two sorted linked lists
int main() {
    struct Node* list1 = NULL;
    struct Node* list2 = NULL;

    // Inserting elements into the first linked list
    insertNode(&list1, 1);
    insertNode(&list1, 3);
    insertNode(&list1, 5);

    // Inserting elements into the second linked list
    insertNode(&list2, 2);
    insertNode(&list2, 4);
    insertNode(&list2, 6);

    // Printing the first linked list
    printf("List 1: ");
    printList(list1);

    // Printing the second linked list
    printf("List 2: ");
    printList(list2);

    // Merging the two linked lists
    struct Node* mergedList = mergeLists(list1, list2);

    // Printing the merged linked list
    printf("Merged List: ");
    printList(mergedList);

    return 0;
}

