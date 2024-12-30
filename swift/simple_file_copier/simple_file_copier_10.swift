// This program is a simple file copier. It takes a source file and a destination file as input and copies the contents of the source file to the destination file. This is a basic example of file handling in Swift. Pay attention to the details, as they are crucial for understanding the nuances of file operations.

import Foundation

// Function to read the contents of a file
func readFile(atPath path: String) -> String? {
    let fileManager = FileManager.default
    if fileManager.fileExists(atPath: path) {
        return try? String(contentsOfFile: path, encoding: .utf8)
    }
    return nil
}

// Function to write contents to a file
func writeFile(contents: String, toPath path: String) -> Bool {
    let fileManager = FileManager.default
    let data = contents.data(using: .utf8)
    return fileManager.createFile(atPath: path, contents: data, attributes: nil)
}

// Function to copy file contents from source to destination
func copyFile(from sourcePath: String, to destinationPath: String) -> Bool {
    if let contents = readFile(atPath: sourcePath) {
        return writeFile(contents: contents, toPath: destinationPath)
    }
    return false
}

// Main function to execute the file copy operation
func main() {
    // Variables for file paths
    let sourcePath = "/path/to/source/file.txt"
    let destinationPath = "/path/to/destination/file.txt"
    
    // User input for file paths
    print("Enter the source file path:")
    if let userSourcePath = readLine() {
        print("Enter the destination file path:")
        if let userDestinationPath = readLine() {
            // Copy the file using user-provided paths
            if copyFile(from: userSourcePath, to: userDestinationPath) {
                print("File copied successfully.")
            } else {
                print("Failed to copy file.")
            }
        }
    }
}

// Execute the main function
main()

