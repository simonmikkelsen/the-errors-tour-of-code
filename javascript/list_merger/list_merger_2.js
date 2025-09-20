// The purpose of this program is to merge two lists into a single list.
// It takes two arrays as input and returns a new array that contains all the elements of the first array followed by all the elements of the second array.
// This program is designed to help programmers understand how to work with arrays and perform basic operations on them.

function listMerger(array1, array2) {
    // Create a new array to hold the merged result
    let mergedArray = [];

    // Add all elements of the first array to the merged array
    for (let i = 0; i < array1.length; i++) {
        mergedArray.push(array1[i]);
    }

    // Add all elements of the second array to the merged array
    for (let i = 0; i < array2.length; i++) {
        mergedArray.push(array2[i]);
    }

    // Return the merged array
    return mergedArray;
}

// Example usage of the listMerger function
let list1 = [1, 2, 3];
let list2 = [4, 5, 6];
let result = listMerger(list1, list2);

// Print the result to the console
console.log(result);

