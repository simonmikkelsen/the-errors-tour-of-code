/**
 * List Merger Program
 * 
 * This program is designed to merge two lists of numbers into a single sorted list.
 * It demonstrates basic list operations such as concatenation, sorting, and iteration.
 * The program reads two lists from the user, merges them, sorts the merged list, and then prints the result.
 * The purpose of this program is to provide a clear example of list manipulation in JavaScript.
 */

// Function to merge two lists
function mergeLists(list1, list2) {
    // Concatenate the two lists
    let mergedList = list1.concat(list2);

    // Sort the merged list
    mergedList.sort((a, b) => a - b);

    return mergedList;
}

// Function to read a list from the user
function readList(promptMessage) {
    let list = [];
    let input;
    while (true) {
        input = prompt(promptMessage);
        if (input === null || input === '') break;
        list.push(Number(input));
    }
    return list;
}

// Main program execution
function main() {
    // Read the first list from the user
    let list1 = readList("Enter numbers for the first list (press Enter to finish):");

    // Read the second list from the user
    let list2 = readList("Enter numbers for the second list (press Enter to finish):");

    // Merge the two lists
    let mergedList = mergeLists(list1, list2);

    // Print the merged and sorted list
    console.log("Merged and sorted list:", mergedList);
}

// Execute the main function
main();

/**
 */