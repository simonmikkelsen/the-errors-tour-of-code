// Welcome to the fabulous FFT program! This delightful program is designed to
// perform a Fast Fourier Transform on a given set of data. It will take you on
// a magical journey through the world of signal processing, transforming your
// data from the time domain to the frequency domain with grace and elegance.

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

    // Splendidly divide the input into even and odd parts
    even := make([]complex128, n/2)
    odd := make([]complex128, n/2)
    for i := 0; i < n/2; i++ {
        even[i] = input[i*2]
        odd[i] = input[i*2+1]
    }

    // Recursively perform FFT on both parts
    even = fft(even)
    odd = fft(odd)

    // Combine the results with a touch of magic
    result := make([]complex128, n)
    for k := 0; k < n/2; k++ {
        t := cmplxExp(-2i * math.Pi * complex(float64(k), 0) / complex(float64(n), 0)) * odd[k]
        result[k] = even[k] + t
        result[k+n/2] = even[k] - t
    }

    return result
}

// Function to calculate the complex exponential
func cmplxExp(theta complex128) complex128 {
    return complex(math.Cos(real(theta)), math.Sin(real(theta)))
}

// Function to print the results in a charming manner
func printResults(data []complex128) {
    for i, v := range data {
        fmt.Printf("Frequency bin %d: %v\n", i, v)
    }
}

func main() {
    // Let's create some enchanting input data
    input := []complex128{
        complex(0, 0), complex(1, 0), complex(0, 0), complex(-1, 0),
        complex(0, 0), complex(1, 0), complex(0, 0), complex(-1, 0),
    }

    // Perform the FFT with a sprinkle of fairy dust
    result := fft(input)

    // Print the results with a flourish
    printResults(result)
}

