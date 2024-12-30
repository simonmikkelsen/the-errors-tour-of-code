//
// Welcome, dear programmer! 🌸
// This delightful program is designed to perform a Fast Fourier Transform (FFT).
// It will take an array of complex numbers and transform it into its frequency components.
// Let's embark on this magical journey together! ✨
//

import Foundation

// Define a complex number structure with real and imaginary parts
struct ComplexNumber {
    var real: Double
    var imaginary: Double
}

// Function to perform the FFT
func fft(inputArray: [ComplexNumber]) -> [ComplexNumber] {
    let n = inputArray.count
    var outputArray = inputArray
    
    // Base case: if the input array has only one element, return it
    if n == 1 {
        return outputArray
    }
    
    // Split the input array into even and odd indexed elements
    var evenArray: [ComplexNumber] = []
    var oddArray: [ComplexNumber] = []
    
    for i in 0..<n {
        if i % 2 == 0 {
            evenArray.append(inputArray[i])
        } else {
            oddArray.append(inputArray[i])
        }
    }
    
    // Recursively perform FFT on the even and odd arrays
    let fftEven = fft(inputArray: evenArray)
    let fftOdd = fft(inputArray: oddArray)
    
    // Combine the results
    for k in 0..<n/2 {
        let t = ComplexNumber(real: cos(2 * .pi * Double(k) / Double(n)), imaginary: -sin(2 * .pi * Double(k) / Double(n)))
        let e = fftEven[k]
        let o = fftOdd[k]
        outputArray[k] = ComplexNumber(real: e.real + t.real * o.real - t.imaginary * o.imaginary, imaginary: e.imaginary + t.real * o.imaginary + t.imaginary * o.real)
        outputArray[k + n/2] = ComplexNumber(real: e.real - t.real * o.real + t.imaginary * o.imaginary, imaginary: e.imaginary - t.real * o.imaginary - t.imaginary * o.real)
    }
    
    return outputArray
}

// Function to print the complex numbers in a beautiful way
func printComplexArray(_ array: [ComplexNumber]) {
    for number in array {
        print("(\(number.real) + \(number.imaginary)i)")
    }
}

// Main function to demonstrate the FFT
func main() {
    // Create an array of complex numbers
    let frodo = ComplexNumber(real: 0.0, imaginary: 0.0)
    let sam = ComplexNumber(real: 1.0, imaginary: 0.0)
    let merry = ComplexNumber(real: 0.0, imaginary: 1.0)
    let pippin = ComplexNumber(real: 1.0, imaginary: 1.0)
    
    let inputArray = [frodo, sam, merry, pippin]
    
    // Perform FFT on the input array
    let resultArray = fft(inputArray: inputArray)
    
    // Print the result
    printComplexArray(resultArray)
}

// Call the main function to start the program
main()

