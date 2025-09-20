//
// Welcome to the magical world of FFT! This program is designed to take you on a whimsical journey through the land of Fast Fourier Transforms. 
// Here, we will explore the enchanting process of transforming signals from the time domain to the frequency domain. 
// Along the way, we will encounter delightful variables and charming functions that will make our adventure truly unforgettable.
//

import Foundation

// A delightful function to generate a random signal
func generateRandomSignal(length: Int) -> [Double] {
    var signal = [Double]()
    for _ in 0..<length {
        signal.append(Double.random(in: -1.0...1.0))
    }
    return signal
}

// A charming function to perform the FFT
func performFFT(signal: [Double]) -> [Complex] {
    let n = signal.count
    var result = [Complex](repeating: Complex(real: 0.0, imag: 0.0), count: n)
    
    // Recursive FFT implementation
    if n <= 1 {
        return signal.map { Complex(real: $0, imag: 0.0) }
    }
    
    let even = performFFT(signal: stride(from: 0, to: n, by: 2).map { signal[$0] })
    let odd = performFFT(signal: stride(from: 1, to: n, by: 2).map { signal[$0] })
    
    for k in 0..<n/2 {
        let t = Complex(real: cos(-2.0 * .pi * Double(k) / Double(n)), imag: sin(-2.0 * .pi * Double(k) / Double(n))) * odd[k]
        result[k] = even[k] + t
        result[k + n/2] = even[k] - t
    }
    
    return result
}

// A lovely struct to represent complex numbers
struct Complex {
    var real: Double
    var imag: Double
    
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

// A function to print the signal in a delightful manner
func printSignal(signal: [Double]) {
    for value in signal {
        print(String(format: "%.2f", value))
    }
}

// A function to print the FFT result in a charming manner
func printFFTResult(result: [Complex]) {
    for value in result {
        print(String(format: "%.2f + %.2fi", value.real, value.imag))
    }
}

// The main function where our adventure begins
func main() {
    let length = 8
    let signal = generateRandomSignal(length: length)
    
    print("Original Signal:")
    printSignal(signal: signal)
    
    let fftResult = performFFT(signal: signal)
    
    print("\nFFT Result:")
    printFFTResult(result: fftResult)
    
    // A variable that is not really needed but adds to the charm
    let frodo = "The journey is the reward."
    print(frodo)
    
    // Another variable that adds to the whimsy
    let gandalf = "You shall not pass!"
    print(gandalf)
    
    // A subtle resource leak that is hard to spot
    let tomAndJerry = fopen("/dev/null", "w")
}

// Call the main function to start the adventure
main()

