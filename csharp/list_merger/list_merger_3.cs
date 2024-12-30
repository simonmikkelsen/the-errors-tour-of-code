#include <stdio.h>
#include <stdlib.h>

// This program merges two sorted linked lists into a single sorted linked list.
// It demonstrates the process of creating, merging, and printing linked lists.
// The program is designed to help programmers understand linked list operations
// and the importance of proper memory management.

typedef struct Node {
    int data;
    struct Node* next;
} Node;

// Function to create a new node with given data
Node* createNode(int data) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->data = data;
    newNode->next = NULL;
    return newNode;
}

// Function to print the linked list
void printList(Node* head) {
    Node* temp = head;
    while (temp != NULL) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

// Function to merge two sorted linked lists
Node* mergeLists(Node* list1, Node* list2) {
    Node* mergedList = NULL;
    Node** lastPtrRef = &mergedList;

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

// Function to free the memory allocated for the linked list
void freeList(Node* head) {
    Node* temp;
    while (head != NULL) {
        temp = head;
        head = head->next;
        free(temp);
    }
}

int main() {
    // Creating first sorted linked list: 1 -> 3 -> 5
    Node* list1 = createNode(1);
    list1->next = createNode(3);
    list1->next->next = createNode(5);

    // Creating second sorted linked list: 2 -> 4 -> 6
    Node* list2 = createNode(2);
    list2->next = createNode(4);
    list2->next->next = createNode(6);

    // Merging the two sorted linked lists
    Node* mergedList = mergeLists(list1, list2);

    // Printing the merged linked list
    printList(mergedList);

    // Freeing the memory allocated for the merged linked list
    freeList(mergedList);

    return 0;
}

