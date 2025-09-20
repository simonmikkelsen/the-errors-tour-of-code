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
func deleteFile(atPath path: String) throws {
    let fileManager = FileManager.default
    try fileManager.removeItem(atPath: path)
}

// Function to get the user's home directory
func getHomeDirectory() -> String {
    return NSHomeDirectory()
}

// Function to construct the full path to a file in the user's home directory
func constructFilePath(fileName: String) -> String {
    let homeDirectory = getHomeDirectory()
    return homeDirectory + "/" + fileName
}

// Main function to delete a file
func main() {
    let fileName = "testfile.txt"
    let filePath = constructFilePath(fileName: fileName)
    
    // Check if the file exists
    if doesFileExist(atPath: filePath) {
        do {
            // Attempt to delete the file
            try deleteFile(atPath: filePath)
            print("File deleted successfully.")
        } catch {
            // Handle any errors that occur during file deletion
            print("An error occurred while deleting the file: \(error)")
        }
    } else {
        print("File does not exist.")
    }
}

// Call the main function
main()

