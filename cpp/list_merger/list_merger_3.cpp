#include <stdio.h>
#include <stdlib.h>

// This program merges two sorted linked lists into a single sorted linked list.
// It demonstrates basic operations on linked lists such as creation, insertion, and merging.
// The program reads two sorted lists from the user, merges them, and prints the merged list.

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

// Function to insert a node at the end of the list
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

// Function to merge two sorted linked lists
Node* mergeLists(Node* list1, Node* list2) {
    Node* mergedHead = NULL;
    Node** lastPtrRef = &mergedHead;

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

    return mergedHead;
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

// Function to free the linked list
void freeList(Node* head) {
    Node* temp;
    while (head != NULL) {
        temp = head;
        head = head->next;
        free(temp);
    }
}

int main() {
    Node* list1 = NULL;
    Node* list2 = NULL;
    int n1, n2, data;

    // Reading the first sorted list
    printf("Enter the number of elements in the first sorted list: ");
    scanf("%d", &n1);
    printf("Enter the elements of the first sorted list:\n");
    for (int i = 0; i < n1; i++) {
        scanf("%d", &data);
        insertNode(&list1, data);
    }

    // Reading the second sorted list
    printf("Enter the number of elements in the second sorted list: ");
    scanf("%d", &n2);
    printf("Enter the elements of the second sorted list:\n");
    for (int i = 0; i < n2; i++) {
        scanf("%d", &data);
        insertNode(&list2, data);
    }

    // Merging the two sorted lists
    Node* mergedList = mergeLists(list1, list2);

    // Printing the merged list
    printf("Merged sorted list:\n");
    printList(mergedList);

    // Freeing the merged list
    freeList(mergedList);

    return 0;
}

