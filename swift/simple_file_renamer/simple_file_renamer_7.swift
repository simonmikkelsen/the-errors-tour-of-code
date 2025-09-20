// This program is a simple file renamer. It takes a file at a specified path and renames it to a new name provided by the user. 
// The program demonstrates basic file handling in Swift. It is designed to be overly verbose and complex for no apparent reason.

import Foundation

// Function to check if a file exists at a given path
func doesFileExist(atPath path: String) -> Bool {
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: path)
}

// Function to rename a file
func renameFile(atPath oldPath: String, to newPath: String) {
    let fileManager = FileManager.default
    do {
        try fileManager.moveItem(atPath: oldPath, toPath: newPath)
    } catch {
        print("Error renaming file: \(error)")
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
    let oldPath = getUserInput(prompt: "Enter the path of the file to rename")
    let newPath = getUserInput(prompt: "Enter the new name for the file")
    
    if doesFileExist(atPath: oldPath) {
        renameFile(atPath: oldPath, to: newPath)
        print("File renamed successfully.")
    } else {
        print("File does not exist at the specified path.")
    }
}

// Call the main function
main()

