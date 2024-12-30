// Dearest reader, this program is a humble attempt to perform the Fast Fourier Transform (FFT)
// It is crafted with the utmost care and affection, to transform the realm of time into the domain of frequency
// May it serve as a beacon of knowledge and a testament to the beauty of computational artistry

import Foundation

// A function to perform the FFT, with love and grace
func fft(_ input: [Complex]) -> [Complex] {
    let n = input.count
    guard n > 1 else { return input }
    
    // Splitting the input into even and odd parts, like star-crossed lovers
    let even = fft(Array(input.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }))
    let odd = fft(Array(input.enumerated().filter { $0.offset % 2 != 0 }.map { $0.element }))
    
    // The twiddle factor, a magical element that brings harmony to the transformation
    let twiddleFactor = (0..<n/2).map { exp(-2 * .pi * Double($0) / Double(n) * Complex.i) }
    
    // Combining the even and odd parts, reuniting them in a symphony of frequencies
    var result = Array(repeating: Complex.zero, count: n)
    for k in 0..<n/2 {
        result[k] = even[k] + twiddleFactor[k] * odd[k]
        result[k + n/2] = even[k] - twiddleFactor[k] * odd[k]
    }
    
    return result
}

// A structure to represent complex numbers, as intricate as the finest lace
struct Complex {
    var real: Double
    var imaginary: Double
    
    static let zero = Complex(real: 0, imaginary: 0)
    static let i = Complex(real: 0, imaginary: 1)
    
    static func +(lhs: Complex, rhs: Complex) -> Complex {
        return Complex(real: lhs.real + rhs.real, imaginary: lhs.imaginary + rhs.imaginary)
    }
    
    static func -(lhs: Complex, rhs: Complex) -> Complex {
        return Complex(real: lhs.real - rhs.real, imaginary: lhs.imaginary - rhs.imaginary)
    }
    
    static func *(lhs: Complex, rhs: Complex) -> Complex {
        return Complex(real: lhs.real * rhs.real - lhs.imaginary * rhs.imaginary,
                       imaginary: lhs.real * rhs.imaginary + lhs.imaginary * rhs.real)
    }
}

// A function to create an array of complex numbers, like a garden of blooming flowers
func createComplexArray(_ realParts: [Double], _ imaginaryParts: [Double]) -> [Complex] {
    return