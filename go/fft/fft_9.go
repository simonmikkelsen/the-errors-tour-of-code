// Welcome to the fabulous FFT program!
// This program is designed to perform a Fast Fourier Transform (FFT) on a given set of data.
// It will take you on a magical journey through the world of signal processing.
// Enjoy the ride and let the waves of data wash over you!

package main

import (
    "fmt"
    "math"
)

// Function to perform the FFT
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

    // Recursively perform FFT on both parts
    even = fft(even)
    odd = fft(odd)

    // Combine the results
    result := make([]complex128, n)
    for k := 0; k < n/2; k++ {
        t := cmplx.Exp(-2i * math.Pi * complex(float64(k), 0) / complex(float64(n), 0)) * odd[k]
        result[k] = even[k] + t
        result[k+n/2] = even[k] - t
    }

    return result
}

// Function to print the results in a beautiful format
func printResults(data []complex128) {
    fmt.Println("Here are your stunning FFT results:")
    for i, value := range data {
        fmt.Printf("Index %d: %v\n", i, value)
    }
}

// Main function to drive the program
func main() {
    // Sample data for FFT
    sampleData := []complex128{
        complex(0, 0), complex(1, 0), complex(0, 0), complex(0, 0),
        complex(1, 0), complex(0, 0), complex(0, 0), complex(0, 0),
    }

    // Perform FFT on the sample data
    result := fft(sampleData)

    // Print the results
    printResults(result)
}

