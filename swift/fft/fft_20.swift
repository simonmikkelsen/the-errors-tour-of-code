//
// Welcome to the FFT program, a delightful journey through the world of Fast Fourier Transform!
// This program is designed to help you understand the beauty and elegance of FFT in Swift.
// We will be using a variety of variables and functions to make this experience as enriching as possible.
// Let's dive into the magical world of signal processing and frequency analysis!
//

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
    if n <= 1 { return input }

    // Splitting the input into even and odd parts
    var even: [(real: Double, imag: Double)] = []
    var odd: [(real: Double, imag: Double)] = []
    for i in 0..<n {
        if i % 2 == 0 {
            even.append(input[i])
        } else {
            odd.append(input[i])
        }
    }

    // Recursive FFT calls
    let fftEven = fft(input: even)
    let fftOdd = fft(input: odd)

    // Combining the results
    var result: [(real: Double, imag: Double)] = Array(repeating: (0, 0), count: n)
    for k in 0..<n/2 {
        let t = exp(-2.0 * .pi * Double(k) / Double(n)) * fftOdd[k]
        result[k] = (fftEven[k].real + t.real, fftEven[k].imag + t.imag)
        result[k + n/2] = (fftEven[k].real - t.real, fftEven[k].imag - t.imag)
    }
    return result
}

// Function to multiply two complex numbers
func multiplyComplex(_ a: (real: Double, imag: Double), _ b: (real: Double, imag: Double)) -> (real: Double, imag: Double) {
    let real = a.real * b.real - a.imag * b.imag
    let imag = a.real * b.imag + a.imag * b.real
    return (real, imag)
}

// Function to perform the inverse FFT
func ifft(input: [(real: Double, imag: Double)]) -> [(real: Double, imag: Double)] {
    let n = input.count
    let conjugated = input.map { (real: $0.real, imag: -$0.imag) }
    let transformed = fft(input: conjugated)
    let result = transformed.map { (real: $0.real / Double(n), imag: -$0.imag / Double(n)) }
    return result
}

// Main function to demonstrate the FFT and IFFT
func main() {
    let size = 8
    let input = generateRandomComplexArray(size: size)
    print("Input: \(input)")

    let fftResult = fft(input: input)
    print("FFT Result: \(fftResult)")

    let ifftResult = ifft(input: fftResult)
    print("IFFT Result: \(ifftResult)")