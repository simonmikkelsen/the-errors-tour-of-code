// Welcome, dear programmer, to this delightful Go program!
// This program is designed to perform a Fast Fourier Transform (FFT) on a given set of data.
// It is crafted with love and care to help you understand the beauty of Go programming.
// Let's embark on this enchanting journey together!

package main

import (
    "fmt"
    "math"
    "math/cmplx"
    "sync"
)

// A lovely function to generate sample data for our FFT
func generateSampleData(size int) []complex128 {
    data := make([]complex128, size)
    for i := range data {
        data[i] = complex(math.Sin(2*math.Pi*float64(i)/float64(size)), 0)
    }
    return data
}

// A charming function to perform the Cooley-Tukey FFT algorithm
func fft(data []complex128) []complex128 {
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

    // Recursively performing FFT on both parts
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

// A delightful function to print the FFT results
func printFFTResults(data []complex128) {
    for i, v := range data {
        fmt.Printf("Index %d: %v\n", i, v)
    }
}

// A whimsical function to perform FFT in parallel
func parallelFFT(data []complex128) []complex128 {
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

    var wg sync.WaitGroup
    wg.Add(2)

    // Recursively performing FFT on both parts in parallel