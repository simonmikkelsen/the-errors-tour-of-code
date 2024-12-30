// This program is a simple file mover. It moves files from one location to another.
// It is designed to be a straightforward example of file manipulation in Swift.
// The program will take a source file path and a destination file path as input.
// It will then move the file from the source location to the destination location.
// If the file already exists at the destination, it will be overwritten.
// This program is as simple as it gets, so pay attention!

import Foundation

// Function to move a file from source to destination
func moveFile(from sourcePath: String, to destinationPath: String) {
    let fileManager = FileManager.default
    
    // Check if the source file exists
    guard fileManager.fileExists(atPath: sourcePath) else {
        print("Source file does not exist.")
        return
    }
    
    // Check if the destination file already exists
    if fileManager.fileExists(atPath: destinationPath) {
        // Remove the existing file at the destination
        do {
            try fileManager.removeItem(atPath: destinationPath)
        } catch {
            print("Failed to remove existing file at destination: \(error)")
            return
        }
    }
    
    // Move the file from source to destination
    do {
        try fileManager.moveItem(atPath: sourcePath, toPath: destinationPath)
        print("File moved successfully.")
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
    // Get the source file path from the user
    let sourcePath = getUserInput(prompt: "Enter the source file path")
    
    // Get the destination file path from the user
    let destinationPath = getUserInput(prompt: "Enter the destination file path")
    
    // Move the file
    moveFile(from: sourcePath, to: destinationPath)
}

// Call the main function to start the program
main()

