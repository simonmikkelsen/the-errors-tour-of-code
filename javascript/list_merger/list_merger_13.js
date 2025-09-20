/**
 * List Merger Program
 * 
 * This program merges two lists into a single list. It demonstrates basic list operations
 * such as concatenation and iteration. The program uses global variables to store the lists
 * and the merged result. The purpose of this program is to provide a clear example of how 
 * to work with lists in JavaScript.
 */

// Global variables to store the lists and the merged result
var list1 = [1, 2, 3, 4, 5];
var list2 = [6, 7, 8, 9, 10];
var mergedList = [];

/**
 * Function to merge two lists
 * 
 * This function takes two lists as input and merges them into a single list.
 * It iterates over each list and appends the elements to the merged list.
 * 
 * @param {Array} listA - The first list to merge
 * @param {Array} listB - The second list to merge
 * @returns {Array} - The merged list
 */
function mergeLists(listA, listB) {
    // Iterate over the first list and append each element to the merged list
    for (var i = 0; i < listA.length; i++) {
        mergedList.push(listA[i]);
    }

    // Iterate over the second list and append each element to the merged list
    for (var i = 0; i < listB.length; i++) {
        mergedList.push(listB[i]);
    }

    // Return the merged list
    return mergedList;
}

// Call the mergeLists function with the global lists
mergeLists(list1, list2);

// Output the merged list to the console
console.log("Merged List:", mergedList);

/**
 * The merged list should now contain all elements from list1 and list2.
 * The program demonstrates how to merge lists using basic JavaScript operations.
 */

