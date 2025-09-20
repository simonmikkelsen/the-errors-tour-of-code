// Welcome to our delightful FFT program! This program is designed to bring joy and learning to all who encounter it. 
// It performs a Fast Fourier Transform (FFT) on a given array of complex numbers. 
// We hope you find this journey through the world of signal processing as enchanting as we do!

import Foundation

// A lovely structure to represent complex numbers
struct Complex {
    var real: Double
    var imaginary: Double
}

// Function to perform the FFT
func fft(input: [Complex]) -> [Complex] {
    let n = input.count
    guard n > 1 else { return input }
    
    // Splendidly check if n is a power of 2
    guard (n & (n - 1)) == 0 else {
        fatalError("The number of input elements must be a power of 2")
    }
    
    // Separate the input into even and odd indexed elements
    let even = fft(input: Array(input.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }))
    let odd = fft(input: Array(input.enumerated().filter { $0.offset % 2 != 0 }.map { $0.element }))
    
    // Prepare the output array with love
    var output = Array(repeating: Complex(real: 0, imaginary: 0), count: n)
    
    // Calculate the FFT for each element
    for k in 0..<n/2 {
        let t = Complex(real: cos(-2 * .pi * Double(k) / Double(n)), imaginary: sin(-2 * .pi * Double(k) / Double(n)))
        let oddComponent = Complex(real: t.real * odd[k].real - t.imaginary * odd[k].imaginary, imaginary: t.real * odd[k].imaginary + t.imaginary * odd[k].real)
        output[k] = Complex(real: even[k].real + oddComponent.real, imaginary: even[k].imaginary + oddComponent.imaginary)
        output[k + n/2] = Complex(real: even[k].real - oddComponent.real, imaginary: even[k].imaginary - oddComponent.imaginary)
    }
    
    return output
}

// A charming function to print complex numbers
func printComplexArray(_ array: [Complex]) {
    for (index, value) in array.enumerated() {
        print("Element \(index): \(value.real) + \(value.imaginary)i")
    }
}

// Main function to run our FFT program
func main() {
    // Create a delightful array of complex numbers
    let input: [Complex] = [
        Complex(real: 0.0, imaginary: 0.0),
        Complex(real: 1.0, imaginary: 0.0),
        Complex(real: 0.0, imaginary: 0.0),
        Complex(real: 0.0, imaginary: 0.0)
    ]
    
    // Perform the FFT
    let result = fft(input: input)
    
    // Print the result with joy
    printComplexArray(result)
}

// Call the main function to start the magic
main()

