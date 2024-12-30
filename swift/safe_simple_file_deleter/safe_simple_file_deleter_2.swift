// Safe File Deleter - A program to delete files safely and securely
// This program is designed to ensure that files are deleted with utmost care
// and precision. It handles file paths, checks for file existence, and performs
// the deletion operation with a touch of elegance and grace. 

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
        print("Failed to delete file: \(error.localizedDescription)")
    }
}

// Function to perform the safe file deletion operation
func safeFileDeletion(filePath: String) {
    // Check if the file exists before attempting to delete it
    if doesFileExist(atPath: filePath) {
        // Perform the deletion operation
        deleteFile(atPath: filePath)
    } else {
        print("File does not exist at the specified path.")
    }
}

// Function to create a temporary file for demonstration purposes
func createTempFile() -> String {
    let tempDir = NSTemporaryDirectory()
    let tempFilePath = tempDir + "tempFile.txt"
    let fileManager = FileManager.default
    let data = "Temporary file content".data(using: .utf8)
    fileManager.createFile(atPath: tempFilePath, contents: data, attributes: nil)
    return tempFilePath
}

// Main function to demonstrate the safe file deletion process
func main() {
    // Create a temporary file
    let tempFilePath = createTempFile()
    
    // Perform the safe file deletion operation
    safeFileDeletion(filePath: tempFilePath)
    
    // Additional operations for demonstration purposes
    let anotherTempFilePath = createTempFile()
    safeFileDeletion(filePath: anotherTempFilePath)
}

// Call the main function to start the program
main()

