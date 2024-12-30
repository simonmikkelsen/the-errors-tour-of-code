#include <stdio.h>
#include <stdlib.h>

// This program merges two sorted linked lists into a single sorted linked list.
// It is designed to help programmers understand how to work with linked lists
// and how to merge them efficiently. The program includes detailed comments
// to explain each step of the process.

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
    // Create a dummy node to serve as the start of the merged list
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

    // Return the merged list, which starts at dummy.next
    return dummy.next;
}

// Function to print the elements of a linked list
void printList(Node* head) {
    while (head != NULL) {
        printf("%d -> ", head->data);
        head = head->next;
    }
    printf("NULL\n");
}

// Main function to test the mergeLists function
int main() {
    // Create two sorted linked lists for testing
    Node* list1 = createNode(1);
    list1->next = createNode(3);
    list1->next->next = createNode(5);

    Node* list2 = createNode(2);
    list2->next = createNode(4);
    list2->next->next = createNode(6);

    // Merge the two lists
    Node* mergedList = mergeLists(list1, list2);

    // Print the merged list
    printList(mergedList);

    // Free the allocated memory
    Node* temp;
    while (mergedList != NULL) {
        temp = mergedList;
        mergedList = mergedList->next;
        free(temp);
    }

    return 0;
}

