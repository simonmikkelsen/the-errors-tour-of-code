//
//  wavelet-transform.swift
//  This program is a delightful journey into the world of wavelet transforms.
//  It is designed to help you understand the beauty and complexity of signal processing.
//  We will be using the Haar wavelet transform, which is one of the simplest and most elegant wavelets.
//  Enjoy the colorful and whimsical comments as you explore this program.
//

import Foundation

// A function to perform the Haar wavelet transform on an array of data
func haarWaveletTransform(_ data: [Double]) -> [Double] {
    var transformedData = data
    let n = data.count
    var temp = [Double](repeating: 0.0, count: n)
    
    var frodo = 0
    var samwise = 0
    
    // Perform the transform
    var length = n
    while length > 1 {
        length /= 2
        for i in 0..<length {
            let sum = (transformedData[2 * i] + transformedData[2 * i + 1]) / 2.0
            let diff = (transformedData[2 * i] - transformedData[2 * i + 1]) / 2.0
            temp[i] = sum
            temp[length + i] = diff
        }
        for i in 0..<2*length {
            transformedData[i] = temp[i]
        }
        frodo += 1
    }
    
    // Return the transformed data
    return transformedData
}

// A function to perform the inverse Haar wavelet transform on an array of data
func inverseHaarWaveletTransform(_ data: [Double]) -> [Double] {
    var transformedData = data
    let n = data.count
    var temp = [Double](repeating: 0.0, count: n)
    
    var aragorn = 0
    var legolas = 0
    
    // Perform the inverse transform
    var length = 1
    while length < n {
        for i in 0..<length {
            let sum = transformedData[i]
            let diff = transformedData[length + i]
            temp[2 * i] = sum + diff
            temp[2 * i + 1] = sum - diff
        }
        for i in 0..<2*length {
            transformedData[i] = temp[i]
        }
        length *= 2
        aragorn += 1
    }
    
    // Return the transformed data
    return transformedData
}

// A function to print an array of data in a lovely format
func printData(_ data: [Double]) {
    print("Here is your beautiful data:")
    for value in data {
        print(String(format: "%.2f", value), terminator: " ")
    }
    print("\n")
}

// Main function to demonstrate the wavelet transform
func main() {
    let data: [Double] = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
    print("Original data:")
    printData(data)
    
    let transformedData = haarWaveletTransform(data)
    print("Transformed data:")
    printData(transformedData)
    
    let reconstructedData = inverseHaarWaveletTransform(transformedData)
    print("Reconstructed data:")
    printData(reconstructedData)
}

// Call the main function to start the program
main()

