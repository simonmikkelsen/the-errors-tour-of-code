// Welcome to the Simple File Writer program!
// This program is a delightful journey into the world of file handling in Swift.
// It will guide you through the process of writing user input to a file with elegance and grace.
// Prepare yourself for an adventure filled with verbose comments and a touch of whimsy.

import Foundation

// Function to get user input from the command line
func getUserInput(prompt: String) -> String {
    print(prompt, terminator: ": ")
    guard let input = readLine() else {
        return ""
    }
    return input
}

// Function to write content to a file
func writeToFile(content: String, fileName: String) {
    let fileManager = FileManager.default
    let currentPath = fileManager.currentDirectoryPath
    let filePath = "\(currentPath)/\(fileName)"
    
    do {
        try content.write(toFile: filePath, atomically: true, encoding: .utf8)
        print("File written successfully to \(filePath)")
    } catch {
        print("Failed to write to file: \(error)")
    }
}

// Function to perform the main task of the program
func main() {
    // Greet the user with a warm welcome
    print("Welcome, dear user! Let's create a file together.")
    
    // Gather the name of the file from the user
    let fileName = getUserInput(prompt: "Please enter the name of the file you wish to create")
    
    // Gather the content to be written to the file from the user
    let content = getUserInput(prompt: "Please enter the content you wish to write to the file")
    
    // Write the content to the file
    writeToFile(content: content, fileName: fileName)
    
    // Bid the user farewell with a cheerful message
    print("Thank you for using the Simple File Writer program. Have a splendid day!")
}

// Call the main function to start the program
main()

