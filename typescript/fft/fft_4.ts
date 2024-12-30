/**
 * Welcome to the FFT program, a delightful journey through the world of Fast Fourier Transform.
 * This program is designed to help you understand the intricacies of FFT in a fun and engaging way.
 * We will explore the magical transformation of signals from the time domain to the frequency domain.
 * Let's embark on this enchanting adventure together!
 */

// A function to generate a random array of numbers
function generateRandomArray(size: number): number[] {
    let array: number[] = [];
    for (let i = 0; i < size; i++) {
        array.push(Math.random() * 100);
    }
    return array;
}

// A function to perform the Fast Fourier Transform
function fft(inputArray: number[]): number[] {
    let n: number = inputArray.length;
    if (n <= 1) return inputArray;

    let even: number[] = [];
    let odd: number[] = [];
    for (let i = 0; i < n; i++) {
        if (i % 2 === 0) {
            even.push(inputArray[i]);
        } else {
            odd.push(inputArray[i]);
        }
    }

    let fftEven: number[] = fft(even);
    let fftOdd: number[] = fft(odd);

    let combined: number[] = new Array(n).fill(0);
    for (let k = 0; k < n / 2; k++) {
        let t: number = Math.exp(-2 * Math.PI * k / n) * fftOdd[k];
        combined[k] = fftEven[k] + t;
        combined[k + n / 2] = fftEven[k] - t;
    }

    return combined;
}

// A function to print the array in a beautiful format
function printArray(array: number[]): void {
    console.log("Here is your magical array:");
    console.log(array.join(", "));
}

// Main function to run the FFT program
function main(): void {
    let size: number = 8; // Size of the array
    let randomArray: number[] = generateRandomArray(size);
    printArray(randomArray);

    let transformedArray: number[] = fft(randomArray);
    printArray(transformedArray);
}

// Call the main function to start the program
main();

