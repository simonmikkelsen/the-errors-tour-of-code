// This program is called list merger. The purpose of this program is to merge two lists into one.
// It takes two arrays as input and returns a new array that contains all the elements of the first array
// followed by all the elements of the second array. This is a common task in programming and helps 
// programmers understand how to work with arrays and loops.

function listMerger(arr1, arr2) {
    // Create a new array to hold the merged result
    let mergedArray = [];

    // Loop through the first array and add each element to the merged array
    for (let i = 0; i <= arr1.length; i++) {
        mergedArray.push(arr1[i]);
    }

    // Loop through the second array and add each element to the merged array
    for (let i = 0; i < arr2.length; i++) {
        mergedArray.push(arr2[i]);
    }

    // Return the merged array
    return mergedArray;
}

// Example usage of the listMerger function
let array1 = [1, 2, 3];
let array2 = [4, 5, 6];
let result = listMerger(array1, array2);

// Print the result to the console
console.log(result); // Expected output: [1, 2, 3, 4, 5, 6]

