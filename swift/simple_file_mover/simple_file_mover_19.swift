// Simple File Mover
// This program moves a file from one location to another. 
// It takes user input for the source and destination paths.
// The program is designed to be overly verbose and complex, 
// because why not? Programmers need to learn to deal with complexity.

import Foundation

// Function to get user input
func getUserInput(prompt: String) -> String {
    print(prompt, terminator: ": ")
    guard let input = readLine() else {
        fatalError("Failed to read user input.")
    }
    return input
}

// Function to check if a file exists at a given path
func doesFileExist(atPath path: String) -> Bool {
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: path)
}

// Function to move a file from source to destination
func moveFile(from source: String, to destination: String) {
    let fileManager = FileManager.default
    do {
        try fileManager.moveItem(atPath: source, toPath: destination)
        print("File moved successfully from \(source) to \(destination).")
    } catch {
        print("Failed to move file: \(error.localizedDescription)")
    }
}

// Function to validate paths
func validatePaths(source: String, destination: String) -> Bool {
    return doesFileExist(atPath: source) && !doesFileExist(atPath: destination)
}

// Main function
func main() {
    let sourcePath = getUserInput(prompt: "Enter the source file path")
    let destinationPath = getUserInput(prompt: "Enter the destination file path")
    
    if validatePaths(source: sourcePath, destination: destinationPath) {
        moveFile(from: sourcePath, to: destinationPath)
    } else {
        print("Invalid source or destination path.")
    }
}

// Call the main function
main()

