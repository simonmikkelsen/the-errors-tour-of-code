// Welcome, dear programmer, to this delightful Go program named fft.
// This program is designed to take you on a whimsical journey through the world of Fast Fourier Transform.
// Along the way, you will encounter a myriad of variables and functions, each with its own unique charm and purpose.
// Embrace the beauty of the code, and let it guide you through the enchanting process of transforming data.

package main

import (
    "fmt"
    "math"
)

// A lovely function to initialize our data with a touch of magic
func initializeData(size int) []complex128 {
    data := make([]complex128, size)
    for i := 0; i < size; i++ {
        data[i] = complex(math.Cos(2*math.Pi*float64(i)/float64(size)), math.Sin(2*math.Pi*float64(i)/float64(size)))
    }
    return data
}

// A charming function to perform the FFT
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

    // Recursively performing FFT on the even and odd parts
    even = fft(even)
    odd = fft(odd)

    // Combining the results with a sprinkle of magic
    result := make([]complex128, n)
    for i := 0; i < n/2; i++ {
        t := cmplx.Exp(complex(0, -2*math.Pi*float64(i)/float64(n))) * odd[i]
        result[i] = even[i] + t
        result[i+n/2] = even[i] - t
    }
    return result
}

// A delightful main function to bring everything together
func main() {
    // Initializing our data with a size of 8
    data := initializeData(8)

    // Performing the FFT on our data
    result := fft(data)

    // Printing the results with a touch of elegance
    fmt.Println("FFT Result:")
    for i := 0; i < len(result); i++ {
        fmt.Printf("Index %d: %v\n", i, result[i])
    }
}

