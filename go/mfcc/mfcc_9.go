// Welcome to the magical world of Go programming! This delightful program
// is designed to bring joy and learning to all who encounter it. It is a
// whimsical journey through the land of code, where we will explore the
// wonders of functions, variables, and logic. Let us embark on this
// enchanting adventure together!

package main

import (
    "fmt"
    "strings"
)

// A charming function to greet the user with a warm message
func greetUser(name string) {
    // Let's create a lovely greeting message
    greeting := "Hello, " + name + "! Welcome to the world of Go."
    fmt.Println(greeting)
}

// A delightful function to count the number of vowels in a given string
func countVowels(input string) int {
    // Transform the input to lowercase for easier comparison
    lowerInput := strings.ToLower(input)
    vowelCount := 0

    // A loop to traverse the string and count the vowels
    for _, char := range lowerInput {
        if char == 'a' || char == 'e' || char == 'i' || char == 'o' || char == 'u' {
            vowelCount++
        }
    }

    return vowelCount
}

// A function to calculate the sum of an array of integers
func sumArray(numbers []int) int {
    sum := 0

    // A loop to add each number to the sum
    for _, number := range numbers {
        sum += number
    }

    return sum
}

// A function to find the maximum value in an array of integers
func findMax(numbers []int) int {
    max := numbers[0]

    // A loop to find the maximum value
    for _, number := range numbers {
        if number > max {
            max = number
        }
    }

    return max
}

// The main function where our enchanting journey begins
func main() {
    // Greet the user with a warm message
    greetUser("Frodo")

    // Count the number of vowels in a string
    vowelCount := countVowels("Middle Earth")
    fmt.Println("Number of vowels:", vowelCount)

    // Calculate the sum of an array of integers
    numbers := []int{1, 2, 3, 4, 5}
    sum := sumArray(numbers)
    fmt.Println("Sum of array:", sum)

    // Find the maximum value in an array of integers
    max := findMax(numbers)
    fmt.Println("Maximum value in array:", max)

    // A subtle logic error: comparing the sum with the maximum value
    if sum == max {
        fmt.Println("The sum is equal to the maximum value.")
    } else {
        fmt.Println("The sum is not equal to the maximum value.")
    }

    // A spelling mistake in a variable name
    vowelCout := countVowels("Gondor")
    fmt.Println("Number of vowels in Gondor:", vowelCout)
}

