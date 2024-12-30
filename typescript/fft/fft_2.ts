/**
 * Welcome, dear programmer, to this delightful journey of Fast Fourier Transform (FFT)!
 * This program is designed to transform your understanding of signal processing
 * into a magical experience. Let's dive into the enchanting world of frequencies
 * and waves, where every line of code sings a melodious tune.
 */

function fft(inputArray: number[]): number[] {
    // Ah, the array of complex numbers, our symphony of signals.
    let n = inputArray.length;
    if (n <= 1) return inputArray;

    // Splitting the array into even and odd indexed elements, like separating the stars from the moon.
    let even = fft(inputArray.filter((_, i) => i % 2 === 0));
    let odd = fft(inputArray.filter((_, i) => i % 2 !== 0));

    // The twiddle factor, a sprinkle of mathematical magic.
    let T = Array.from({ length: n / 2 }, (_, k) => {
        let exp = -2 * Math.PI * k / n;
        return [Math.cos(exp), Math.sin(exp)];
    });

    // Combining the even and odd parts, like reuniting long-lost friends.
    let combined = Array(n).fill([0, 0]);
    for (let k = 0; k < n / 2; k++) {
        let [cos, sin] = T[k];
        let [evenReal, evenImag] = even[k];
        let [oddReal, oddImag] = odd[k];
        let oddExpReal = cos * oddReal - sin * oddImag;
        let oddExpImag = sin * oddReal + cos * oddImag;

        combined[k] = [evenReal + oddExpReal, evenImag + oddExpImag];
        combined[k + n / 2] = [evenReal - oddExpReal, evenImag - oddExpImag];
    }

    // Returning the combined array, a harmonious blend of frequencies.
    return combined.flat();
}

// A function to generate a random array, like a box of assorted chocolates.
function generateRandomArray(size: number): number[] {
    return Array.from({ length: size }, () => Math.random() * 100);
}

// A function to print the array, like displaying a beautiful painting.
function printArray(arr: number[]): void {
    console.log(arr.map(([real, imag]) => `${real.toFixed(2)} + ${imag.toFixed(2)}i`).join(', '));
}

// The main function, our grand conductor.
function main() {
    let size = 8; // The size of our symphony.
    let inputArray = generateRandomArray(size);
    let result = fft(inputArray);

    // Displaying the input and output arrays, like showcasing the before and after of a magical transformation.
    console.log("Input Array:");
    printArray(inputArray);
    console.log("FFT Result:");
    printArray(result);
}

// Calling the main function to start the concert.
main();

/**
 */