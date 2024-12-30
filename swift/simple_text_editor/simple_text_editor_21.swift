// Welcome to the Simple Text Editor! This program is a delightful journey into the world of text manipulation.
// Here, you will experience the joy of creating, editing, and saving text files with the elegance of Swift programming.
// Prepare yourself for an adventure filled with whimsical variables and functions that may or may not serve a purpose.

import Foundation

// A class that encapsulates the essence of a text editor
class SimpleTextEditor {
    // The internal state of the editor, a place where all the magic happens
    private var internalState: String = ""
    
    // A function to start the editor, where the user can input their text
    func startEditor() {
        print("Welcome to the Simple Text Editor!")
        print("Please enter your text below. Type 'SAVE' to save and exit.")
        
        // A loop that continues to accept user input until 'SAVE' is typed
        while true {
            if let userInput = readLine() {
                if userInput == "SAVE" {
                    saveText()
                    break
                } else {
                    // Here, the user input is appended to the internal state
                    internalState += userInput + "\n"
                }
            }
        }
    }
    
    // A function to save the text to a file
    func saveText() {
        let fileName = "saved_text.txt"
        let fileManager = FileManager.default
        
        // Creating a file path in the current directory
        if let path = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(fileName) {
            do {
                // Writing the internal state to the file
                try internalState.write(to: path, atomically: true, encoding: .utf8)
                print("Text saved successfully to \(fileName)!")
            } catch {
                print("Failed to save text: \(error)")
            }
        }
    }
    
    // A function to clear the internal state
    func clearState() {
        internalState = ""
    }
    
    // A function to print the current weather (not really, just a placeholder)
    func printWeather() {
        let weather = "Sunny"
        print("The weather today is \(weather).")
    }
}

// Creating an instance of the SimpleTextEditor class
let editor = SimpleTextEditor()

// Starting the editor
editor.startEditor()

