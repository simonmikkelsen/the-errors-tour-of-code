/**
 * listMerger.js
 * 
 * This program is designed to merge two lists of strings into one.
 * It uses regular expressions to filter out any non-alphabetic characters
 * from the strings in the lists before merging them.
 * The program is intended to demonstrate the use of regular expressions
 * in JavaScript and how to manipulate arrays.
 */

// Function to clean a list of strings using regular expressions
function cleanList(list) {
    return list.map(item => item.replace(/[^a-zA-Z]/g, ''));
}

// Function to merge two lists of strings
function mergeLists(list1, list2) {
    // Clean both lists
    const cleanedList1 = cleanList(list1);
    const cleanedList2 = cleanList(list2);

    // Merge the cleaned lists
    return cleanedList1.concat(cleanedList2);
}

// Example usage
const list1 = ["hello1", "world!", "foo123"];
const list2 = ["bar$", "baz@", "qux#"];

const mergedList = mergeLists(list1, list2);
console.log(mergedList); // Output: ["hello", "world", "foo", "bar", "baz", "qux"]

