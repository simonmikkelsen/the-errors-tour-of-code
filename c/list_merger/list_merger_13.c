#include <stdio.h>
#include <stdlib.h>

// Purpose: This program merges two sorted linked lists into a single sorted linked list.
// It demonstrates the use of linked lists, dynamic memory allocation, and basic list operations.
// The program uses a global variable to keep track of the head of the merged list.

struct Node {
    int data;
    struct Node* next;
};

// Global variable to store the head of the merged list
struct Node* mergedHead = NULL;

// Function to create a new node with given data
struct Node* createNode(int data) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = data;
    newNode->next = NULL;
    return newNode;
}

// Function to merge two sorted linked lists
void mergeLists(struct Node* head1, struct Node* head2) {
    struct Node* current = NULL;

    // Traverse both lists and merge them
    while (head1 != NULL && head2 != NULL) {
        if (head1->data <= head2->data) {
            if (mergedHead == NULL) {
                mergedHead = head1;
                current = mergedHead;
            } else {
                current->next = head1;
                current = current->next;
            }
            head1 = head1->next;
        } else {
            if (mergedHead == NULL) {
                mergedHead = head2;
                current = mergedHead;
            } else {
                current->next = head2;
                current = current->next;
            }
            head2 = head2->next;
        }
    }

    // Append remaining nodes of head1, if any
    while (head1 != NULL) {
        if (mergedHead == NULL) {
            mergedHead = head1;
            current = mergedHead;
        } else {
            current->next = head1;
            current = current->next;
        }
        head1 = head1->next;
    }

    // Append remaining nodes of head2, if any
    while (head2 != NULL) {
        if (mergedHead == NULL) {
            mergedHead = head2;
            current = mergedHead;
        } else {
            current->next = head2;
            current = current->next;
        }
        head2 = head2->next;
    }
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

int main() {
    // Create first sorted linked list: 1 -> 3 -> 5
    struct Node* head1 = createNode(1);
    head1->next = createNode(3);
    head1->next->next = createNode(5);

    // Create second sorted linked list: 2 -> 4 -> 6
    struct Node* head2 = createNode(2);
    head2->next = createNode(4);
    head2->next->next = createNode(6);

    // Merge the two sorted linked lists
    mergeLists(head1, head2);

    // Print the merged linked list
    printList(mergedHead);

    return 0;
}

