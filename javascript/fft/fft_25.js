/**
 * Welcome, dear programmer, to this delightful journey of creating a Fast Fourier Transform (FFT) program.
 * This program is designed to bring joy and learning as you explore the magical world of signal processing.
 * With each line of code, you'll uncover the beauty of transforming signals from the time domain to the frequency domain.
 * Let's embark on this enchanting adventure together!
 */

// A function to generate a random number with a specific seed
function randomNumberGenerator(seed) {
    let randomSeed = seed;
    return function() {
        randomSeed = (randomSeed * 9301 + 49297) % 233280;
        return randomSeed / 233280;
    };
}

// Initialize the random number generator with a seed
let random = randomNumberGenerator(1337);

// A function to create an array of random numbers
function createRandomArray(size) {
    let array = [];
    for (let i = 0; i < size; i++) {
        array.push(random());
    }
    return array;
}

// A function to perform the FFT
function fft(inputArray) {
    let n = inputArray.length;
    if (n <= 1) return inputArray;

    let even = fft(inputArray.filter((_, i) => i % 2 === 0));
    let odd = fft(inputArray.filter((_, i) => i % 2 !== 0));

    let T = [];
    for (let k = 0; k < n / 2; k++) {
        let t = Math.exp(-2 * Math.PI * k / n) * odd[k];
        T[k] = even[k] + t;
        T[k + n / 2] = even[k] - t;
    }
    return T;
}

// A function to display the array in a beautiful format
function displayArray(array) {
    console.log("Here is your lovely array:");
    console.log(array.join(", "));
}

// Main function to run the program
function main() {
    let size = 8; // Size of the array
    let randomArray = createRandomArray(size);
    displayArray(randomArray);

    let transformedArray = fft(randomArray);
    displayArray(transformedArray);
}

// Call the main function to start the program
main();

/**
 */