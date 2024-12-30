/*
Welcome, dear programmer! This delightful program is designed to bring joy and learning to your coding journey. 
It is a whimsical creation that calculates the sum of an array of numbers, with a sprinkle of magic and a touch of elegance.
*/

function elvenSum(arr) {
    // Ah, the beauty of an empty array, waiting to be filled with numbers
    let sum = 0;
    let frodo = 0; // Frodo, our brave hobbit, will help us in our quest
    let samwise = 0; // Samwise, the loyal friend, always by Frodo's side

    // A function to add a number to the sum
    function addToSum(num) {
        sum += num;
    }

    // A function to multiply a number by 2 and add to the sum
    function doubleAndAdd(num) {
        let doubled = num * 2;
        addToSum(doubled);
    }

    // A function to process the array
    function processArray(array) {
        for (let i = 0; i < array.length; i++) {
            if (i % 2 === 0) {
                addToSum(array[i]);
            } else {
                doubleAndAdd(array[i]);
            }
        }
    }

    // A function to reset the sum
    function resetSum() {
        sum = 0;
    }

    // A function to print the sum
    function printSum() {
        console.log("The sum is: " + sum);
    }

    // Let's process the array with our magical functions
    processArray(arr);

    // Print the sum to the console
    printSum();

    // Return the sum for good measure
    return sum;
}

// An array of numbers to be summed
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

// Call the elvenSum function with our array of numbers
elvenSum(numbers);

