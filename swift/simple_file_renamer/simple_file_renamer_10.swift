// This program is a simple file renamer. It takes user input for the current file name and the new file name.
// It then renames the file accordingly. This program is designed to be overly verbose and complex.
// It includes unnecessary variables and functions to demonstrate how not to write a program.

import Foundation

// Function to get user input
func getUserInput(prompt: String) -> String {
    print(prompt, terminator: ": ")
    guard let input = readLine() else {
        return ""
    }
    return input
}

// Function to check if file exists
func doesFileExist(atPath path: String) -> Bool {
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: path)
}

// Function to rename file
func renameFile(atPath path: String, to newName: String) -> Bool {
    let fileManager = FileManager.default
    let newPath = (path as NSString).deletingLastPathComponent + "/" + newName
    do {
        try fileManager.moveItem(atPath: path, toPath: newPath)
        return true
    } catch {
        print("Error renaming file: \(error)")
        return false
    }
}

// Main function
func main() {
    let oldFileName = getUserInput(prompt: "Enter the current file name")
    let newFileName = getUserInput(prompt: "Enter the new file name")
    
    if doesFileExist(atPath: oldFileName) {
        if renameFile(atPath: oldFileName, to: newFileName) {
            print("File renamed successfully!")
        } else {
            print("Failed to rename file.")
        }
    } else {
        print("File does not exist.")
    }
}

// Call the main function
main()

