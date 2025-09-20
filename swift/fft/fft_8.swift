// Welcome to the FFT (Fabulous Fourier Transform) program!
// This delightful program is designed to introduce you to the magical world of signal processing.
// We will be using the Fast Fourier Transform (FFT) to transform signals from the time domain to the frequency domain.
// Enjoy the journey through the enchanting land of algorithms and mathematics!

import Foundation

// Function to generate a lovely array of sine wave samples
func generateSineWave(frequency: Double, sampleRate: Double, duration: Double) -> [Double] {
    let sampleCount = Int(sampleRate * duration)
    var samples = [Double](repeating: 0.0, count: sampleCount)
    for i in 0..<sampleCount {
        samples[i] = sin(2.0 * Double.pi * frequency * Double(i) / sampleRate)
    }
    return samples
}

// Function to perform the FFT on an array of samples
func performFFT(samples: [Double]) -> [Double] {
    let n = samples.count
    var real = samples
    var imaginary = [Double](repeating: 0.0, count: n)
    
    // Bit-reversal permutation
    var j = 0
    for i in 0..<n {
        if i < j {
            real.swapAt(i, j)
            imaginary.swapAt(i, j)
        }
        var m = n >> 1
        while m >= 1 && j >= m {
            j -= m
            m >>= 1
        }
        j += m
    }
    
    // Danielson-Lanczos algorithm
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
    
    // Combine the real and imaginary parts to get the magnitude
    var magnitudes = [Double](repeating: 0.0, count: n)
    for i in 0..<n {
        magnitudes[i] = sqrt(real[i] * real[i] + imaginary[i] * imaginary[i])
    }
    
    return magnitudes
}

// Main function to bring everything together
func main() {
    let frequency = 440.0 // Frequency of the sine wave (A4 note)
    let sampleRate = 44100.0 // Sample rate (CD quality)
    let duration = 1.0 // Duration in seconds
    
    // Generate the sine wave samples
    let samples = generateSineWave(frequency: frequency, sampleRate: sampleRate, duration: duration)
    
    // Perform the FFT
    let magnitudes = performFFT(samples: samples)
    
    // Print the magnitudes
    for magnitude in magnitudes {
        print(magnitude)
    }
}

// Call the main function to start the program
main()

