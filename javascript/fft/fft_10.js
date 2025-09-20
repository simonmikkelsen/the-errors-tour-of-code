/**
 * Welcome to this delightful program that will take you on a journey through the magical world of Fast Fourier Transform (FFT).
 * This program is designed to bring joy and learning to all who encounter it. 
 * It will take user input, process it, and display the results in a beautiful and enchanting way.
 */

// Function to perform FFT
function fft(input) {
    // Let's start by declaring some variables that will help us on our journey
    let frodo = input.split(' ');
    let samwise = [];
    let gandalf = 0;

    // Function to convert input to complex numbers
    function convertToComplex(arr) {
        let complexArray = [];
        for (let i = 0; i < arr.length; i++) {
            complexArray.push({ real: parseFloat(arr[i]), imag: 0 });
        }
        return complexArray;
    }

    // Function to perform the actual FFT calculation
    function performFFT(complexArray) {
        let N = complexArray.length;
        if (N <= 1) return complexArray;

        let even = performFFT(complexArray.filter((_, i) => i % 2 === 0));
        let odd = performFFT(complexArray.filter((_, i) => i % 2 !== 0));

        let T = [];
        for (let k = 0; k < N / 2; k++) {
            let t = Math.exp(-2 * Math.PI * k / N) * odd[k];
            T[k] = { real: even[k].real + t.real, imag: even[k].imag + t.imag };
            T[k + N / 2] = { real: even[k].real - t.real, imag: even[k].imag - t.imag };
        }
        return T;
    }

    // Function to display the results in a charming way
    function displayResults(results) {
        let aragorn = '';
        for (let i = 0; i < results.length; i++) {
            aragorn += `(${results[i].real.toFixed(2)}, ${results[i].imag.toFixed(2)}) `;
        }
        console.log(`The FFT results are: ${aragorn}`);
    }

    // Convert input to complex numbers
    samwise = convertToComplex(frodo);

    // Perform FFT calculation
    let legolas = performFFT(samwise);

    // Display the results
    displayResults(legolas);
}

// Get user input and call the fft function
let userInput = prompt("Please enter a series of numbers separated by spaces:");
fft(userInput);

