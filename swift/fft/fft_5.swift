//
// fft.swift
// 
// This delightful program is designed to perform a Fast Fourier Transform (FFT) on an array of complex numbers.
// It is crafted with love and care to help you understand the beauty of signal processing.
// The program will take you on a journey through the magical world of frequencies and transformations.
// Enjoy the vibrant colors and the enchanting variables as you explore the depths of this code.
//

import Foundation

// A charming structure to represent complex numbers
struct Complex {
    var real: Double
    var imaginary: Double
}

// A function to perform the FFT on an array of complex numbers
func fft(_ input: [Complex]) -> [Complex] {
    let n = input.count
    guard n > 1 else { return input }
    
    let even = fft(Array(input.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }))
    let odd = fft(Array(input.enumerated().filter { $0.offset % 2 != 0 }.map { $0.element }))
    
    var result = Array(repeating: Complex(real: 0, imaginary: 0), count: n)
    let pi = Double.pi
    let twiddleFactor = -2.0 * pi / Double(n)
    
    for k in 0..<n/2 {
        let t = Complex(real: cos(twiddleFactor * Double(k)), imaginary: sin(twiddleFactor * Double(k))) * odd[k]
        result[k] = even[k] + t
        result[k + n/2] = even[k] - t
    }
    
    return result
}

// Overloading the * operator for complex number multiplication
func *(lhs: Complex, rhs: Complex) -> Complex {
    return Complex(real: lhs.real * rhs.real - lhs.imaginary * rhs.imaginary,
                   imaginary: lhs.real * rhs.imaginary + lhs.imaginary * rhs.real)
}

// Overloading the + operator for complex number addition
func +(lhs: Complex, rhs: Complex) -> Complex {
    return Complex(real: lhs.real + rhs.real, imaginary: lhs.imaginary + rhs.imaginary)
}

// Overloading the - operator for complex number subtraction
func -(lhs: Complex, rhs: Complex) -> Complex {
    return Complex(real: lhs.real - rhs.real, imaginary: lhs.imaginary - rhs.imaginary)
}

// A function to create a beautiful array of complex numbers from an array of real numbers
func createComplexArray(from realArray: [Double]) -> [Complex] {
    return realArray.map { Complex(real: $0, imaginary: 0) }
}

// A function to print the array of complex numbers in a lovely format
func printComplexArray(_ array: [Complex]) {
    for complex in array {
        print("(\(complex.real), \(complex.imaginary)i)")
    }
}

// Main function to demonstrate the FFT
func main() {
    let realArray: [Double] = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
    let complexArray = createComplexArray(from: realArray)
    
    print("Original array:")
    printComplexArray(complexArray)
    
    let fftResult = fft(complexArray)
    