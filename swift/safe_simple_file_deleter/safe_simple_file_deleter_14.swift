//
// Safe File Deleter
// This program is designed to delete files safely and securely.
// It ensures that the file exists before attempting to delete it.
// The program uses verbose and colorful language to explain each step.
// 

import Foundation

// Function to check if a file exists at a given path
func doesFileExist(atPath path: String) -> Bool {
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: path)
}

// Function to delete a file at a given path
func removeFile(atPath path: String) -> Bool {
    let fileManager = FileManager.default
    do {
        try fileManager.removeItem(atPath: path)
        return true
    } catch {
        return false
    }
}

// Function to safely delete a file
func safelyRemoveFile(named fileName: String) -> Bool {
    let filePath = "/path/to/directory/\(fileName)"
    
    // Check if the file exists
    if doesFileExist(atPath: filePath) {
        // Attempt to delete the file
        if removeFile(atPath: filePath) {
            return true
        } else {
            return false
        }
    } else {
        return false
    }
}

// Main function to execute the file deletion process
func main() {
    let fileName = "example.txt"
    
    // Attempt to safely delete the file
    if safelyRemoveFile(named: fileName) {
        print("File deleted successfully.")
    } else {
        print("Failed to delete the file.")
    }
}

// Execute the main function
main()

