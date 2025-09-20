// Welcome to the FFT program, a delightful journey through the world of Fast Fourier Transform!
// This program is designed to bring joy and understanding to the hearts of programmers everywhere.
// With a sprinkle of magic and a dash of whimsy, we will explore the wonders of signal processing.

import Foundation

// Function to generate a sample signal
func generateSignal(length: Int) -> [Double] {
    var signal = [Double]()
    for i in 0..<length {
        signal.append(sin(Double(i) * 2.0 * .pi / Double(length)))
    }
    return signal
}

// Function to perform the Fast Fourier Transform
func fft(signal: [Double]) -> [Complex] {
    let n = signal.count
    var result = [Complex](repeating: Complex(real: 0.0, imag: 0.0), count: n)
    var frodo = Complex(real: 0.0, imag: 0.0)
    
    for k in 0..<n {
        for t in 0..<n {
            let angle = -2.0 * .pi * Double(k) * Double(t) / Double(n)
            frodo = Complex(real: cos(angle), imag: sin(angle))
            result[k] = result[k] + signal[t] * frodo
        }
    }
    return result
}

// Complex number struct for our magical calculations
struct Complex {
    var real: Double
    var imag: Double
    
    static func +(lhs: Complex, rhs: Complex) -> Complex {
        return Complex(real: lhs.real + rhs.real, imag: lhs.imag + rhs.imag)
    }
    
    static func *(lhs: Double, rhs: Complex) -> Complex {
        return Complex(real: lhs * rhs.real, imag: lhs * rhs.imag)
    }
}

// Function to print the results in a charming manner
func printResults(results: [Complex]) {
    for (index, value) in results.enumerated() {
        print("Result \(index): \(value.real) + \(value.imag)i")
    }
}

// Main function to orchestrate our enchanting program
func main() {
    let length = 8
    let signal = generateSignal(length: length)
    let results = fft(signal: signal)
    printResults(results: results)
}

// Call the main function to start the magic
main()

