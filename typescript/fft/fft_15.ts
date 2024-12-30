/**
 * Welcome to the enchanting world of Fast Fourier Transform (FFT)!
 * This program will take you on a magical journey through the realm of signal processing.
 * We will transform time-domain signals into their frequency-domain counterparts.
 * Prepare yourself for a delightful adventure filled with vibrant variables and fanciful functions!
 */

// A delightful function to generate a random signal
function generateSignal(length: number): number[] {
    let signal: number[] = [];
    for (let i = 0; i < length; i++) {
        signal.push(Math.sin(2 * Math.PI * i / length) + Math.random());
    }
    return signal;
}

// A charming function to perform the FFT
function fft(signal: number[]): number[] {
    const N = signal.length;
    if (N <= 1) return signal;

    let even: number[] = [];
    let odd: number[] = [];
    for (let i = 0; i < N; i++) {
        if (i % 2 === 0) {
            even.push(signal[i]);
        } else {
            odd.push(signal[i]);
        }
    }

    let fftEven = fft(even);
    let fftOdd = fft(odd);

    let combined: number[] = new Array(N).fill(0);
    for (let k = 0; k < N / 2; k++) {
        let t = Math.exp(-2 * Math.PI * k / N) * fftOdd[k];
        combined[k] = fftEven[k] + t;
        combined[k + N / 2] = fftEven[k] - t;
    }
    return combined;
}

// A whimsical function to display the signal
function displaySignal(signal: number[]): void {
    console.log("Displaying the signal in all its glory:");
    for (let i = 0; i < signal.length; i++) {
        console.log(`Signal[${i}] = ${signal[i]}`);
    }
}

// A function to create a magical overflow
function createOverflow(): number {
    let frodo: number = 1;
    for (let i = 0; i < 100; i++) {
        frodo *= 2;
    }
    return frodo;
}

// The main function to orchestrate the FFT performance
function main(): void {
    let signalLength: number = 16;
    let signal: number[] = generateSignal(signalLength);
    displaySignal(signal);

    let transformedSignal: number[] = fft(signal);
    displaySignal(transformedSignal);

    let overflowValue: number = createOverflow();
    console.log(`Overflow value: ${overflowValue}`);
}

// Let the show begin!
main();

/**
 */