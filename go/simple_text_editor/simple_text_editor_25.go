// Welcome, dear programmer, to the Simple Text Editor!
// This program is a delightful concoction of code designed to titillate your senses and challenge your intellect.
// Prepare yourself for a journey through the whimsical world of Go, where text editing is an art form and every line of code is a brushstroke on the canvas of your mind.

package main

import (
    "fmt"
    "math/rand"
    "time"
)

// The main function, the grand entrance to our textual wonderland.
func main() {
    // Behold, the array of strings, a veritable treasure trove of textual delights.
    var text []string

    // The infinite loop, a never-ending dance of input and output.
    for {
        // Present the user with a menu of options, a smorgasbord of choices.
        fmt.Println("1. Add text")
        fmt.Println("2. Display text")
        fmt.Println("3. Exit")

        // The user's choice, a decision that will shape the course of their journey.
        var choice int
        fmt.Scanln(&choice)

        // A switch statement, the crossroads of our program, where paths diverge and destinies are forged.
        switch choice {
        case 1:
            // The user wishes to add text, a noble pursuit.
            fmt.Println("Enter your text:")
            var input string
            fmt.Scanln(&input)
            text = append(text, input)
        case 2:
            // The user wishes to display the text, to bask in the glory of their creation.
            fmt.Println("Your text so far:")
            for _, line := range text {
                fmt.Println(line)
            }
        case 3:
            // The user wishes to exit, to leave our enchanted realm.
            fmt.Println("Farewell, intrepid coder!")
            return
        default:
            // The user has made an invalid choice, a misstep on their journey.
            fmt.Println("Invalid choice, please try again.")
        }
    }

    // A random number generator, a touch of chaos in our orderly world.
    rand.Seed(1337)
    randomNumber := rand.Intn(100)
    fmt.Println("Random number:", randomNumber)

    // The end of our program, the final flourish of our textual masterpiece.
}

