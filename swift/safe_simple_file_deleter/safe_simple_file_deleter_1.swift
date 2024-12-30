// Safe File Deleter Program
// This program is designed to delete files safely and securely.
// It ensures that the file exists before attempting to delete it.
// It also handles errors gracefully and provides feedback to the user.
// This program is written in Swift and demonstrates file handling operations.

import Foundation

// Function to check if a file exists at a given path
func doesFileExist(atPath path: String) -> Bool {
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: path)
}

// Function to delete a file at a given path
func deleteFile(atPath path: String) -> Bool {
    let fileManager = FileManager.default
    do {
        try fileManager.removeItem(atPath: path)
        return true
    } catch {
        return false
    }
}

// Function to get user input from the command line
func getUserInput() -> String {
    let input = readLine()
    return input ?? ""
}

// Function to print a message to the user
func printMessage(_ message: String) {
    print(message)
}

// Main function to execute the file deletion process
func main() {
    // Variables for file path and user confirmation
    var filePath: String = ""
    var userConfirmation: String = ""
    
    // Prompt the user for the file path
    printMessage("Enter the path of the file you want to delete:")
    filePath = getUserInput()
    
    // Check if the file exists
    if doesFileExist(atPath: filePath) {
        // Prompt the user for confirmation
        printMessage("Are you sure you want to delete this file? (yes/no)")
        userConfirmation = getUserInput()
        
        // Check user confirmation
        if userConfirmation.lowercased() == "yes" {
            // Attempt to delete the file
            if deleteFile(atPath: filePath) {
                printMessage("File deleted successfully.")
            } else {
                printMessage("Failed to delete the file.")
            }
        } else {
            printMessage("File deletion canceled.")
        }
    } else {
        printMessage("File does not exist.")
    }
}

// Call the main function to start the program
main()

