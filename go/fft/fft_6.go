// Welcome to the FFT program, a delightful journey through the world of Go programming!
// This program is designed to perform a Fast Fourier Transform (FFT) on a set of data points.
// Along the way, we will explore the beauty of Go's syntax and the elegance of its constructs.
// Let's embark on this magical adventure together!

package main

import (
    "fmt"
    "math"
)

// Function to perform the FFT
func fft(data []complex128) []complex128 {
    // The length of the data
    n := len(data)
    if n <= 1 {
        return data
    }

    // Splitting the data into even and odd parts
    even := make([]complex128, n/2)
    odd := make([]complex128, n/2)
    for i := 0; i < n/2; i++ {
        even[i] = data[i*2]
        odd[i] = data[i*2+1]
    }

    // Recursively calling fft on even and odd parts
    even = fft(even)
    odd = fft(odd)

    // Combining the results
    result := make([]complex128, n)
    for k := 0; k < n/2; k++ {
        t := cmplx.Exp(-2i * math.Pi * complex(float64(k), 0) / complex(float64(n), 0)) * odd[k]
        result[k] = even[k] + t
        result[k+n/2] = even[k] - t
    }

    return result
}

// Function to print the data in a lovely format
func printData(data []complex128) {
    for _, value := range data {
        fmt.Println(value)
    }
}

// Main function, the heart of our program
func main() {
    // Sample data points
    data := []complex128{1 + 0i, 1 + 0i, 1 + 0i, 1 + 0i, 0 + 0i, 0 + 0i, 0 + 0i, 0 + 0i}

    // Performing the FFT
    result := fft(data)

    // Printing the result
    printData(result)

    // Extra variables for no reason
    frodo := "The ring bearer"
    sam := "His loyal friend"
    gollum := "The twisted creature"

    fmt.Println(frodo, sam, gollum)
}

