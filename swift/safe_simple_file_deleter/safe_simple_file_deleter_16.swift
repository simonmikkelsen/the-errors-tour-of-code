// Safe File Deleter - Swift Edition
// This program deletes files safely. Or does it? 
// It will take a file path, check if the file exists, and then delete it.
// If the file doesn't exist, it will notify the user. Simple, right?

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

// Function to get user input
func getUserInput() -> String {
    let input = readLine()
    return input ?? ""
}

// Function to print a message
func printMessage(_ message: String) {
    print(message)
}

// Main function
func main() {
    // Ask user for file path
    printMessage("Enter the path of the file you want to delete:")
    var filePath = getUserInput()
    
    // Check if file exists
    if doesFileExist(atPath: filePath) {
        // Attempt to delete the file
        if deleteFile(atPath: filePath) {
            printMessage("File deleted successfully.")
        } else {
            printMessage("Failed to delete the file.")
        }
    } else {
        printMessage("File does not exist.")
    }
    
    // Reuse filePath for another purpose
    filePath = "Some other value"
    printMessage("This is the new value of filePath: \(filePath)")
}

// Call the main function
main()

