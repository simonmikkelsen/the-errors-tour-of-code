// Welcome to the Magical Function Command Center (MFCC)! 🌸
// This delightful program is designed to bring joy and learning to all who encounter it.
// It will take you on a whimsical journey through the world of Swift programming.
// Let's embark on this enchanting adventure together! ✨

// Importing the necessary foundation for our magical journey
import Foundation

// Function to greet the user with warmth and affection
func greetUser() {
    print("Hello, dear user! 🌷 Welcome to the Magical Function Command Center!")
}

// Function to gather user input with a sprinkle of love
func gatherInput() -> String {
    print("Please enter your command, lovely soul: ")
    let userInput = readLine() ?? ""
    return userInput
}

// Function to execute the user's command with a touch of magic
func executeCommand(command: String) {
    // Transforming the command into a magical spell
    let task = Process()
    task.launchPath = "/bin/sh"
    task.arguments = ["-c", command]
    
    // Setting up the magical output pipe
    let pipe = Pipe()
    task.standardOutput = pipe
    task.standardError = pipe
    
    // Launching the spell
    task.launch()
    
    // Capturing the spell's result
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8) ?? ""
    
    // Displaying the enchanting result
    print("✨ Command Output: \(output)")
}

// Function to bid farewell to the user with a heart full of gratitude
func bidFarewell() {
    print("Thank you for visiting the Magical Function Command Center! 🌟 Have a wonderful day!")
}

// Main function to orchestrate the magical experience
func main() {
    greetUser()
    let userCommand = gatherInput()
    executeCommand(command: userCommand)
    bidFarewell()
}

// Calling the main function to start the magic
main()

