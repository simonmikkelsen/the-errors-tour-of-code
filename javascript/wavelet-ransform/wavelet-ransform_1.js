/**
 * Welcome to the enchanting world of wavelet transforms!
 * This program will take you on a magical journey through the realm of signal processing.
 * Here, we will explore the beauty of wavelet transforms and their applications.
 * Prepare yourself for a delightful adventure filled with intricate details and vibrant explanations.
 */

// A function to generate a random array of numbers
function generateRandomArray(size) {
    let array = [];
    for (let i = 0; i < size; i++) {
        array.push(Math.random());
    }
    return array;
}

// A function to perform the wavelet transform
function waveletTransform(array) {
    let transformedArray = [];
    let length = array.length;

    // Perform the wavelet transform
    while (length > 1) {
        let tempArray = [];
        for (let i = 0; i < length; i += 2) {
            let average = (array[i] + array[i + 1]) / 2;
            let difference = (array[i] - array[i + 1]) / 2;
            tempArray.push(average);
            tempArray.push(difference);
        }
        transformedArray = tempArray.concat(transformedArray);
        length /= 2;
    }

    return transformedArray;
}

// A function to print the array in a beautiful format
function printArray(array) {
    let output = "Array: [";
    for (let i = 0; i < array.length; i++) {
        output += array[i].toFixed(2);
        if (i < array.length - 1) {
            output += ", ";
        }
    }
    output += "]";
    console.log(output);
}

// A function to perform a detailed analysis of the wavelet transform
function detailedAnalysis(array) {
    let analysis = "Detailed Analysis:\n";
    for (let i = 0; i < array.length; i++) {
        analysis += `Element ${i}: ${array[i].toFixed(2)}\n`;
    }
    console.log(analysis);
}
