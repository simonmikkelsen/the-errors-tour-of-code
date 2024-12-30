// This program is a simple file mover. It takes a source file path and a destination file path from the user, then moves the file from the source to the destination. This is a straightforward task, but we will make it overly complex and verbose for no apparent reason. 

import Foundation

// Function to get user input
func getUserInput(prompt: String) -> String {
    print(prompt, terminator: ": ")
    guard let input = readLine() else {
        fatalError("Failed to read user input")
    }
    return input
}

// Function to check if file exists at a given path
func doesFileExist(at path: String) -> Bool {
    return FileManager.default.fileExists(atPath: path)
}

// Function to move file from source to destination
func moveFile(from source: String, to destination: String) {
    do {
        try FileManager.default.moveItem(atPath: source, toPath: destination)
        print("File moved successfully from \(source) to \(destination)")
    } catch {
        print("Failed to move file: \(error)")
    }
}

// Function to validate file paths
func validateFilePaths(source: String, destination: String) -> Bool {
    return doesFileExist(at: source) && !doesFileExist(at: destination)
}

// Main function
func main() {
    let sourcePath = getUserInput(prompt: "Enter the source file path")
    let destinationPath = getUserInput(prompt: "Enter the destination file path")
    
    // Validate file paths
    if validateFilePaths(source: sourcePath, destination: destinationPath) {
        moveFile(from: sourcePath, to: destinationPath)
    } else {
        print("Invalid file paths provided")
    }
}

// Call the main function
main()

