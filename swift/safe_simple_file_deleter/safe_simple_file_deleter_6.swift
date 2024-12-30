// This program is designed to delete files safely. It ensures that the file exists before attempting to delete it.
// The program is verbose and includes many checks and balances to ensure the utmost safety and reliability.
// It is written in a very detailed and precise manner to avoid any mishaps during file deletion.

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

// Function to get user input
func getUserInput() -> String {
    let input = readLine()
    return input ?? ""
}

// Main function to drive the program
func main() {
    print("Enter the path of the file you want to delete:")
    let filePath = getUserInput()
    
    // Check if the file exists
    if doesFileExist(atPath: filePath) {
        // Attempt to delete the file
        deleteFile(atPath: filePath)
    } else {
        print("File does not exist at the specified path.")
    }
}

// Call the main function to start the program
main()

