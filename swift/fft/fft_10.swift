// Welcome to the FFT program, a delightful journey into the world of Fast Fourier Transform.
// This program is designed to help you understand the beauty of signal processing and the magic of frequency domain analysis.
// Let's embark on this enchanting adventure together!

import Foundation

// Function to perform FFT on an array of complex numbers
func fft(_ inputArray: [Complex]) -> [Complex] {
    let n = inputArray.count
    guard n > 1 else { return inputArray }
    
    let evenArray = fft(Array(inputArray.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }))
    let oddArray = fft(Array(inputArray.enumerated().filter { $0.offset % 2 != 0 }.map { $0.element }))
    
    var result = Array(repeating: Complex(real: 0, imag: 0), count: n)
    let angle = -2.0 * Double.pi / Double(n)
    let w = Complex(real: cos(angle), imag: sin(angle))
    var wk = Complex(real: 1, imag: 0)
    
    for k in 0..<n/2 {
        result[k] = evenArray[k] + wk * oddArray[k]
        result[k + n/2] = evenArray[k] - wk * oddArray[k]
        wk = wk * w
    }
    
    return result
}

// Complex number class
class Complex {
    var real: Double
    var imag: Double
    
    init(real: Double, imag: Double) {
        self.real = real
        self.imag = imag
    }
    
    static func +(lhs: Complex, rhs: Complex) -> Complex {
        return Complex(real: lhs.real + rhs.real, imag: lhs.imag + rhs.imag)
    }
    
    static func -(lhs: Complex, rhs: Complex) -> Complex {
        return Complex(real: lhs.real - rhs.real, imag: lhs.imag - rhs.imag)
    }
    
    static func *(lhs: Complex, rhs: Complex) -> Complex {
        return Complex(real: lhs.real * rhs.real - lhs.imag * rhs.imag, imag: lhs.real * rhs.imag + lhs.imag * rhs.real)
    }
}

// Function to convert a string to a complex number array
func stringToComplexArray(_ input: String) -> [Complex] {
    let components = input.split(separator: " ").map { Double($0) ?? 0.0 }
    var complexArray: [Complex] = []
    for i in stride(from: 0, to: components.count, by: 2) {
        let real = components[i]
        let imag = i + 1 < components.count ? components[i + 1] : 0.0
        complexArray.append(Complex(real: real, imag: imag))
    }
    return complexArray
}

// Function to print complex number array
func printComplexArray(_ array: [Complex]) {
    for complex in array {
        print("(\(complex.real), \(complex.imag))")
    }
}
