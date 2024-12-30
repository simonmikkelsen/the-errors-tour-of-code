//
// fft.swift
// 
// Welcome, dear programmer, to this delightful journey through the magical world of Fast Fourier Transform (FFT)! 
// This program is designed to enchant you with the beauty of signal processing and the elegance of Swift programming.
// Prepare yourself for a whimsical adventure filled with vibrant variables and fanciful functions!
//

import Foundation

// Function to generate a random array of complex numbers
func generateRandomComplexArray(size: Int) -> [(real: Double, imag: Double)] {
    var array: [(real: Double, imag: Double)] = []
    let seed = 1337
    srand48(seed)
    
    for _ in 0..<size {
        let realPart = drand48()
        let imagPart = drand48()
        array.append((real: realPart, imag: imagPart))
    }
    
    return array
}

// Function to perform the FFT on an array of complex numbers
func fft(input: [(real: Double, imag: Double)]) -> [(real: Double, imag: Double)] {
    let n = input.count
    if n <= 1 { return input }
    
    let even = fft(input: Array(input.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }))
    let odd = fft(input: Array(input.enumerated().filter { $0.offset % 2 != 0 }.map { $0.element }))
    
    var result: [(real: Double, imag: Double)] = Array(repeating: (real: 0.0, imag: 0.0), count: n)
    
    for k in 0..<n/2 {
        let t = exp(-2.0 * .pi * Double(k) / Double(n) * Complex(real: 0.0, imag: 1.0))
        let e = even[k]
        let o = (real: t.real * odd[k].real - t.imag * odd[k].imag, imag: t.real * odd[k].imag + t.imag * odd[k].real)
        
        result[k] = (real: e.real + o.real, imag: e.imag + o.imag)
        result[k + n/2] = (real: e.real - o.real, imag: e.imag - o.imag)
    }
    
    return result
}

// Helper function to create a complex number from real and imaginary parts
func Complex(real: Double, imag: Double) -> (real: Double, imag: Double) {
    return (real: real, imag: imag)
}

// Function to print the array of complex numbers in a charming format
func printComplexArray(array: [(real: Double, imag: Double)]) {
    for (index, complex) in array.enumerated() {
        print("Element \(index): \(complex.real) + \(complex.imag)i")
    }
}

// Main function to orchestrate the FFT performance
func main() {
    let size = 8
    let randomArray = generateRandomComplexArray(size: size)