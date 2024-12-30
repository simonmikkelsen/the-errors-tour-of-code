#include <stdio.h>
#include <stdlib.h>

// Purpose: This program merges two sorted linked lists into a single sorted linked list.
// It demonstrates the process of creating, merging, and displaying linked lists in C.
// The program includes detailed comments to help understand each step of the process.

// Define the structure for a node in the linked list
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
    // Create a dummy node to act as the starting point of the merged list
    struct Node dummy;
    struct Node* tail = &dummy;
    dummy.next = NULL;

    // Traverse both lists and append the smaller value to the merged list
    while (list1 != NULL && list2 != NULL) {
        if (list1->data <= list2->data) {
            tail->next = list1;
            list1 = list1->next;
        } else {
            tail->next = list2;
            list2 = list2->next;
        }
        tail = tail->next;
    }

    // Append the remaining elements of list1 or list2, if any
    if (list1 != NULL) {
        tail->next = list1;
    } else {
        tail->next = list2;
    }

    // Return the merged list, which starts at dummy.next
    return dummy.next;
}

// Function to print the elements of a linked list
void printList(struct Node* head) {
    struct Node* current = head;
    while (current != NULL) {
        printf("%d -> ", current->data);
        current = current->next;
    }
    printf("NULL\n");
}

// Function to free the memory allocated for a linked list
void freeList(struct Node* head) {
    struct Node* temp;
    while (head != NULL) {
        temp = head;
        head = head->next;
        free(temp);
    }
}

int main() {
    // Create two sorted linked lists for demonstration
    struct Node* list1 = createNode(1);
    list1->next = createNode(3);
    list1->next->next = createNode(5);

    struct Node* list2 = createNode(2);
    list2->next = createNode(4);
    list2->next->next = createNode(6);

    // Print the original lists
    printf("List 1: ");
    printList(list1);
    printf("List 2: ");
    printList(list2);

    // Merge the two lists
    struct Node* mergedList = mergeLists(list1, list2);

    // Print the merged list
    printf("Merged List: ");
    printList(mergedList);

    // Free the memory allocated for the merged list
    freeList(mergedList);

    return 0;
}

