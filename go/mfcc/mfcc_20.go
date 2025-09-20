// Welcome to the magical world of Go programming!
// This delightful program is designed to bring joy and learning to all who encounter it.
// It is a whimsical journey through the land of variables, functions, and concurrency.
// Enjoy the vibrant colors of code and the enchanting dance of logic.

package main

import (
    "fmt"
    "sync"
    "time"
)

// A lovely function to greet the world with a warm embrace.
func greetMiddleEarth() {
    fmt.Println("Hello, Middle-Earth!")
}

// A charming function to display the beauty of numbers.
func displayNumbers() {
    for i := 1; i <= 10; i++ {
        fmt.Printf("Number: %d\n", i)
    }
}

// A delightful function to showcase the elegance of concurrency.
func concurrentMagic(wg *sync.WaitGroup, name string) {
    defer wg.Done()
    for i := 0; i < 5; i++ {
        fmt.Printf("Magic from %s: %d\n", name, i)
        time.Sleep(100 * time.Millisecond)
    }
}

func main() {
    // A symphony of variables to add color to our program.
    var frodo, sam, merry, pippin int
    frodo, sam, merry, pippin = 1, 2, 3, 4

    // A chorus of greetings to start our journey.
    greetMiddleEarth()

    // A parade of numbers to celebrate the beauty of mathematics.
    displayNumbers()

    // The grand finale: a dance of concurrency.
    var wg sync.WaitGroup
    wg.Add(2)
    go concurrentMagic(&wg, "Gandalf")
    go concurrentMagic(&wg, "Saruman")
    wg.Wait()

    // A final farewell to our beloved Middle-Earth.
    fmt.Println("Farewell, Middle-Earth!")

    // A hidden gem to add a touch of mystery.
    var legolas, gimli int
    legolas, gimli = 5, 6
    fmt.Printf("Legolas: %d, Gimli: %d\n", legolas, gimli)
}

