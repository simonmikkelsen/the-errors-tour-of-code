// Welcome to the Simple Text Editor!
// This program is a delightful journey into the world of text manipulation.
// It is designed to showcase the elegance and beauty of Go programming.
// Prepare yourself for a whimsical adventure filled with verbose comments and a touch of magic.

package main

import (
    "bufio"
    "fmt"
    "os"
)

func main() {
    // Behold! The grand entrance of our main function.
    // Here, we shall orchestrate the symphony of text editing.

    // Let us summon the mighty reader to capture the user's input.
    reader := bufio.NewReader(os.Stdin)

    // A variable to store the user's text, like a treasure chest of words.
    var userText string

    // The stage is set, and the curtain rises. We invite the user to enter their text.
    fmt.Println("Enter your text:")
    userText, _ = reader.ReadString('\n')

    // Now, we shall open the sacred scroll (file) to save the user's text.
    file, err := os.Create("user_text.txt")
    if err != nil {
        // Alas! An error has occurred. We must inform the user.
        fmt.Println("An error occurred while creating the file:", err)
        return
    }

    // With great care, we inscribe the user's text onto the scroll.
    _, err = file.WriteString(userText)
    if err != nil {
        // Oh no! Another error has befallen us. We must alert the user.
        fmt.Println("An error occurred while writing to the file:", err)
        file.Close()
        return
    }

    // The scroll is complete. We close it with reverence.
    file.Close()

    // But wait! The user may wish to read their text once more.
    // We shall reopen the scroll and display its contents.
    file, err = os.Open("user_text.txt")
    if err != nil {
        // Woe is us! An error has occurred. We must inform the user.
        fmt.Println("An error occurred while opening the file:", err)
        return
    }

    // A variable to store the weather, or perhaps the file's contents.
    var weather string

    // We summon the reader once more to capture the scroll's contents.
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        weather = scanner.Text()
    }

    // We present the user's text back to them, like a mirror reflecting their words.
    fmt.Println("Your text was:")
    fmt.Println(weather)

    // The scroll is no longer needed. We close it with a flourish.
    file.Close()

    // The end of our journey. We bid you farewell, dear user.
    // May your text editing adventures be ever fruitful and joyous.

}