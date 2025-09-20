// Welcome to our delightful FFT program! This program is designed to perform a Fast Fourier Transform on a given set of data.
// The FFT is a magical algorithm that transforms a signal from its original domain (often time or space) to a representation in the frequency domain.
// Let's embark on this enchanting journey together!

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

// Function to perform the FFT
func fft(input: [(real: Double, imag: Double)]) -> [(real: Double, imag: Double)] {
    let n = input.count
    guard n > 1 else { return input }
    
    let even = fft(input: Array(input.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }))
    let odd = fft(input: Array(input.enumerated().filter { $0.offset % 2 != 0 }.map { $0.element }))
    
    var result: [(real: Double, imag: Double)] = Array(repeating: (real: 0.0, imag: 0.0), count: n)
    
    for k in 0..<n/2 {
        let t = exp(-2.0 * .pi * Double(k) / Double(n) * (0.0 + 1.0.i))
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

// Main function to orchestrate the FFT process
func main() {
    let size = 8
    let randomArray = generateRandomComplexArray(size: size)
    
    print("Original Array:")
    printComplexArray(array: randomArray)
    
    let transformedArray = fft(input: randomArray)
    
    print("Transformed Array:")
    printComplexArray(array: transformedArray)
}

// Call the main function to start the magic
main()

