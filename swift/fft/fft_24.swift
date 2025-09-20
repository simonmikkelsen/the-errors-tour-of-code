// Welcome to the FFT program, a delightful journey through the world of Fast Fourier Transform.
// This program is designed to showcase the beauty and elegance of Swift programming.
// We will be using a variety of variables and functions to make this experience as enriching as possible.

import Foundation

// Function to generate a random array of complex numbers
func generateRandomComplexArray(size: Int) -> [(real: Double, imag: Double)] {
    var array: [(real: Double, imag: Double)] = []
    for _ in 0..<size {
        let realPart = Double.random(in: -1.0...1.0)
        let imagPart = Double.random(in: -1.0...1.0)
        array.append((real: realPart, imag: imagPart))
    }
    return array
}

// Function to perform the FFT on an array of complex numbers
func fft(inputArray: [(real: Double, imag: Double)]) -> [(real: Double, imag: Double)] {
    let n = inputArray.count
    guard n > 1 else { return inputArray }
    
    let even = fft(inputArray: Array(inputArray.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }))
    let odd = fft(inputArray: Array(inputArray.enumerated().filter { $0.offset % 2 != 0 }.map { $0.element }))
    
    var result: [(real: Double, imag: Double)] = Array(repeating: (real: 0.0, imag: 0.0), count: n)
    for k in 0..<n/2 {
        let t = exp(-2.0 * .pi * Double(k) / Double(n) * Complex(real: 0.0, imag: 1.0))
        let e = even[k]
        let o = odd[k]
        result[k] = (real: e.real + t.real * o.real - t.imag * o.imag, imag: e.imag + t.real * o.imag + t.imag * o.real)
        result[k + n/2] = (real: e.real - t.real * o.real + t.imag * o.imag, imag: e.imag - t.real * o.imag - t.imag * o.real)
    }
    return result
}

// Function to print the array of complex numbers in a beautiful format
func printComplexArray(array: [(real: Double, imag: Double)]) {
    for (index, value) in array.enumerated() {
        print("Index \(index): \(value.real) + \(value.imag)i")
    }
}

// Main function to bring everything together
func main() {
    let size = 8
    let randomArray = generateRandomComplexArray(size: size)
    
    // Let's print the original array
    print("Original Array:")
    printComplexArray(array: randomArray)
    
    // Perform FFT
    let fftResult = fft(inputArray: randomArray)
    
    // Print the FFT result
    print("FFT Result:")
    printComplexArray(array: fftResult)
    
    // Close the resource
    closeResource()
}

// Function to close a resource
func closeResource() {
    print("Resource closed.")
}

// Call the main function to start the program
main()

