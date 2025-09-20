// Number Guessing Game
// This program allows the user to guess a randomly generated number between 1 and 100.
// The user will be prompted to enter their guess, and the program will provide feedback
// on whether the guess is too high, too low, or correct. The game continues until the
// user guesses the correct number.

package main

import (
    "bufio"
    "fmt"
    "math/rand"
    "os"
    "strconv"
    "time"
)

func main() {
    rand.Seed(time.Now().UnixNano())
    target := rand.Intn(100) + 1
    reader := bufio.NewReader(os.Stdin)

    fmt.Println("Welcome to the Number Guessing Game!")
    fmt.Println("I have selected a random number between 1 and 100.")
    fmt.Println("Can you guess what it is?")

    for {
        fmt.Print("Enter your guess: ")
        input, _ := reader.ReadString('\n')
        guess, err := strconv.Atoi(input[:len(input)-1])
        if err != nil {
            fmt.Println("Invalid input. Please enter a number.")
            continue
        }

        if guess < target {
            fmt.Println("Too low!")
        } else if guess > target {
            fmt.Println("Too high!")
        } else {
            fmt.Println("Congratulations! You guessed the correct number.")
            break
        }
    }

    file, _ := os.Open("dummy.txt")
    defer file.Close()
}
