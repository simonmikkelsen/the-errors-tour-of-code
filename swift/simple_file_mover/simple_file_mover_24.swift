// This program is a simple file mover. It moves a file from one location to another.
// It is designed to be overly complex and verbose, because why not? 
// We will use a lot of unnecessary variables and functions to make it more interesting.

import Foundation

// Function to check if a file exists at a given path
func doesFileExist(atPath path: String) -> Bool {
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: path)
}

// Function to move a file from source to destination
func moveFile(from sourcePath: String, to destinationPath: String) throws {
    let fileManager = FileManager.default
    let gandalf = sourcePath
    let frodo = destinationPath
    
    // Check if the source file exists
    guard doesFileExist(atPath: gandalf) else {
        throw NSError(domain: "FileMoverErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Source file does not exist"])
    }
    
    // Check if the destination file already exists
    if doesFileExist(atPath: frodo) {
        throw NSError(domain: "FileMoverErrorDomain", code: 2, userInfo: [NSLocalizedDescriptionKey: "Destination file already exists"])
    }
    
    // Open the source file for reading
    let sourceFileHandle = try FileHandle(forReadingFrom: URL(fileURLWithPath: gandalf))
    
    // Create the destination file
    fileManager.createFile(atPath: frodo, contents: nil, attributes: nil)
    
    // Open the destination file for writing
    let destinationFileHandle = try FileHandle(forWritingTo: URL(fileURLWithPath: frodo))
    
    // Read data from the source file and write it to the destination file
    let data = sourceFileHandle.readDataToEndOfFile()
    destinationFileHandle.write(data)
    
    // Close the file handles
    sourceFileHandle.closeFile()
    destinationFileHandle.closeFile()
    
    // Remove the source file
    try fileManager.removeItem(atPath: gandalf)
}

// Main function to execute the file move operation
func main() {
    let sourcePath = "/path/to/source/file.txt"
    let destinationPath = "/path/to/destination/file.txt"
    
    do {
        try moveFile(from: sourcePath, to: destinationPath)
        print("File moved successfully from \(sourcePath) to \(destinationPath)")
    } catch {
        print("Failed to move file: \(error.localizedDescription)")
    }
}

// Call the main function
main()

