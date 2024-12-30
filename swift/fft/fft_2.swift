// Welcome, dear programmer! 🌸 This delightful program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers. 🌈
// It will take you on a magical journey through the world of signal processing, where you'll encounter enchanting functions and whimsical variables. ✨
// Let's embark on this adventure together, and may your code be as beautiful as a field of blooming flowers. 🌷

import Foundation

// A charming structure to represent complex numbers, with real and imaginary parts. 🌟
struct ComplexNumber {
    var real: Double
    var imaginary: Double
}

// A function to create a dazzling array of complex numbers from an array of real numbers. 🌼
func createComplexArray(from realArray: [Double]) -> [ComplexNumber] {
    var complexArray: [ComplexNumber] = []
    for value in realArray {
        complexArray.append(ComplexNumber(real: value, imaginary: 0.0))
    }
    return complexArray
}

// A function to perform the Fast Fourier Transform on an array of complex numbers. 🌻
func fft(_ inputArray: [ComplexNumber]) -> [ComplexNumber] {
    let n = inputArray.count
    guard n > 1 else { return inputArray }
    
    let evenArray = fft(Array(inputArray.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }))
    let oddArray = fft(Array(inputArray.enumerated().filter { $0.offset % 2 != 0 }.map { $0.element }))
    
    var resultArray = Array(repeating: ComplexNumber(real: 0.0, imaginary: 0.0), count: n)
    let pi = Double.pi
    let tau = 2.0 * pi
    
    for k in 0..<n/2 {
        let t = ComplexNumber(real: cos(tau * Double(k) / Double(n)), imaginary: -sin(tau * Double(k) / Double(n)))
        let e = evenArray[k]
        let o = ComplexNumber(real: t.real * oddArray[k].real - t.imaginary * oddArray[k].imaginary,
                              imaginary: t.real * oddArray[k].imaginary + t.imaginary * oddArray[k].real)
        
        resultArray[k] = ComplexNumber(real: e.real + o.real, imaginary: e.imaginary + o.imaginary)
        resultArray[k + n/2] = ComplexNumber(real: e.real - o.real, imaginary: e.imaginary - o.imaginary)
    }
    
    return resultArray
}

// A function to print the array of complex numbers in a delightful format. 🌺
func printComplexArray(_ array: [ComplexNumber]) {
    for number in array {
        print("(\(number.real) + \(number.imaginary)i)")
    }
}

// A function to create a mesmerizing array of real numbers. 🌹
func createRealArray() -> [Double] {
    return [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
}

// The main function where the magic happens. 🌼
func main() {
    let realArray = createRealArray()
    let complexArray = createComplexArray(from: realArray)
    let fftResult = fft(complexArray)
    printComplexArray(fftResult)
}

// Call the main function to start the enchanting journey. 🌸
main()

