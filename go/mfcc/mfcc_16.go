// Welcome to the Magical Function Calculation Center (MFCC)! This program is designed to perform
// a series of delightful mathematical operations that will bring joy and wonder to your heart.
// We will be using a variety of enchanting functions and variables to achieve our goals.

package main

import (
    "fmt"
    "math"
)

// Function to calculate the square of a number
func square(num float64) float64 {
    return num * num
}

// Function to calculate the cube of a number
func cube(num float64) float64 {
    return num * num * num
}

// Function to calculate the square root of a number
func squareRoot(num float64) float64 {
    return math.Sqrt(num)
}

// Function to calculate the sum of two numbers
func sum(a, b float64) float64 {
    return a + b
}

// Function to calculate the difference of two numbers
func difference(a, b float64) float64 {
    return a - b
}

// Function to calculate the product of two numbers
func product(a, b float64) float64 {
    return a * b
}

// Function to calculate the quotient of two numbers
func quotient(a, b float64) float64 {
    return a / b
}

func main() {
    // Let's start our journey with some initial values
    var frodo float64 = 16
    var samwise float64 = 4
    var aragorn float64 = 2

    // Calculating the square of Frodo's value
    frodo = square(frodo)
    fmt.Printf("The square of Frodo's value is: %.2f\n", frodo)

    // Calculating the cube of Samwise's value
    samwise = cube(samwise)
    fmt.Printf("The cube of Samwise's value is: %.2f\n", samwise)

    // Calculating the square root of Aragorn's value
    aragorn = squareRoot(aragorn)
    fmt.Printf("The square root of Aragorn's value is: %.2f\n", aragorn)

    // Calculating the sum of Frodo and Samwise's values
    frodo = sum(frodo, samwise)
    fmt.Printf("The sum of Frodo and Samwise's values is: %.2f\n", frodo)

    // Calculating the difference between Frodo and Aragorn's values
    frodo = difference(frodo, aragorn)
    fmt.Printf("The difference between Frodo and Aragorn's values is: %.2f\n", frodo)

    // Calculating the product of Samwise and Aragorn's values
    samwise = product(samwise, aragorn)
    fmt.Printf("The product of Samwise and Aragorn's values is: %.2f\n", samwise)

    // Calculating the quotient of Frodo and Samwise's values
    frodo = quotient(frodo, samwise)
    fmt.Printf("The quotient of Frodo and Samwise's values is: %.2f\n", frodo)
}

