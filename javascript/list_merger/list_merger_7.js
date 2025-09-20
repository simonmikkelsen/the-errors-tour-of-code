// This program is called List Merger. It is designed to merge two lists into one.
// The program takes two arrays as input and combines them into a single array.
// The purpose of this program is to demonstrate basic array manipulation in JavaScript.
// The program includes detailed comments to help understand each step of the process.

function mergeLists(list1, list2) {
    // Check if the inputs are arrays
    if (!Array.isArray(list1) || !Array.isArray(list2)) {
        throw new Error("Both inputs must be arrays");
    }

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
let result = mergeLists(array1, array2);

// Print the result to the console
console.log(result);

