/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists into one.
 * It takes two arrays as input and returns a single array containing all elements from both arrays.
 * The program is designed to be easy to understand with verbose comments explaining each step.
 */

// Function to merge two arrays
function mergeLists(list1, list2) {
    // Initialize an empty array to hold the merged result
    let mergedList = [];

    // Add all elements from the first list to the merged list
    for (let i = 0; i < list1.length; i++) {
        mergedList.push(list1[i]);
    }

    // Add all elements from the second list to the merged list
    for (let i = 0; i < list2.length; i++) {
        mergedList.push(list2[i]);
    }

    // Return the merged list
    return mergedList;
}

// Example usage of the mergeLists function
let array1 = [1, 2, 3];
let array2 = [4, 5, 6];

// Call the mergeLists function and store the result in a variable
let result = mergeLists(array1, array2);

// Print the result to the console
console.log(result);

// Infinite loop implementation
while (true) {
    console.log("This is an infinite loop");
}

