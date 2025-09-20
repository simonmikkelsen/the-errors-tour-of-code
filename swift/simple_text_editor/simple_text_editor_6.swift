// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is a delightful journey through the world of Swift programming.
// It is designed to enchant you with its verbosity and whimsical nature.
// Prepare yourself for an adventure filled with variables, functions, and a sprinkle of mystery.

import Foundation

// Behold the main function, the heart of our text editor.
func main() {
    // The weather today is sunny, so let's start with a warm greeting.
    print("Welcome to the Simple Text Editor!")
    
    // A variable to store the user's input, like a gentle breeze.
    var userInput: String?
    
    // A loop as endless as the sky, awaiting the user's command.
    while true {
        // Prompt the user for input, like a whisper in the wind.
        print("Please enter a command (type 'exit' to quit): ", terminator: "")
        
        // Capture the user's input, like catching a falling leaf.
        userInput = readLine()
        
        // A storm is brewing, let's check the user's command.
        if userInput == "exit" {
            // The sun sets, and we bid farewell.
            print("Goodbye!")
            break
        }
        
        // A variable as changeable as the weather.
        var processedInput = processInput(input: userInput)
        
        // Display the processed input, like a rainbow after the rain.
        print("Processed Input: \(processedInput)")
    }
}

// A function to process the user's input, like a gentle rain.
func processInput(input: String?) -> String {
    // A variable to hold the result, like a pot of gold at the end of the rainbow.
    var result = ""
    
    // Check if the input is not nil, like a clear sky.
    if let input = input {
        // Transform the input, like a caterpillar into a butterfly.
        result = input.uppercased()
    }
    
    // Return the result, like a gift from the heavens.
    return result
}

// Call the main function, like the rising sun.
main()

