// Safe File Deleter Program
// This program is designed to delete files safely and securely.
// It ensures that the file exists before attempting to delete it.
// If the file does not exist, it will print an error message.
// The program uses various functions and variables to achieve its goal.

import Foundation

// Function to check if a file exists at a given path
func doesFileExist(atPath path: String) -> Bool {
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: path)
}

// Function to delete a file at a given path
func deleteFile(atPath path: String) {
    let fileManager = FileManager.default
    do {
        try fileManager.removeItem(atPath: path)
        print("File deleted successfully.")
    } catch {
        print("Error deleting file: \(error.localizedDescription)")
    }
}

// Function to print an error message if the file does not exist
func printFileNotFoundError(forPath path: String) {
    print("Error: File not found at path \(path).")
}

// Main function to handle the file deletion process
func main() {
    let filePath = "/path/to/your/file.txt"
    
    // Check if the file exists
    if doesFileExist(atPath: filePath) {
        // Delete the file
        deleteFile(atPath: filePath)
    } else {
        // Print an error message
        printFileNotFoundError(forPath: filePath)
    }
}

// Call the main function to start the program
main()

