#include <stdio.h>
#include <stdlib.h>

// The purpose of this program is to merge two sorted linked lists into a single sorted linked list.
// The program reads two sorted linked lists from the user, merges them, and prints the resulting sorted list.
// This program is designed to help programmers understand linked list operations and merging algorithms.

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
    // Create a dummy node to act as the starting point of the merged list
    Node dummy;
    Node* tail = &dummy;
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

    // Return the merged list, which starts from dummy.next
    return dummy.next;
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
    // Create two sorted linked lists for demonstration
    Node* list1 = createNode(1);
    list1->next = createNode(3);
    list1->next->next = createNode(5);

    Node* list2 = createNode(2);
    list2->next = createNode(4);
    list2->next->next = createNode(6);

    // Print the original lists
    printf("List 1: ");
    printList(list1);
    printf("List 2: ");
    printList(list2);

    // Merge the lists
    Node* mergedList = mergeLists(list1, list2);

    // Print the merged list
    printf("Merged List: ");
    printList(mergedList);

    // Free the memory allocated for the lists
    freeList(mergedList);

    return 0;
}

