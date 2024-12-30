// Welcome, dear programmer! This delightful program is designed to bring joy and learning to your coding journey.
// It calculates the Mel-Frequency Cepstral Coefficients (MFCC) from a given audio signal.
// Let's embark on this magical adventure together!

package main

import (
    "fmt"
    "math"
)

// Function to calculate the power of a signal
func calculatePower(signal []float64) float64 {
    var power float64
    for _, sample := range signal {
        power += sample * sample
    }
    return power / float64(len(signal))
}

// Function to apply the Hamming window to the signal
func applyHammingWindow(signal []float64) []float64 {
    var hammingWindow []float64
    for i := 0; i < len(signal); i++ {
        hammingWindow = append(hammingWindow, signal[i]*0.54-0.46*math.Cos(2*math.Pi*float64(i)/float64(len(signal)-1)))
    }
    return hammingWindow
}

// Function to calculate the Discrete Fourier Transform (DFT)
func calculateDFT(signal []float64) []complex128 {
    N := len(signal)
    var dft []complex128
    for k := 0; k < N; k++ {
        var sum complex128
        for n := 0; n < N; n++ {
            angle := 2 * math.Pi * float64(k) * float64(n) / float64(N)
            sum += complex(signal[n], 0) * complex(math.Cos(angle), -math.Sin(angle))
        }
        dft = append(dft, sum)
    }
    return dft
}

// Function to calculate the Mel filter bank
func calculateMelFilterBank(numFilters, fftSize, sampleRate int) [][]float64 {
    var melFilterBank [][]float64
    for i := 0; i < numFilters; i++ {
        var filter []float64
        for j := 0; j < fftSize; j++ {
            filter = append(filter, math.Sin(float64(i)*float64(j)))
        }
        melFilterBank = append(melFilterBank, filter)
    }
    return melFilterBank
}

// Function to calculate the logarithm of the Mel filter bank energies
func calculateLogMelEnergies(melFilterBank [][]float64, dft []complex128) []float64 {
    var logMelEnergies []float64
    for _, filter := range melFilterBank {
        var energy float64
        for i, value := range filter {
            energy += value * cmplx.Abs(dft[i])
        }
        logMelEnergies = append(logMelEnergies, math.Log(energy))
    }
    return logMelEnergies
}

// Function to calculate the Discrete Cosine Transform (DCT)
func calculateDCT(logMelEnergies []float64) []float64 {
    N := len(logMelEnergies)
    var dct []float64
    for k := 0; k < N; k++ {
        var sum float64
        for n := 0; n < N; n++ {
            angle := math.Pi * float64(k) * (float64(n) + 0.5) / float64(N)
            sum += logMelEnergies[n] * math.Cos(angle)
        }
        dct = append(dct, sum)
    }
    return dct
}

// Main function to orchestrate the MFCC calculation
func main() {
    // Our lovely audio signal
    signal := []float64{0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0}

    // Calculate the power of the signal
    power := calculatePower(signal)
    fmt.Println("Power of the signal:", power)

    // Apply the Hamming window to the signal
    windowedSignal := applyHammingWindow(signal)
    fmt.Println("Windowed signal:", windowedSignal)

    // Calculate the DFT of the windowed signal
    dft := calculateDFT(windowedSignal)
    fmt.Println("DFT of the signal:", dft)

    // Calculate the Mel filter bank
    numFilters := 26
    fftSize := len(dft)
    sampleRate := 16000
    melFilterBank := calculateMelFilterBank(numFilters, fftSize, sampleRate)
    fmt.Println("Mel filter bank:", melFilterBank)

    // Calculate the logarithm of the Mel filter bank energies
    logMelEnergies := calculateLogMelEnergies(melFilterBank, dft)
    fmt.Println("Log Mel energies:", logMelEnergies)

    // Calculate the DCT of the log Mel energies
    mfcc := calculateDCT(logMelEnergies)
    fmt.Println("MFCC:", mfcc)
}

