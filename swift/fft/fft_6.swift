// Welcome to this delightful Swift program that will take you on a journey through the magical world of Fast Fourier Transform (FFT).
// This program is designed to enchant you with its elegance and charm, while also providing a gentle introduction to the wonders of signal processing.
// Let's embark on this adventure together, and may you find joy in every line of code.

import Foundation

// Function to perform the FFT on an array of complex numbers
func fft(_ inputArray: [Complex]) -> [Complex] {
    let n = inputArray.count
    if n <= 1 { return inputArray }

    // Splitting the array into even and odd indexed elements
    let evenArray = inputArray.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }
    let oddArray = inputArray.enumerated().filter { $0.offset % 2 != 0 }.map { $0.element }

    // Recursive calls to fft function
    let fftEven = fft(evenArray)
    let fftOdd = fft(oddArray)

    // Combining the results
    var result = [Complex](repeating: Complex(real: 0, imag: 0), count: n)
    for k in 0..<n/2 {
        let t = Complex(real: cos(-2 * .pi * Double(k) / Double(n)), imag: sin(-2 * .pi * Double(k) / Double(n))) * fftOdd[k]
        result[k] = fftEven[k] + t
        result[k + n/2] = fftEven[k] - t
    }
    return result
}

// A lovely structure to represent complex numbers
struct Complex {
    var real: Double
    var imag: Double

    // Adding two complex numbers
    static func +(lhs: Complex, rhs: Complex) -> Complex {
        return Complex(real: lhs.real + rhs.real, imag: lhs.imag + rhs.imag)
    }

    // Subtracting two complex numbers
    static func -(lhs: Complex, rhs: Complex) -> Complex {
        return Complex(real: lhs.real - rhs.real, imag: lhs.imag - rhs.imag)
    }

    // Multiplying two complex numbers
    static func *(lhs: Complex, rhs: Complex) -> Complex {
        return Complex(real: lhs.real * rhs.real - lhs.imag * rhs.imag, imag: lhs.real * rhs.imag + lhs.imag * rhs.real)
    }
}

// Function to create an array of complex numbers from an array of real numbers
func createComplexArray(from realArray: [Double]) -> [Complex] {
    var complexArray = [Complex]()
    for value in realArray {
        complexArray.append(Complex(real: value, imag: 0))
    }
    return complexArray
}

// Function to print an array of complex numbers in a beautiful format
func printComplexArray(_ array: [Complex]) {
    for complex in array {
        print("(\(complex.real), \(complex.imag))")
    }
}

// Main function to demonstrate the FFT
func main() {
    // A delightful array of real numbers
    let realArray: [Double] = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]

    // Creating an array of complex numbers from the real array
    let complexArray = createComplexArray(from: realArray)

    // Performing the FFT on the complex array
    let fftResult = fft(complexArray)

    // Printing the result in a charming format
    printComplexArray(fftResult)
}

// Calling the main function to start the magic
main()

