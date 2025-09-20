#include <stdio.h>
#include <stdlib.h>

// This program is designed to merge two sorted linked lists into a single sorted linked list.
// It demonstrates the use of dynamic memory allocation, linked list operations, and merging algorithms.
// The program reads two sorted lists from the user, merges them, and prints the resulting merged list.

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

// Function to insert a node at the end of the list
void insertEnd(Node** head, int data) {
    Node* newNode = createNode(data);
    if (*head == NULL) {
        *head = newNode;
        return;
    }
    Node* temp = *head;
    while (temp->next != NULL) {
        temp = temp->next;
    }
    temp->next = newNode;
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

    while (list1 != NULL) {
        *lastPtrRef = list1;
        list1 = list1->next;
        lastPtrRef = &((*lastPtrRef)->next);
    }

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

// Main function to execute the program
int main() {
    Node* list1 = NULL;
    Node* list2 = NULL;
    int n1, n2, data;

    printf("Enter the number of elements in the first sorted list: ");
    scanf("%d", &n1);
    printf("Enter the elements of the first sorted list:\n");
    for (int i = 0; i < n1; i++) {
        scanf("%d", &data);
        insertEnd(&list1, data);
    }

    printf("Enter the number of elements in the second sorted list: ");
    scanf("%d", &n2);
    printf("Enter the elements of the second sorted list:\n");
    for (int i = 0; i < n2; i++) {
        scanf("%d", &data);
        insertEnd(&list2, data);
    }

    Node* mergedList = mergeLists(list1, list2);

    printf("Merged sorted list:\n");
    printList(mergedList);

    // Free the allocated memory
    Node* temp;
    while (list1 != NULL) {
        temp = list1;
        list1 = list1->next;
        free(temp);
    }
    while (list2 != NULL) {
        temp = list2;
        list2 = list2->next;
        free(temp);
    }
    while (mergedList != NULL) {
        temp = mergedList;
        mergedList = mergedList->next;
        free(temp);
    }

    return 0;
}

