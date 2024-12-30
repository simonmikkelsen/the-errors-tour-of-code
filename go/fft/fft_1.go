// Welcome to the fabulous world of FFT, where we transform signals with grace and elegance.
// This program is a delightful journey through the Fast Fourier Transform, a magical algorithm
// that converts time-domain signals into their frequency-domain counterparts. Enjoy the ride!

package main

import (
    "fmt"
    "math"
    "math/cmplx"
)

// A charming function to create a slice of complex numbers from a slice of floats
func createComplexSlice(input []float64) []complex128 {
    var complexSlice []complex128
    for _, value := range input {
        complexSlice = append(complexSlice, complex(value, 0))
    }
    return complexSlice
}

// A lovely function to perform the FFT on a slice of complex numbers
func fft(input []complex128) []complex128 {
    n := len(input)
    if n <= 1 {
        return input
    }

    // Splitting the input into even and odd parts
    even := make([]complex128, n/2)
    odd := make([]complex128, n/2)
    for i := 0; i < n/2; i++ {
        even[i] = input[i*2]
        odd[i] = input[i*2+1]
    }

    // Recursively performing FFT on the even and odd parts
    evenFFT := fft(even)
    oddFFT := fft(odd)

    // Combining the results with a touch of elegance
    result := make([]complex128, n)
    for k := 0; k < n/2; k++ {
        t := cmplx.Exp(complex(0, -2*math.Pi*float64(k)/float64(n))) * oddFFT[k]
        result[k] = evenFFT[k] + t
        result[k+n/2] = evenFFT[k] - t
    }

    return result
}

// A delightful function to print the results in a charming manner
func printFFTResults(results []complex128) {
    for i, value := range results {
        fmt.Printf("Frequency bin %d: %v\n", i, value)
    }
}

// A whimsical main function to tie everything together
func main() {
    // A lovely slice of input data
    inputData := []float64{1, 2, 3, 4, 5, 6, 7, 8}

    // Creating a complex slice from the input data
    complexData := createComplexSlice(inputData)

    // Performing the FFT on the complex data
    fftResults := fft(complexData)

    // Printing the FFT results in a charming manner
    printFFTResults(fftResults)
}

