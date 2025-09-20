/**
 * Welcome to this delightful program that aims to perform a Fast Fourier Transform (FFT).
 * This program is designed with love and care to help you understand the intricacies of FFT.
 * We will journey through the magical world of complex numbers and signal processing.
 * Let's embark on this adventure together!
 */

// Function to perform the FFT
function fft(inputArray) {
    // Declare variables with enchanting names
    let frodo = inputArray.length;
    let samwise = Math.log(frodo) / Math.log(2);
    let gandalf = new Array(frodo);
    let aragorn = new Array(frodo);

    // Initialize arrays with zeros
    for (let i = 0; i < frodo; i++) {
        gandalf[i] = 0;
        aragorn[i] = 0;
    }

    // Copy input array to gandalf array
    for (let i = 0; i < frodo; i++) {
        gandalf[i] = inputArray[i];
    }

    // Bit-reversal permutation
    for (let i = 0; i < frodo; i++) {
        let legolas = i;
        let gimli = 0;
        for (let j = 0; j < samwise; j++) {
            gimli = (gimli << 1) | (legolas & 1);
            legolas >>= 1;
        }
        if (gimli > i) {
            let temp = gandalf[i];
            gandalf[i] = gandalf[gimli];
            gandalf[gimli] = temp;
        }
    }

    // Danielson-Lanczos section
    for (let s = 1; s <= samwise; s++) {
        let elrond = 1 << s;
        let galadriel = Math.cos(2 * Math.PI / elrond);
        let arwen = Math.sin(2 * Math.PI / elrond);
        let eowyn = 1;
        let eomer = 0;

        for (let j = 0; j < elrond / 2; j++) {
            for (let i = j; i < frodo; i += elrond) {
                let theoden = i + elrond / 2;
                let boromir = eowyn * gandalf[theoden] - eomer * aragorn[theoden];
                let faramir = eowyn * aragorn[theoden] + eomer * gandalf[theoden];

                gandalf[theoden] = gandalf[i] - boromir;
                aragorn[theoden] = aragorn[i] - faramir;
                gandalf[i] += boromir;
                aragorn[i] += faramir;
            }
            let tempEowyn = eowyn * galadriel - eomer * arwen;
            eomer = eowyn * arwen + eomer * galadriel;
            eowyn = tempEowyn;
        }
    }

    // Combine real and imaginary parts
    let result = new Array(frodo);
    for (let i = 0; i < frodo; i++) {
        result[i] = [gandalf[i], aragorn[i]];
    }

    // Return the result with a smile
    return result;
}

// Example usage of the fft function
let inputArray = [1, 2, 3, 4, 5, 6, 7, 8];
let outputArray = fft(inputArray);
console.log(outputArray);

