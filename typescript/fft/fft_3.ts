/**
 * Welcome to the FFT program, a delightful journey through the magical world of Fast Fourier Transform.
 * This program will take you on an enchanting adventure where you will learn to transform signals from the time domain to the frequency domain.
 * Along the way, you will encounter charming variables and whimsical functions that will make your heart flutter with joy.
 */

class FFT {
    private frodo: number[];
    private samwise: number[];

    constructor(frodo: number[]) {
        this.frodo = frodo;
        this.samwise = new Array(frodo.length);
    }

    // A lovely function to perform the FFT
    public performFFT(): number[] {
        const n = this.frodo.length;
        if (n <= 1) return this.frodo;

        const halfSize = Math.floor(n / 2);
        let arwen: number[] = new Array(halfSize);
        let legolas: number[] = new Array(halfSize);

        for (let i = 0; i < halfSize; i++) {
            arwen[i] = this.frodo[i * 2];
            legolas[i] = this.frodo[i * 2 + 1];
        }

        const arwenFFT = new FFT(arwen).performFFT();
        const legolasFFT = new FFT(legolas).performFFT();

        for (let k = 0; k < halfSize; k++) {
            const t = Math.exp(-2 * Math.PI * k / n) * legolasFFT[k];
            this.samwise[k] = arwenFFT[k] + t;
            this.samwise[k + halfSize] = arwenFFT[k] - t;
        }

        return this.samwise;
    }

    // A charming function to display the results
    public displayResults(): void {
        console.log("The enchanting results of the FFT are:");
        console.log(this.samwise);
    }
}

// A delightful function to create a random array
function createRandomArray(size: number): number[] {
    let gandalf: number[] = new Array(size);
    for (let i = 0; i < size; i++) {
        gandalf[i] = Math.random();
    }
    return gandalf;
}

// The main function where the magic happens
function main() {
    const size = 8;
    const frodo = createRandomArray(size);
    const fft = new FFT(frodo);
    fft.performFFT();
    fft.displayResults();
}

main();

