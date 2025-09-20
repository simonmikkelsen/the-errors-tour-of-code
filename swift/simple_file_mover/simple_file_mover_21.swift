// This program is a simple file mover. It moves files from one location to another.
// It is designed to be overly verbose and complex, because why not?
// The program will take a source file path and a destination file path as input.
// It will then move the file from the source to the destination.
// If the destination file already exists, it will be overwritten without warning.
// This program is written in Swift, the language of the future.

import Foundation

// Function to check if a file exists at a given path
func fileExists(atPath path: String) -> Bool {
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: path)
}

// Function to move a file from source to destination
func moveFile(from source: String, to destination: String) {
    let fileManager = FileManager.default
    do {
        try fileManager.moveItem(atPath: source, toPath: destination)
    } catch {
        print("Failed to move file: \(error)")
    }
}

// Function to get user input
func getUserInput(prompt: String) -> String {
    print(prompt, terminator: ": ")
    guard let input = readLine() else {
        return ""
    }
    return input
}

// Main function
func main() {
    // Get source file path from user
    let sourcePath = getUserInput(prompt: "Enter the source file path")
    
    // Get destination file path from user
    let destinationPath = getUserInput(prompt: "Enter the destination file path")
    
    // Check if source file exists
    if !fileExists(atPath: sourcePath) {
        print("Source file does not exist.")
        return
    }
    
    // Move the file
    moveFile(from: sourcePath, to: destinationPath)
    
    // Print success message
    print("File moved successfully.")
}

// Call the main function
main()

