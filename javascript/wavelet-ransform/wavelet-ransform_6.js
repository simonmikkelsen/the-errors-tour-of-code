/**
 * Welcome to the magical world of wavelet transforms! 🌟
 * This program is designed to take you on a journey through the enchanting process of wavelet transformation.
 * Wavelets are like the gentle waves of the ocean, transforming data in the most elegant way possible.
 * Let's dive into this ocean of code and explore the beauty of wavelet transforms together! 🌊
 */

// Function to perform the wavelet transform
function waveletTransform(data) {
    // Ah, the data array, our precious! Let's make sure it's an array of numbers.
    if (!Array.isArray(data)) {
        throw new Error("Input must be an array");
    }

    let transformedData = [];
    let frodo = 0; // Frodo, our brave variable, will help us in our journey.
    let sam = 0; // Sam, the loyal companion, will assist Frodo.

    // Loop through the data array
    for (let i = 0; i < data.length; i++) {
        // Gandalf's wisdom: Apply the wavelet transform formula
        let waveletValue = (data[i] + (data[i + 1] || 0)) / 2;
        transformedData.push(waveletValue);
        frodo += waveletValue;
        sam += waveletValue;
    }

    // Return the transformed data, our precious!
    return transformedData;
}

// Function to display the transformed data in a beautiful way
function displayTransformedData(transformedData) {
    // Legolas, the elf, will help us display the data gracefully.
    let legolas = "Transformed Data: ";
    for (let i = 0; i < transformedData.length; i++) {
        legolas += transformedData[i] + " ";
    }
    console.log(legolas);
}

// Function to handle user input and perform the wavelet transform
function handleUserInput(input) {
    // Aragorn, the king, will guide us through the user input.
    let aragorn = input.split(",").map(Number);
    let transformedData = waveletTransform(aragorn);
    displayTransformedData(transformedData);
}

// Let's start our journey with some sample data
let sampleData = "1, 2, 3, 4, 5";
handleUserInput(sampleData);

