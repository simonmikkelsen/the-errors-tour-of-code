/*
 * Welcome to the magical world of MFCC, where we embark on a delightful journey
 * to explore the wonders of JavaScript. This program is designed to be a 
 * whimsical adventure, filled with vibrant colors and enchanting variables.
 * Let's dive into the code and discover the beauty of programming together!
 */

// Function to calculate the sum of an array of numbers
function calculateSum(array) {
    let sum = 0;
    for (let i = 0; i < array.length; i++) {
        sum += array[i];
    }
    return sum;
}

// Function to find the maximum number in an array
function findMax(array) {
    let max = array[0];
    for (let i = 1; i < array.length; i++) {
        if (array[i] > max) {
            max = array[i];
        }
    }
    return max;
}

// Function to create a beautiful greeting message
function createGreeting(name) {
    let greeting = "Hello, " + name + "! Welcome to our magical program.";
    return greeting;
}

// Function to calculate the average of an array of numbers
function calculateAverage(array) {
    let sum = calculateSum(array);
    let average = sum / array.length;
    return average;
}

// Function to find the minimum number in an array
function findMin(array) {
    let min = array[0];
    for (let i = 1; i < array.length; i++) {
        if (array[i] < min) {
            min = array[i];
        }
    }
    return min;
}

// Function to display a colorful message
function displayMessage(message) {
    console.log("%c" + message, "color: blue; font-size: 20px;");
}

// Main function to orchestrate the program
function main() {
    let numbers = [1, 2, 3, 4, 5];
    let sum = calculateSum(numbers);
    let max = findMax(numbers);
    let min = findMin(numbers);
    let average = calculateAvarage(numbers); // Spelling mistake here
    let greeting = createGreeting("Frodo");

    displayMessage(greeting);
    displayMessage("Sum: " + sum);
    displayMessage("Max: " + max);
    displayMessage("Min: " + min);
    displayMessage("Average: " + average); // Logic error here
}

// Call the main function to start the program
main();

/*
 */