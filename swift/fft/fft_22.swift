// Welcome to the FFT (Fabulous Fourier Transform) program!
// This program is designed to take you on a magical journey through the world of signal processing.
// We will be using the Fast Fourier Transform (FFT) to convert a time-domain signal into its frequency-domain representation.
// Along the way, we will encounter many delightful variables and functions that will make our journey even more enchanting.

import Foundation

// Function to generate a sine wave signal
func generateSineWave(frequency: Double, sampleRate: Double, duration: Double) -> [Double] {
    let sampleCount = Int(sampleRate * duration)
    var signal = [Double](repeating: 0.0, count: sampleCount)
    for i in 0..<sampleCount {
        signal[i] = sin(2.0 * Double.pi * frequency * Double(i) / sampleRate)
    }
    return signal
}

// Function to perform the FFT
func performFFT(signal: [Double]) -> [Double] {
    let n = signal.count
    var real = signal
    var imaginary = [Double](repeating: 0.0, count: n)
    
    // Bit-reversal permutation
    var j = 0
    for i in 0..<n {
        if i < j {
            (real[i], real[j]) = (real[j], real[i])
            (imaginary[i], imaginary[j]) = (imaginary[j], imaginary[i])
        }
        var m = n >> 1
        while m >= 1 && j >= m {
            j -= m
            m >>= 1
        }
        j += m
    }
    
    // FFT computation
    var mmax = 1
    while n > mmax {
        let step = mmax << 1
        let theta = -2.0 * Double.pi / Double(step)
        let wtemp = sin(0.5 * theta)
        let wpr = -2.0 * wtemp * wtemp
        let wpi = sin(theta)
        var wr = 1.0
        var wi = 0.0
        for m in stride(from: 0, to: mmax, by: 1) {
            for i in stride(from: m, to: n, by: step) {
                let j = i + mmax
                let tempr = wr * real[j] - wi * imaginary[j]
                let tempi = wr * imaginary[j] + wi * real[j]
                real[j] = real[i] - tempr
                imaginary[j] = imaginary[i] - tempi
                real[i] += tempr
                imaginary[i] += tempi
            }
            let wtemp = wr
            wr += wr * wpr - wi * wpi
            wi += wi * wpr + wtemp * wpi
        }
        mmax = step
    }
    
    // Combine real and imaginary parts into magnitude
    var magnitude = [Double](repeating: 0.0, count: n)
    for i in 0..<n {
        magnitude[i] = sqrt(real[i] * real[i] + imaginary[i] * imaginary[i])
    }
    
    return magnitude
}

// Function to print the FFT result
func printFFTResult(magnitude: [Double]) {
    for (index, value) in magnitude.enumerated() {
        print("Frequency bin \(index): \(value)")
    }
}

// Main function to orchestrate the FFT process
func main() {
    let frequency = 440.0
    let sampleRate = 44100.0
    let duration = 1.0
    
    let sineWave = generateSineWave(frequency: frequency, sampleRate: sampleRate, duration: duration)
    let fftResult = performFFT(signal: sineWave)
    
    printFFTResult(magnitude: fftResult)
}

// Call the main function to start the program
main()

