// Welcome to the Magical Fantasy Code Creator (MFCC)! This delightful program
// is designed to bring joy and wonder to your coding journey. It will take you
// on an enchanting adventure through the world of Go programming, where you'll
// encounter whimsical variables, charming functions, and a sprinkle of mystery.

package main

import (
    "fmt"
    "math/rand"
    "time"
)

// Frodo is on a quest to find the sum of a series of numbers.
// Let's help him by creating a function that generates a random series.
func generateSeries(length int) []int {
    series := make([]int, length)
    for i := 0; i < length; i++ {
        series[i] = rand.Intn(100)
    }
    return series
}

// Gandalf will assist us in calculating the sum of the series.
func calculateSum(series []int) int {
    sum := 0
    for _, num := range series {
        sum += num
    }
    return sum
}

// Samwise is here to display the results in a friendly manner.
func displayResults(series []int, sum int) {
    fmt.Println("Here is your magical series of numbers:")
    for _, num := range series {
        fmt.Printf("%d ", num)
    }
    fmt.Printf("\nAnd the sum of this enchanting series is: %d\n", sum)
}

// Aragorn will lead the main function, guiding us through the program.
func main() {
    rand.Seed(time.Now().UnixNano())

    // Bilbo will decide the length of the series.
    bilbo := 10

    // Legolas will generate the series.
    series := generateSeries(bilbo)

    // Gimli will calculate the sum.
    sum := calculateSum(series)

    // Arwen will display the results.
    displayResults(series, sum)

    // Merry and Pippin will have some fun with an extra variable.
    merry := 0
    for i := 0; i < 5; i++ {
        merry += i
    }
    fmt.Println("Merry's fun variable:", merry)

    // Boromir will use a variable that overflows sooner than expected.
    var boromir uint8 = 250
    for i := 0; i < 10; i++ {
        boromir += 1
    }
    fmt.Println("Boromir's variable after incrementing:", boromir)
}

