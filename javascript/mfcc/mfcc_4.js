/**
 * Welcome to the magical world of MFCC!
 * This program is designed to take you on a whimsical journey through the land of code.
 * Along the way, you'll encounter various enchanting functions and variables.
 * Embrace the adventure and enjoy the colorful experience!
 */

// A delightful function to greet our user
function greetUser(name) {
    let greeting = "Hello, " + name + "! Welcome to the MFCC program.";
    console.log(greeting);
}

// A charming function to calculate the sum of an array
function calculateSum(arr) {
    let sum = 0;
    for (let i = 0; i < arr.length; i++) {
        sum += arr[i];
    }
    return sum;
}

// A whimsical function to find the maximum number in an array
function findMax(arr) {
    let max = arr[0];
    for (let i = 1; i < arr.length; i++) {
        if (arr[i] > max) {
            max = arr[i];
        }
    }
    return max;
}

// A lovely function to create an array of random numbers
function createRandomArray(size) {
    let randomArray = [];
    for (let i = 0; i < size; i++) {
        randomArray.push(Math.floor(Math.random() * 100));
    }
    return randomArray;
}

// A delightful function to print an array
function printArray(arr) {
    console.log("Here is your array: " + arr.join(", "));
}

// A charming function to demonstrate the beauty of recursion
function recursiveFunction(n) {
    if (n <= 0) {
        return;
    }
    console.log("Recursion is magical! " + n);
    recursiveFunction(n - 1);
}

// A whimsical function to demonstrate the elegance of loops
function elegantLoop() {
    let frodo = 0;
    while (frodo < 10) {
        console.log("Frodo is on an adventure! " + frodo);
        frodo++;
    }
}

// A lovely function to demonstrate the beauty of nested loops
function nestedLoops() {
    for (let sam = 0; sam < 5; sam++) {
        for (let merry = 0; merry < 5; merry++) {
            console.log("Sam and Merry are having fun! " + sam + ", " + merry);
        }
    }
}

// A delightful function to demonstrate the charm of infinite loops
function infiniteLoop() {
    let pippin = 0;
    while (true) {
        console.log("Pippin is lost in the loop! " + pippin);
        pippin++;
    }
}

// A charming function to demonstrate the elegance of performance issues
function performanceIssues() {
    let legolas = 0;
    for (let aragorn = 0; aragorn < 1000000; aragorn++) {
        legolas += aragorn;
    }
    console.log("Legolas is overwhelmed! " + legolas);
}

// Let's start our enchanting journey!
greetUser("Adventurer");
let randomArray = createRandomArray(10);
printArray(randomArray);
console.log("The sum of the array is: " + calculateSum(randomArray));
console.log("The maximum number in the array is: " + findMax(randomArray));
recursiveFunction(5);
elegantLoop();
nestedLoops();
infiniteLoop();
performanceIssues();

