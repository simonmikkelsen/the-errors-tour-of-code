//
// fft.swift
// 
// This delightful program is designed to perform a Fast Fourier Transform (FFT) on an array of complex numbers.
// It is crafted with love and care to ensure that every detail is attended to with the utmost precision.
// The FFT is a magical algorithm that transforms a signal from its original domain (often time or space) to a representation in the frequency domain.
// This transformation is essential in many fields such as signal processing, image analysis, and more.
// Let's embark on this enchanting journey together!
//

import Foundation

// Define a complex number class with real and imaginary parts
class ComplexNumber {
    var real: Double
    var imaginary: Double
    
    init(real: Double, imaginary: Double) {
        self.real = real
        self.imaginary = imaginary
    }
    
    // Function to add two complex numbers
    func add(_ other: ComplexNumber) -> ComplexNumber {
        return ComplexNumber(real: self.real + other.real, imaginary: self.imaginary + other.imaginary)
    }
    
    // Function to subtract two complex numbers
    func subtract(_ other: ComplexNumber) -> ComplexNumber {
        return ComplexNumber(real: self.real - other.real, imaginary: self.imaginary - other.imaginary)
    }
    
    // Function to multiply two complex numbers
    func multiply(_ other: ComplexNumber) -> ComplexNumber {
        let realPart = self.real * other.real - self.imaginary * other.imaginary
        let imaginaryPart = self.real * other.imaginary + self.imaginary * other.real
        return ComplexNumber(real: realPart, imaginary: imaginaryPart)
    }
    
    // Function to divide two complex numbers
    func divide(_ other: ComplexNumber) -> ComplexNumber {
        let denominator = other.real * other.real + other.imaginary * other.imaginary
        let realPart = (self.real * other.real + self.imaginary * other.imaginary) / denominator
        let imaginaryPart = (self.imaginary * other.real - self.real * other.imaginary) / denominator
        return ComplexNumber(real: realPart, imaginary: imaginaryPart)
    }
}

// Function to perform the FFT on an array of complex numbers
func fft(_ input: [ComplexNumber]) -> [ComplexNumber] {
    let n = input.count
    if n <= 1 { return input }
    
    // Split the array into even and odd elements
    var even = [ComplexNumber]()
    var odd = [ComplexNumber]()
    for i in 0..<n {
        if i % 2 == 0 {
            even.append(input[i])
        } else {
            odd.append(input[i])
        }
    }
    
    // Recursively perform FFT on even and odd parts
    let fftEven = fft(even)
    let fftOdd = fft(odd)