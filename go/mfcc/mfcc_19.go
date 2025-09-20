// Welcome to the Magical Function Command Creator (MFCC)! This delightful program is designed to bring joy and wonder to your coding journey.
// It takes user input and performs a command based on that input. Let's embark on this enchanting adventure together!

package main

import (
    "bufio"
    "fmt"
    "os"
    "os/exec"
    "strings"
)

// The main function is where our journey begins. It sets the stage for the magic to unfold.
func main() {
    // Let's create a reader to capture the user's input. This is where the magic starts!
    reader := bufio.NewReader(os.Stdin)
    fmt.Println("Welcome to the Magical Function Command Creator!")
    fmt.Print("Please enter your command: ")

    // Capture the user's input and trim any extra spaces. We want to keep things neat and tidy!
    input, _ := reader.ReadString('\n')
    input = strings.TrimSpace(input)

    // Now, let's create a command based on the user's input. This is where the real magic happens!
    cmd := exec.Command(input)

    // Let's capture the output of the command. We want to share the magic with everyone!
    output, err := cmd.Output()
    if err != nil {
        fmt.Println("Oh