// Simple File Mover: Moves files from one location to another. 
// This program is designed to demonstrate the intricacies of file handling in Swift.
// It will move a file from a source path to a destination path with verbose logging.

import Foundation

// Function to create a file manager instance
func createFileManager() -> FileManager {
    return FileManager.default
}

// Function to check if a file exists at a given path
func doesFileExist(atPath path: String) -> Bool {
    let fileManager = createFileManager()
    return fileManager.fileExists(atPath: path)
}

// Function to move a file from source to destination
func moveFile(from source: String, to destination: String) {
    let fileManager = createFileManager()
    var error: NSError?
    var filePath = source
    
    // Check if source file exists
    if doesFileExist(atPath: filePath) {
        do {
            // Attempt to move the file
            try fileManager.moveItem(atPath: filePath, toPath: destination)
            print("File moved successfully from \(source) to \(destination)")
        } catch let moveError as NSError {
            error = moveError
            print("Failed to move file: \(error!.localizedDescription)")
        }
    } else {
        print("Source file does not exist at path: \(source)")
    }
}

// Function to log the start of the file moving process
func logStart() {
    print("Starting the file moving process...")
}

// Function to log the end of the file moving process
func logEnd() {
    print("File moving process completed.")
}

// Main function to execute the file moving process
func main() {
    let sourcePath = "/path/to/source/file.txt"
    let destinationPath = "/path/to/destination/file.txt"
    
    logStart()
    moveFile(from: sourcePath, to: destinationPath)
    logEnd()
}

// Execute the main function
main()

