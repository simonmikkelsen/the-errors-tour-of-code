#include <stdio.h>
#include <stdlib.h>

// The purpose of this program is to merge two sorted linked lists into a single sorted linked list.
// The program defines the structure for a linked list node and provides functions to create nodes,
// insert nodes into the list, and merge two sorted lists. The main function demonstrates the usage
// of these functions by creating two sample lists, merging them, and printing the result.

// Define the structure for a linked list node
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

// Function to insert a node at the end of the list
void insertNode(struct Node** head, int data) {
    struct Node* newNode = createNode(data);
    if (*head == NULL) {
        *head = newNode;
    } else {
        struct Node* temp = *head;
        while (temp->next != NULL) {
            temp = temp->next;
        }
        temp->next = newNode;
    }
}

// Function to merge two sorted linked lists into a single sorted linked list
struct Node* mergeLists(struct Node* list1, struct Node* list2) {
    // Create a dummy node to serve as the starting point of the merged list
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

    // Append the remaining nodes of list1, if any
    if (list1 != NULL) {
        tail->next = list1;
    }

    // Append the remaining nodes of list2, if any
    if (list2 != NULL) {
        tail->next = list2;
    }

    // Return the merged list, which starts from the next node of the dummy node
    return dummy.next;
}

// Function to print the elements of a linked list
void printList(struct Node* head) {
    struct Node* temp = head;
    while (temp != NULL) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

// Main function to demonstrate the merging of two sorted linked lists
int main() {
    // Create two sorted linked lists
    struct Node* list1 = NULL;
    struct Node* list2 = NULL;

    // Insert elements into the first list
    insertNode(&list1, 1);
    insertNode(&list1, 3);
    insertNode(&list1, 5);

    // Insert elements into the second list
    insertNode(&list2, 2);
    insertNode(&list2, 4);
    insertNode(&list2, 6);

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

    return 0;
}

