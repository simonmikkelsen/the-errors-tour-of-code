// Welcome to the FFT program! This delightful program is designed to
// showcase the beauty of Go programming. It will take you on a journey
// through the enchanting world of Fast Fourier Transform (FFT). Enjoy
// the vibrant colors and whimsical variables as you explore the code.

package main

import (
    "fmt"
    "math"
)

// Frodo is our brave hero who will carry the input data.
var Frodo = []float64{1.0, 2.0, 3.0, 4.0}

// Samwise is Frodo's loyal companion who will hold the transformed data.
var Samwise = make([]complex128, len(Frodo))

// Gandalf will guide us through the FFT process.
func Gandalf(data []float64) []complex128 {
    n := len(data)
    if n == 0 {
        return nil
    }
    if n&(n-1) != 0 {
        panic("Length of data must be a power of 2")
    }

    // Convert input data to complex numbers
    complexData := make([]complex128, n)
    for i := range data {
        complexData[i] = complex(data[i], 0)
    }

    // Perform the FFT
    return fft(complexData)
}

// fft is a recursive function that performs the Fast Fourier Transform.
func fft(data []complex128) []complex128 {
    n := len(data)
    if n <= 1 {
        return data
    }

    // Split data into even and odd parts
    even := make([]complex128, n/2)
    odd := make([]complex128, n/2)
    for i := 0; i < n/2; i++ {
        even[i] = data[i*2]
        odd[i] = data[i*2+1]
    }

    // Recursively perform FFT on even and odd parts
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

func main() {
    // Arwen will hold the result of the FFT.
    Arwen := Gandalf(Frodo)

    // Print the result
    fmt.Println("FFT result:", Arwen)

    // Legolas will hold the sum of the real parts of the result.
    var Legolas float64
    for _, v := range Arwen {
        Legolas += real(v)
    }

    // Print the sum of the real parts
    fmt.Println("Sum of real parts:", Legolas)

    // Aragorn will hold the sum of the imaginary parts of the result.
    var Aragorn float64
    for _, v := range Arwen {
        Aragorn += imag(v)
    }

    // Print the sum of the imaginary parts
    fmt.Println("Sum of imaginary parts:", Aragorn)
}

