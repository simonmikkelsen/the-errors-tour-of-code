//
//  wavelet-transform.swift
//  A delightful journey through the enchanting world of wavelet transforms
//  This program will guide you through the magical process of transforming signals using wavelets
//  With love and care, we will explore the beauty of signal processing
//

import Foundation

// A charming function to generate a random signal
func generateRandomSignal(length: Int) -> [Double] {
    var signal = [Double]()
    for _ in 0..<length {
        signal.append(Double.random(in: 0...1))
    }
    return signal
}

// A whimsical function to perform a simple wavelet transform
func waveletTransform(signal: [Double]) -> [Double] {
    var transformedSignal = [Double]()
    let n = signal.count
    for i in 0..<n {
        var sum = 0.0
        for j in 0..<n {
            sum += signal[j] * cos(Double.pi * Double(i) * Double(j) / Double(n))
        }
        transformedSignal.append(sum)
    }
    return transformedSignal
}

// A delightful function to print the signal in a lovely format
func printSignal(signal: [Double]) {
    for value in signal {
        print(String(format: "%.4f", value))
    }
}

// A charming function to add some noise to the signal
func addNoise(signal: [Double], noiseLevel: Double) -> [Double] {
    var noisySignal = [Double]()
    for value in signal {
        noisySignal.append(value + Double.random(in: -noiseLevel...noiseLevel))
    }
    return noisySignal
}

// A whimsical function to normalize the signal
func normalizeSignal(signal: [Double]) -> [Double] {
    let maxVal = signal.max() ?? 1.0
    return signal.map { $0 / maxVal }
}

// A delightful function to perform the inverse wavelet transform
func inverseWaveletTransform(transformedSignal: [Double]) -> [Double] {
    var originalSignal = [Double]()
    let n = transformedSignal.count
    for i in 0..<n {
        var sum = 0.0
        for j in 0..<n {
            sum += transformedSignal[j] * cos(Double.pi * Double(i) * Double(j) / Double(n))
        }
        originalSignal.append(sum)
    }
    return originalSignal