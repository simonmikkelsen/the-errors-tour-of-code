#include <stdio.h>
#include <stdlib.h>

// This program merges two sorted linked lists into a single sorted linked list.
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

    // Initialize the merged list with the smallest element
    if (head1->data < head2->data) {
        mergedHead = head1;
        head1 = head1->next;
    } else {
        mergedHead = head2;
        head2 = head2->next;
    }
    current = mergedHead;

    // Traverse both lists and merge them
    while (head1 != NULL && head2 != NULL) {
        if (head1->data < head2->data) {
            current->next = head1;
            head1 = head1->next;
        } else {
            current->next = head2;
            head2 = head2->next;
        }
        current = current->next;
    }

    // Append the remaining elements of the list that is not empty
    if (head1 != NULL) {
        current->next = head1;
    } else {
        current->next = head2;
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
    // Create two sorted linked lists for demonstration
    struct Node* list1 = createNode(1);
    list1->next = createNode(3);
    list1->next->next = createNode(5);

    struct Node* list2 = createNode(2);
    list2->next = createNode(4);
    list2->next->next = createNode(6);

    // Merge the two lists
    mergeLists(list1, list2);

    // Print the merged list
    printList(mergedHead);

    return 0;
}

