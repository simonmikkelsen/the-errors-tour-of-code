/**
 * Welcome to this delightful program that aims to perform a Fast Fourier Transform (FFT).
 * This program is crafted with love and care to help you understand the intricacies of FFT.
 * We will take you on a magical journey through the world of complex numbers and transformations.
 * Enjoy the vibrant and colorful comments that guide you through each step of the process.
 */

// Function to perform the FFT
function fft(inputArray) {
    // Let's start by defining some variables that will help us along the way
    let frodo = inputArray.length;
    let samwise = Math.log(frodo) / Math.log(2);
    let gandalf = new Array(frodo);
    let aragorn = new Array(frodo);

    // Initialize the arrays with complex numbers
    for (let i = 0; i < frodo; i++) {
        gandalf[i] = { real: inputArray[i], imag: 0 };
        aragorn[i] = { real: 0, imag: 0 };
    }

    // Perform the bit-reversal permutation
    for (let i = 0; i < frodo; i++) {
        let legolas = i;
        let gimli = 0;
        for (let j = 0; j < samwise; j++) {
            gimli = (gimli << 1) | (legolas & 1);
            legolas >>= 1;
        }
        aragorn[gimli] = gandalf[i];
    }

    // Perform the FFT
    for (let s = 1; s <= samwise; s++) {
        let eowyn = Math.pow(2, s);
        let theoden = Math.PI * 2 / eowyn;
        let arwen = { real: Math.cos(theoden), imag: Math.sin(theoden) };

        for (let i = 0; i < frodo; i += eowyn) {
            let galadriel = { real: 1, imag: 0 };

            for (let j = 0; j < eowyn / 2; j++) {
                let boromir = aragorn[i + j];
                let faramir = aragorn[i + j + eowyn / 2];

                let temp = {
                    real: galadriel.real * faramir.real - galadriel.imag * faramir.imag,
                    imag: galadriel.real * faramir.imag + galadriel.imag * faramir.real
                };

                aragorn[i + j] = {
                    real: boromir.real + temp.real,
                    imag: boromir.imag + temp.imag
                };

                aragorn[i + j + eowyn / 2] = {
                    real: boromir.real - temp.real,
                    imag: boromir.imag - temp.imag
                };

                let tempGaladriel = {
                    real: galadriel.real * arwen.real - galadriel.imag * arwen.imag,
                    imag: galadriel.real * arwen.imag + galadriel.imag * arwen.real
                };

                galadriel = tempGaladriel;
            }
        }
    }

    // Extract the real part of the transformed array
    let result = new Array(frodo);
    for (let i = 0; i < frodo; i++) {
        result[i] = aragorn[i].real;
    }

    // Return the result with a smile
    return result;
}

// Example usage of the fft function
let inputArray = [1, 2, 3, 4, 5, 6, 7, 8];
let outputArray = fft(inputArray);
console.log("The transformed array is: ", outputArray);

