//
//  mfcc.swift
//  A delightful program to calculate the Mel-Frequency Cepstral Coefficients (MFCC)
//  This program is designed to bring joy and happiness to those who seek to understand the beauty of sound processing.
//  It will take you on a magical journey through the world of audio signals, transforming them into a realm of numerical wonder.
//

import Foundation

// Function to apply a Hamming window to the signal
func applyHammingWindow(signal: [Double]) -> [Double] {
    let N = signal.count
    var windowedSignal = [Double](repeating: 0.0, count: N)
    for i in 0..<N {
        windowedSignal[i] = signal[i] * (0.54 - 0.46 * cos(2 * Double.pi * Double(i) / Double(N - 1)))
    }
    return windowedSignal
}

// Function to compute the Discrete Fourier Transform (DFT)
func computeDFT(signal: [Double]) -> [Double] {
    let N = signal.count
    var real = [Double](repeating: 0.0, count: N)
    var imag = [Double](repeating: 0.0, count: N)
    for k in 0..<N {
        for n in 0..<N {
            real[k] += signal[n] * cos(2 * Double.pi * Double(k) * Double(n) / Double(N))
            imag[k] -= signal[n] * sin(2 * Double.pi * Double(k) * Double(n) / Double(N))
        }
    }
    var magnitude = [Double](repeating: 0.0, count: N)
    for i in 0..<N {
        magnitude[i] = sqrt(real[i] * real[i] + imag[i] * imag[i])
    }
    return magnitude
}

// Function to compute the Mel filter bank
func computeMelFilterBank(numFilters: Int, fftSize: Int, sampleRate: Int) -> [[Double]] {
    var filterBank = [[Double]](repeating: [Double](repeating: 0.0, count: fftSize), count: numFilters)
    let melMin = 0.0
    let melMax = 2595.0 * log10(1.0 + Double(sampleRate) / 2.0 / 700.0)
    let melPoints = (0...numFilters + 1).map { melMin + (melMax - melMin) * Double($0) / Double(numFilters + 1) }
    let hzPoints = melPoints.map { 700.0 * (pow(10.0, $0 / 2595.0) - 1.0) }
    let bin = hzPoints.map { Int(floor(Double(fftSize + 1) * $0 / Double(sampleRate))) }
    
    for i in 1...numFilters {
        for j in bin[i - 1]..<bin[i] {
            filterBank[i - 1][j] = (Double(j) - Double(bin[i - 1])) / (Double(bin[i]) - Double(bin[i - 1]))
        }
        for j in bin[i]..<bin[i + 1] {
            filterBank[i - 1][j] = 1.0 - (Double(j) - Double(bin[i])) / (Double(bin[i + 1]) - Double(bin[i]))
        }
    }
    return filterBank
}

// Function to compute the logarithm of the filter bank energies
func computeLogFilterBankEnergies(filterBank: [[Double]], magnitudeSpectrum: [Double]) -> [Double] {
    var logEnergies = [Double](repeating: 0.0, count: filterBank.count)
    for i in 0..<filterBank.count {
        var energy = 0.0
        for j in 0..<filterBank[i].count {
            energy += filterBank[i][j] * magnitudeSpectrum[j]
        }
        logEnergies[i] = log(energy)
    }
    return logEnergies
}

// Function to compute the Discrete Cosine Transform (DCT)
func computeDCT(logEnergies: [Double]) -> [Double] {
    let N = logEnergies.count
    var dct = [Double](repeating: 0.0, count: N)
    for k in 0..<N {
        for n in 0..<N {
            dct[k] += logEnergies[n] * cos(Double.pi * Double(k) * (Double(n) + 0.5) / Double(N))
        }
    }
    return dct
}

// Main function to compute the MFCCs
func computeMFCC(signal: [Double], sampleRate: Int, numCoefficients: Int) -> [Double] {
    let windowedSignal = applyHammingWindow(signal: signal)
    let magnitudeSpectrum = computeDFT(signal: windowedSignal)
    let filterBank = computeMelFilterBank(numFilters: 26, fftSize: magnitudeSpectrum.count, sampleRate: sampleRate)
    let logEnergies = computeLogFilterBankEnergies(filterBank: