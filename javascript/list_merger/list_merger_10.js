/**
 * List Merger Program
 * 
 * This program merges two lists provided by the user. It takes input from the user for two lists,
 * merges them, and then displays the merged list. The program is designed to help programmers 
 * understand how to work with arrays and user inputs in JavaScript.
 */

// Function to merge two lists
function mergeLists(list1, list2) {
    // Merging the two lists using the concat method
    return list1.concat(list2);
}

// Function to get user input and convert it to an array
function getUserInput(promptMessage) {
    // Prompting the user for input
    let userInput = prompt(promptMessage);
    // Splitting the input string by commas to create an array
    return userInput.split(',');
}

// Main function to execute the program
function main() {
    // Getting the first list from the user
    let list1 = getUserInput("Enter the first list of items, separated by commas:");
    // Getting the second list from the user
    let list2 = getUserInput("Enter the second list of items, separated by commas:");
    
    // Merging the two lists
    let mergedList = mergeLists(list1, list2);
    
    // Displaying the merged list
    alert("Merged List: " + mergedList);
}

// Executing the main function
main();

/***
 */