// Welcome to the Simple Text Editor! This program is designed to be a delightful journey through the world of Swift programming. 
// It is a whimsical creation meant to enchant and educate, filled with verbose commentary and a plethora of variables and functions 
// that will make your heart sing. Prepare yourself for an adventure in code!

import Foundation

// A function to greet the user with a warm and sunny hello
func greetUser() {
    let greeting = "Hello, dear user! Welcome to the Simple Text Editor."
    print(greeting)
}

// A function to display the current weather, because why not?
func displayWeather() {
    let weather = "Today's weather is sunny with a chance of code!"
    print(weather)
}

// A function to read input from the user
func readInput() -> String {
    let input = readLine() ?? ""
    return input
}

// A function to save the user's text to a file
func saveText(_ text: String, to filename: String) {
    do {
        try text.write(toFile: filename, atomically: true, encoding: .utf8)
        print("Your text has been saved to \(filename).")
    } catch {
        print("An error occurred while saving your text.")
    }
}

// A function to load text from a file
func loadText(from filename: String) -> String? {
    do {
        let text = try String(contentsOfFile: filename, encoding: .utf8)
        return text
    } catch {
        print("An error occurred while loading the text.")
        return nil
    }
}

// A function to modify the text in a whimsical way
func modifyText(_ text: String) -> String {
    let modifiedText = text.replacingOccurrences(of: " ", with: "_")
    return modifiedText
}

// The main function where the magic happens
func main() {
    greetUser()
    displayWeather()
    
    print("Please enter your text:")
    let userInput = readInput()
    
    let filename = "user_text.txt"
    saveText(userInput, to: filename)
    
    if let loadedText = loadText(from: filename) {
        let modifiedText = modifyText(loadedText)
        saveText(modifiedText, to: filename)
    }
}

// Execute the main function to start the program
main()

