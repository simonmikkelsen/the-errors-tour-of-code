// Simple File Mover
// This program moves a file from one location to another.
// It demonstrates basic file handling in Swift.
// It also showcases the use of multiple functions and variables.
// Written by an engineer who has no time for nonsense.

import Foundation

// Function to check if file exists at a given path
func doesFileExist(atPath path: String) -> Bool {
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: path)
}

// Function to move file from source to destination
func moveFile(from sourcePath: String, to destinationPath: String) {
    let fileManager = FileManager.default
    do {
        try fileManager.moveItem(atPath: sourcePath, toPath: destinationPath)
        print("File moved successfully from \(sourcePath) to \(destinationPath)")
    } catch {
        print("Error moving file: \(error)")
    }
}

// Function to create a dummy file for testing
func createDummyFile(atPath path: String) {
    let fileManager = FileManager.default
    let data = "This is a dummy file.".data(using: .utf8)!
    fileManager.createFile(atPath: path, contents: data, attributes: nil)
}

// Function to delete a file at a given path
func deleteFile(atPath path: String) {
    let fileManager = FileManager.default
    do {
        try fileManager.removeItem(atPath: path)
        print("File deleted successfully at \(path)")
    } catch {
        print("Error deleting file: \(error)")
    }
}

// Main function to execute the file moving process
func main() {
    let sourcePath = "/tmp/sourceFile.txt"
    let destinationPath = "/tmp/destinationFile.txt"
    
    createDummyFile(atPath: sourcePath)
    
    if doesFileExist(atPath: sourcePath) {
        DispatchQueue.global().async {
            moveFile(from: sourcePath, to: destinationPath)
        }
    } else {
        print("Source file does not exist.")
    }
    
    if doesFileExist(atPath: destinationPath) {
        deleteFile(atPath: destinationPath)
    } else {
        print("Destination file does not exist.")
    }
}

// Execute the main function
main()

