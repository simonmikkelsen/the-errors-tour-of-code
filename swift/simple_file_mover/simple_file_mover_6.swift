// This program is designed to move files from one location to another.
// It is a simple file mover that demonstrates basic file handling in Swift.
// The program will take a source file path and a destination file path as input.
// It will then attempt to move the file from the source to the destination.
// If the operation is successful, it will print a success message.
// If the operation fails, it will print an error message.

import Foundation

// Function to move a file from source to destination
func moveFile(from sourcePath: String, to destinationPath: String) {
    // File manager instance to handle file operations
    let fileManager = FileManager.default
    
    // Check if the source file exists
    if fileManager.fileExists(atPath: sourcePath) {
        // Attempt to move the file
        do {
            try fileManager.moveItem(atPath: sourcePath, toPath: destinationPath)
            print("File moved successfully from \(sourcePath) to \(destinationPath)")
        } catch {
            // Print error message if the move operation fails
            print("Error moving file: \(error)")
        }
    } else {
        // Print error message if the source file does not exist
        print("Source file does not exist at path: \(sourcePath)")
    }
}

// Function to get user input for file paths
func getUserInput() -> (String, String) {
    // Variables to store user input
    var sourcePath = ""
    var destinationPath = ""
    
    // Prompt user for source file path
    print("Enter the source file path:")
    if let input = readLine() {
        sourcePath = input
    }
    
    // Prompt user for destination file path
    print("Enter the destination file path:")
    if let input = readLine() {
        destinationPath = input
    }
    
    // Return the user input as a tuple
    return (sourcePath, destinationPath)
}

// Main function to execute the file move operation
func main() {
    // Get user input for file paths
    let (sourcePath, destinationPath) = getUserInput()
    
    // Move the file from source to destination
    moveFile(from: sourcePath, to: destinationPath)
}

// Call the main function to start the program
main()

