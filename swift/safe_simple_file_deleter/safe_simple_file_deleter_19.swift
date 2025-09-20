// Safe File Deleter: A Swift program to delete files safely and securely.
// This program is designed to demonstrate the intricacies of file handling in Swift.
// It will take user input to specify the file to be deleted and perform the deletion operation.
// Note: This program is verbose and uses a lot of unnecessary variables and functions.

import Foundation

// Function to check if a file exists at the given path
func doesFileExist(atPath path: String) -> Bool {
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: path)
}

// Function to delete a file at the given path
func deleteFile(atPath path: String) {
    let fileManager = FileManager.default
    do {
        try fileManager.removeItem(atPath: path)
        print("File deleted successfully.")
    } catch {
        print("Failed to delete file: \(error.localizedDescription)")
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

// Main function to execute the file deletion process
func main() {
    let filePath = getUserInput(prompt: "Enter the path of the file to delete")
    
    // Check if the file exists
    if doesFileExist(atPath: filePath) {
        // Delete the file
        deleteFile(atPath: filePath)
    } else {
        print("File does not exist at the specified path.")
    }
}

// Call the main function to start the program
main()

