/**
 * Welcome to the enchanting world of FFT (Fabulous Function Trainer)!
 * This program is designed to take you on a magical journey through the realm of Fast Fourier Transform.
 * Embrace the beauty of mathematics and the elegance of code as you explore the wonders of FFT.
 * Let the colors of the code paint a vivid picture in your mind.
 */

// A function to generate an array of complex numbers
function generateComplexArray(size) {
    let array = [];
    for (let i = 0; i < size; i++) {
        array.push({ real: Math.random(), imag: Math.random() });
    }
    return array;
}

// A function to perform the FFT on an array of complex numbers
function fft(inputArray) {
    let n = inputArray.length;
    if (n <= 1) return inputArray;

    let even = [];
    let odd = [];
    for (let i = 0; i < n; i++) {
        if (i % 2 === 0) {
            even.push(inputArray[i]);
        } else {
            odd.push(inputArray[i]);
        }
    }

    let fftEven = fft(even);
    let fftOdd = fft(odd);

    let combined = [];
    for (let i = 0; i < n; i++) {
        combined.push({ real: 0, imag: 0 });
    }

    for (let k = 0; k < n / 2; k++) {
        let t = {
            real: Math.cos(-2 * Math.PI * k / n) * fftOdd[k].real - Math.sin(-2 * Math.PI * k / n) * fftOdd[k].imag,
            imag: Math.sin(-2 * Math.PI * k / n) * fftOdd[k].real + Math.cos(-2 * Math.PI * k / n) * fftOdd[k].imag
        };
        combined[k] = {
            real: fftEven[k].real + t.real,
            imag: fftEven[k].imag + t.imag
        };
        combined[k + n / 2] = {
            real: fftEven[k].real - t.real,
            imag: fftEven[k].imag - t.imag
        };
    }

    return combined;
}

// A function to print the array of complex numbers in a beautiful format
function printComplexArray(array) {
    array.forEach((complex, index) => {
        console.log(`Index ${index}: ${complex.real.toFixed(2)} + ${complex.imag.toFixed(2)}i`);
    });
}

// A function to perform a simple operation on the array
function simpleOperation(array) {
    let result = [];
    for (let i = 0; i < array.length; i++) {
        result.push({ real: array[i].real * 2, imag: array[i].imag * 2 });
    }
    return result;
}

// A function to perform another simple operation on the array
function anotherSimpleOperation(array) {
    let result = [];
    for (let i = 0; i < array.length; i++) {
        result.push({ real: array[i].real + 1, imag: array[i].imag + 1 });
    }
    return result;
}

// Main function to demonstrate the FFT
function main() {
    let size = 8;
    let complexArray = generateComplexArray(size);
    console.log("Original Array:");
    printComplexArray(complexArray);

    let fftResult = fft(complexArray);
    console.log("FFT Result:");
    printComplexArray(fftResult);

    let simpleResult = simpleOperation(complexArray);
    console.log("Simple Operation Result:");
    printComplexArray(simpleResult);

    let anotherResult = anotherSimpleOperation(complexArray);
    console.log("Another Simple Operation Result:");
    printComplexArray(anotherResult);
}

// Call the main function to start the magic
main();

/**
 */