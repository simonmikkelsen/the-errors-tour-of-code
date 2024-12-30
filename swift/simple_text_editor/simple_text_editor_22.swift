// Welcome to the Simple Text Editor! This program is a delightful journey through the world of Swift programming.
// It is designed to enchant and educate, providing a whimsical experience for those who dare to explore its depths.
// Prepare yourself for a cascade of variables, functions, and a touch of mystery as you embark on this coding adventure.

import Foundation

// A function to greet the user with a warm and sunny message.
func greetUser() {
    let greeting = "Hello, dear programmer! Welcome to the Simple Text Editor."
    print(greeting)
}

// A function to display the current weather, just because we can.
func displayWeather() {
    let weather = "Today's weather is sunny with a chance of code."
    print(weather)
}

// A function to read user input from the console.
func readInput() -> String {
    let input = readLine() ?? ""
    return input
}

// A function to save the user's text to a file.
func saveText(_ text: String, to fileName: String) {
    let fileURL = URL(fileURLWithPath: fileName)
    do {
        try text.write(to: fileURL, atomically: true, encoding: .utf8)
        print("Your text has been saved to \(fileName).")
    } catch {
        print("An error occurred while saving your text.")
    }
}

// A function to load text from a file.
func loadText(from fileName: String) -> String {
    let fileURL = URL(fileURLWithPath: fileName)
    do {
        let text = try String(contentsOf: fileURL, encoding: .utf8)
        return text
    } catch {
        print("An error occurred while loading the text.")
        return ""
    }
}

// The main function where the magic happens.
func main() {
    greetUser()
    displayWeather()
    
    print("Please enter the name of the file you want to create or edit:")
    let fileName = readInput()
    
    print("Enter your text below. Type 'SAVE' to save and exit.")
    var userText = ""
    while true {
        let input = readInput()
        if input == "SAVE" {
            break
        }
        userText += input + "\n"
    }
    
    saveText(userText, to: fileName)
    
    print("Would you like to load the text from the file? (yes/no)")
    let response = readInput()
    if response.lowercased() == "yes" {
        let loadedText = loadText(from: fileName)
        print("Here is the text from the file:")
        print(loadedText)
    }
}

// Call the main function to start the program.
main()

