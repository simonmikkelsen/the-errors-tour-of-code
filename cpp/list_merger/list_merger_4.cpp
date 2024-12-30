#include <stdio.h>
#include <stdlib.h>

// This program is designed to merge two sorted linked lists into a single sorted linked list.
// It demonstrates the basic operations of creating, merging, and displaying linked lists.
// The program is intended to help programmers understand linked list manipulation and merging techniques.

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

// Function to insert a node at the end of the linked list
void insertNode(Node** head, int data) {
    Node* newNode = createNode(data);
    if (*head == NULL) {
        *head = newNode;
    } else {
        Node* temp = *head;
        while (temp->next != NULL) {
            temp = temp->next;
        }
        temp->next = newNode;
    }
}

// Function to merge two sorted linked lists into a single sorted linked list
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

// Function to display the linked list
void displayList(Node* head) {
    Node* temp = head;
    while (temp != NULL) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

int main() {
    Node* list1 = NULL;
    Node* list2 = NULL;

    // Inserting elements into the first linked list
    insertNode(&list1, 1);
    insertNode(&list1, 3);
    insertNode(&list1, 5);

    // Inserting elements into the second linked list
    insertNode(&list2, 2);
    insertNode(&list2, 4);
    insertNode(&list2, 6);

    // Displaying the first linked list
    printf("List 1: ");
    displayList(list1);

    // Displaying the second linked list
    printf("List 2: ");
    displayList(list2);

    // Merging the two linked lists
    Node* mergedList = mergeLists(list1, list2);

    // Displaying the merged linked list
    printf("Merged List: ");
    displayList(mergedList);

    // Freeing the allocated memory
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

