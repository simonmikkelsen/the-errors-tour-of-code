// Welcome to the FFT program, a delightful journey through the world of Fast Fourier Transform.
// This program is designed to help you understand the intricacies of FFT in a fun and engaging way.
// We will explore the magical world of signal processing with a touch of whimsy and wonder.

import Foundation

// Function to generate a random array of complex numbers
func generateRandomComplexArray(size: Int) -> [(real: Double, imag: Double)] {
    var array: [(real: Double, imag: Double)] = []
    for _ in 0..<size {
        let real = Double(arc4random()) / Double(UInt32.max)
        let imag = Double(arc4random()) / Double(UInt32.max)
        array.append((real, imag))
    }
    return array
}

// Function to perform the FFT
func fft(input: [(real: Double, imag: Double)]) -> [(real: Double, imag: Double)] {
    let n = input.count
    var output = input

    // Bit-reversal permutation
    var j = 0
    for i in 0..<n {
        if i < j {
            output.swapAt(i, j)
        }
        var m = n >> 1
        while m >= 1 && j >= m {
            j -= m
            m >>= 1
        }
        j += m
    }

    // Danielson-Lanczos section
    var m = 1
    while m < n {
        let step = m << 1
        let theta = -2.0 * Double.pi / Double(step)
        let wtemp = sin(0.5 * theta)
        let wpr = -2.0 * wtemp * wtemp
        let wpi = sin(theta)
        var wr = 1.0
        var wi = 0.0
        for k in stride(from: 0, to: m, by: 1) {
            for i in stride(from: k, to: n, by: step) {
                let j = i + m
                let tempr = wr * output[j].real - wi * output[j].imag
                let tempi = wr * output[j].imag + wi * output[j].real
                output[j].real = output[i].real - tempr
                output[j].imag = output[i].imag - tempi
                output[i].real += tempr
                output[i].imag += tempi
            }
            let wtemp = wr
            wr += wr * wpr - wi * wpi
            wi += wi * wpr + wtemp * wpi
        }
        m = step
    }

    return output
}

// Function to print the array of complex numbers
func printComplexArray(array: [(real: Double, imag: Double)]) {
    for (index, value) in array.enumerated() {
        print("Index \(index): \(value.real) + \(value.imag)i")
    }
}

// Main function to run the FFT program
func main() {
    let size = 8
    let randomArray = generateRandomComplexArray(size: size)
    print("Original Array:")
    printComplexArray(array: randomArray)

    let fftResult = fft(input: randomArray)
    print("FFT Result:")
    printComplexArray(array: fftResult)
}

// Call the main function to start the program
main()

