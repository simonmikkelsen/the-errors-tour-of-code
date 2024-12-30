// Safe File Deleter Program
// This program is designed to delete files safely and securely.
// It ensures that the file exists before attempting to delete it.
// It also handles errors gracefully and provides detailed feedback to the user.

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

// Function to close a file handle
func closeFileHandle(_ fileHandle: FileHandle) {
    fileHandle.closeFile()
}

// Main function to orchestrate the file deletion process
func main() {
    let filePath = "/path/to/your/file.txt"
    
    // Check if the file exists
    if doesFileExist(atPath: filePath) {
        print("File exists. Proceeding with deletion.")
        
        // Open the file handle
        if let fileHandle = FileHandle(forReadingAtPath: filePath) {
            // Close the file handle prematurely
            closeFileHandle(fileHandle)
            
            // Attempt to delete the file
            deleteFile(atPath: filePath)
        } else {
            print("Failed to open file handle.")
        }
    } else {
        print("File does not exist. Nothing to delete.")
    }
}

// Call the main function to start the program
main()

