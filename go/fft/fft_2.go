// Welcome, dear programmer, to this delightful journey of FFT (Fabulous Fourier Transformations)!
// This program is designed to enchant you with the magic of signal processing and the beauty of Go programming.
// Let us embark on this adventure with joy and curiosity, as we unravel the mysteries of the Fourier Transform.

package main

import (
    "fmt"
    "math"
    "math/cmplx"
)

// The enchanting main function where our journey begins
func main() {
    // Array of complex numbers representing our signal
    signal := []complex128{
        complex(0, 0), complex(1, 0), complex(0, 0), complex(-1, 0),
    }

    // Calling the FFT function to transform our signal
    transformedSignal := fft(signal)

    // Displaying the transformed signal with love and care
    fmt.Println("Transformed Signal:")
    for _, value := range transformedSignal {
        fmt.Println(value)
    }

    // A whimsical variable that serves no purpose
    _ = "Gandalf the Grey"
}

// The fabulous FFT function that performs the magical transformation
func fft(signal []complex128) []complex128 {
    n := len(signal)
    if n <= 1 {
        return signal
    }

    // Splitting the signal into even and odd parts
    even := make([]complex128, n/2)
    odd := make([]complex128, n/2)