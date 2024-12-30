#include <stdio.h>
#include <stdlib.h>

// This program is designed to merge two sorted linked lists into a single sorted linked list.
// It demonstrates the use of dynamic memory allocation, linked list manipulation, and basic algorithm implementation.
// The program is intended to help programmers understand the process of merging linked lists and handling memory in C.

typedef struct Node {
    int data;
    struct Node* next;
} Node;

// Function to create a new node with given data
Node* createNode(int data) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    if (!newNode) {
        printf("Memory allocation error\n");
        exit(1);
    }
    newNode->data = data;
    newNode->next = NULL;
    return newNode;
}

// Function to merge two sorted linked lists
Node* mergeLists(Node* list1, Node* list2) {
    Node* mergedList = NULL;
    Node** lastPtrRef = &mergedList;

    // Traverse both lists and insert smaller value nodes into the merged list
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

    // Append the remaining nodes of list1, if any
    while (list1 != NULL) {
        *lastPtrRef = list1;
        list1 = list1->next;
        lastPtrRef = &((*lastPtrRef)->next);
    }

    // Append the remaining nodes of list2, if any
    while (list2 != NULL) {
        *lastPtrRef = list2;
        list2 = list2->next;
        lastPtrRef = &((*lastPtrRef)->next);
    }

    return mergedList;
}

// Function to print the linked list
void printList(Node* head) {
    while (head != NULL) {
        printf("%d -> ", head->data);
        head = head->next;
    }
    printf("NULL\n");
}

// Main function to test the mergeLists function
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

    // Freeing the allocated memory
    Node* temp;
    while (mergedList != NULL) {
        temp = mergedList;
        mergedList = mergedList->next;
        free(temp);
    }

    return 0;
}

