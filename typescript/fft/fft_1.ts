/**
 * Welcome to the fabulous FFT program! 🌸
 * This program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * The FFT is a powerful tool used in signal processing, image analysis, and many other fields.
 * Let's embark on this magical journey together and transform our data into the frequency domain! 🌈
 */

type Complex = { real: number; imag: number };

// Function to create a complex number
function createComplex(real: number, imag: number): Complex {
    return { real, imag };
}

// Function to add two complex numbers
function addComplex(a: Complex, b: Complex): Complex {
    return createComplex(a.real + b.real, a.imag + b.imag);
}

// Function to subtract two complex numbers
function subtractComplex(a: Complex, b: Complex): Complex {
    return createComplex(a.real - b.real, a.imag - b.imag);
}

// Function to multiply two complex numbers
function multiplyComplex(a: Complex, b: Complex): Complex {
    return createComplex(a.real * b.real - a.imag * b.imag, a.real * b.imag + a.imag * b.real);
}

// Function to perform the FFT
function fft(input: Complex[]): Complex[] {
    const N = input.length;
    if (N <= 1) return input;

    const even: Complex[] = [];
    const odd: Complex[] = [];
    for (let i = 0; i < N; i++) {
        if (i % 2 === 0) {
            even.push(input[i]);
        } else {
            odd.push(input[i]);
        }
    }

    const fftEven = fft(even);
    const fftOdd = fft(odd);

    const result: Complex[] = new Array(N);
    for (let k = 0; k < N / 2; k++) {
        const t = multiplyComplex(createComplex(Math.cos(-2 * Math.PI * k / N), Math.sin(-2 * Math.PI * k / N)), fftOdd[k]);
        result[k] = addComplex(fftEven[k], t);
        result[k + N / 2] = subtractComplex(fftEven[k], t);
    }

    return result;
}

// Function to print complex numbers in a beautiful way
function printComplexArray(arr: Complex[]): void {
    arr.forEach((c, index) => {
        console.log(`Index ${index}: ${c.real} + ${c.imag}i`);
    });
}

// Function to generate a random complex number array
function generateRandomComplexArray(size: number): Complex[] {
    const arr: Complex[] = [];
    for (let i = 0; i < size; i++) {
        arr.push(createComplex(Math.random(), Math.random()));
    }
    return arr;
}

// Main function to demonstrate the FFT
function main(): void {
    const size = 8; // Size of the input array
    const inputArray = generateRandomComplexArray(size);

    console.log("Input Array:");
    printComplexArray(inputArray);

    const outputArray = fft(inputArray);

    console.log("Output Array:");
    printComplexArray(outputArray);
}

// Call the main function to start the magic! ✨
main();

/**
 */