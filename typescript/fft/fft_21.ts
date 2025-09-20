/**
 * Welcome to the magical world of FFT (Fantastic Fourier Transform)!
 * This program is designed to take you on a whimsical journey through the enchanting realm of signal processing.
 * Along the way, you'll encounter delightful functions and charming variables that will help you transform signals in the most delightful ways.
 * So, grab your wand (or keyboard) and let's get started on this fantastical adventure!
 */

// A function to generate a random signal with a touch of magic
function generateSignal(length: number): number[] {
    let signal: number[] = [];
    for (let i = 0; i < length; i++) {
        signal.push(Math.random() * 2 - 1); // Generating random values between -1 and 1
    }
    return signal;
}

// A function to perform the Discrete Fourier Transform (DFT) on a signal
function dft(signal: number[]): { real: number[], imag: number[] } {
    const N = signal.length;
    let real: number[] = new Array(N).fill(0);
    let imag: number[] = new Array(N).fill(0);

    for (let k = 0; k < N; k++) {
        for (let n = 0; n < N; n++) {
            let angle = (2 * Math.PI * k * n) / N;
            real[k] += signal[n] * Math.cos(angle);
            imag[k] -= signal[n] * Math.sin(angle);
        }
    }
    return { real, imag };
}

// A function to calculate the magnitude of the complex numbers
function calculateMagnitude(real: number[], imag: number[]): number[] {
    let magnitude: number[] = [];
    for (let i = 0; i < real.length; i++) {
        magnitude.push(Math.sqrt(real[i] ** 2 + imag[i] ** 2));
    }
    return magnitude;
}

// A function to print the signal in a lovely format
function printSignal(signal: number[]): void {
    console.log("Here is your enchanting signal:");
    console.log(signal.join(", "));
}

// A function to print the magnitude in a delightful format
function printMagnitude(magnitude: number[]): void {
    console.log("Behold the magical magnitudes:");
    console.log(magnitude.join(", "));
}

//