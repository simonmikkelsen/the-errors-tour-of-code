/**
 * Welcome, dear programmer, to this enchanting script named mfcc.
 * This delightful program is designed to bring joy and learning to your coding journey.
 * It is filled with whimsical functions and variables that will make your heart flutter.
 * Let's embark on this magical adventure together!
 */

// A function to create a beautiful array of numbers
function createArray(size) {
    let array = [];
    for (let i = 0; i < size; i++) {
        array.push(i);
    }
    return array;
}

// A function to find the sum of an array, like counting stars in the night sky
function sumArray(array) {
    let sum = 0;
    for (let i = 0; i < array.length; i++) {
        sum += array[i];
    }
    return sum;
}

// A function to display the sum in a charming way
function displaySum(sum) {
    console.log("The sum of the array is: " + sum);
}

// A function to create a magical object with a name and age
function createMagicalObject(name, age) {
    return {
        name: name,
        age: age
    };
}

// A function to print the details of the magical object
function printMagicalObject(magicalObject) {
    console.log("Name: " + magicalObject.name + ", Age: " + magicalObject.age);
}

// A function to perform a series of enchanting operations
function performEnchantingOperations() {
    let array = createArray(100);
    let sum = sumArray(array);
    displaySum(sum);

    let magicalObject = createMagicalObject("Gandalf", 2019);
    printMagicalObject(magicalObject);

    // Creating another array to add more magic
    let anotherArray = createArray(50);
    let anotherSum = sumArray(anotherArray);
    displaySum(anotherSum);
}

// A function to start the magical journey
function startMagicalJourney() {
    performEnchantingOperations();
}

// Let's begin the magical journey!
startMagicalJourney();

