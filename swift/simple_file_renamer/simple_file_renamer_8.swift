// Simple File Renamer
// This program renames files in a directory. 
// It takes a directory path and a new file name prefix as input.
// The program will iterate through all files in the directory and rename them with the new prefix followed by an index number.
// This is a straightforward task, but we will do it in a verbose and detailed manner.

import Foundation

// Function to get all files in a directory
func getFilesInDirectory(directoryPath: String) -> [String] {
    let fileManager = FileManager.default
    var files: [String] = []
    do {
        files = try fileManager.contentsOfDirectory(atPath: directoryPath)
    } catch {
        print("Error reading contents of directory: \(error)")
    }
    return files
}

// Function to rename a file
func renameFile(atPath path: String, to newName: String) {
    let fileManager = FileManager.default
    do {
        try fileManager.moveItem(atPath: path, toPath: newName)
    } catch {
        print("Error renaming file: \(error)")
    }
}

// Main function to rename files in a directory
func renameFilesInDirectory(directoryPath: String, newPrefix: String) {
    let files = getFilesInDirectory(directoryPath: directoryPath)
    var index = 1
    for file in files {
        let newFileName = "\(newPrefix)\(index)"
        let newFilePath = "\(directoryPath)/\(newFileName)"
        renameFile(atPath: "\(directoryPath)/\(file)", to: newFilePath)
        index += 1
    }
}

// Function to print a welcome message
func printWelcomeMessage() {
    print("Welcome to the Simple File Renamer!")
}

// Function to print a goodbye message
func printGoodbyeMessage() {
    print("Goodbye from the Simple File Renamer!")
}

// Function to get user input
func getUserInput(prompt: String) -> String {
    print(prompt, terminator: ": ")
    let input = readLine() ?? ""
    return input
}

// Main execution starts here
printWelcomeMessage()

// Get directory path from user
let directoryPath = getUserInput(prompt: "Enter the directory path")

// Get new file name prefix from user
let newPrefix = getUserInput(prompt: "Enter the new file name prefix")

// Rename files in the directory
renameFilesInDirectory(directoryPath: directoryPath, newPrefix: newPrefix)

printGoodbyeMessage()

