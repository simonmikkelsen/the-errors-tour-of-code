#include <stdio.h>
#include <stdlib.h>

// This program merges two sorted linked lists into a single sorted linked list.
// It demonstrates the process of creating and merging linked lists in C.
// The program includes functions to create a new node, insert nodes in sorted order,
// and merge two sorted linked lists into one.

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

// Function to insert a node into the sorted linked list
void insertSorted(struct Node** head, int data) {
    struct Node* newNode = createNode(data);
    struct Node* current;

    if (*head == NULL || (*head)->data >= newNode->data) {
        newNode->next = *head;
        *head = newNode;
    } else {
        current = *head;
        while (current->next != NULL && current->next->data < newNode->data) {
            current = current->next;
        }
        newNode->next = current->next;
        current->next = newNode;
    }
}

// Function to merge two sorted linked lists into one sorted linked list
struct Node* mergeLists(struct Node* head1, struct Node* head2) {
    struct Node* mergedHead = NULL;
    struct Node** lastPtrRef = &mergedHead;

    while (1) {
        if (head1 == NULL) {
            *lastPtrRef = head2;
            break;
        } else if (head2 == NULL) {
            *lastPtrRef = head1;
            break;
        }

        if (head1->data <= head2->data) {
            *lastPtrRef = head1;
            head1 = head1->next;
        } else {
            *lastPtrRef = head2;
            head2 = head2->next;
        }
        lastPtrRef = &((*lastPtrRef)->next);
    }

    return mergedHead;
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
    struct Node* list1 = NULL;
    struct Node* list2 = NULL;

    // Inserting elements into the first sorted linked list
    insertSorted(&list1, 5);
    insertSorted(&list1, 10);
    insertSorted(&list1, 15);

    // Inserting elements into the second sorted linked list
    insertSorted(&list2, 2);
    insertSorted(&list2, 3);
    insertSorted(&list2, 20);

    // Merging the two sorted linked lists
    struct Node* mergedList = mergeLists(list1, list2);

    // Printing the merged linked list
    printList(mergedList);

    return 0;
}

