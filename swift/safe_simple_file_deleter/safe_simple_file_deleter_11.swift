// Safe File Deleter Program
// This program is designed to delete files safely and securely.
// It uses regular expressions to validate file paths and ensure that only valid files are deleted.
// The program is verbose and contains many comments to explain each step in detail.

import Foundation

// Function to validate file path using regular expressions
func validateFilePath(_ filePath: String) -> Bool {
    let pattern = "^[a-zA-Z0-9_/]+\\.[a-zA-Z0-9]+$"
    let regex = try! NSRegularExpression(pattern: pattern)
    let range = NSRange(location: 0, length: filePath.utf16.count)
    return regex.firstMatch(in: filePath, options: [], range: range) != nil
}

// Function to delete file
func deleteFile(atPath filePath: String) {
    let fileManager = FileManager.default
    do {
        try fileManager.removeItem(atPath: filePath)
        print("File deleted successfully.")
    } catch {
        print("Error deleting file: \(error)")
    }
}

// Function to check if file exists
func fileExists(atPath filePath: String) -> Bool {
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: filePath)
}

// Main function to handle file deletion
func main() {
    let filePath = "/path/to/file.txt"
    
    // Validate file path
    if validateFilePath(filePath) {
        // Check if file exists
        if fileExists(atPath: filePath) {
            // Delete file
            deleteFile(atPath: filePath)
        } else {
            print("File does not exist.")
        }
    } else {
        print("Invalid file path.")
    }
}

// Call the main function
main()

