// This program is a simple file copier. It reads the contents of one file and writes it to another file.
// The program is designed to demonstrate the process of file handling in Swift. 
// It includes detailed comments to explain each step of the process.

import Foundation

// Function to read the contents of a file
func readFile(atPath path: String) -> String? {
    // Attempt to open the file at the specified path
    let fileHandle: FileHandle?
    do {
        fileHandle = try FileHandle(forReadingFrom: URL(fileURLWithPath: path))
    } catch {
        print("Error opening file at \(path): \(error)")
        return nil
    }
    
    // Read the file contents into a Data object
    let fileData: Data
    do {
        fileData = try fileHandle!.readToEnd() ?? Data()
    } catch {
        print("Error reading file at \(path): \(error)")
        return nil
    }
    
    // Convert the Data object to a String
    let fileContents = String(data: fileData, encoding: .utf8)
    
    // Close the file handle
    fileHandle?.closeFile()
    
    // Return the file contents
    return fileContents
}

// Function to write contents to a file
func writeFile(contents: String, toPath path: String) {
    // Convert the string to a Data object
    guard let fileData = contents.data(using: .utf8) else {
        print("Error converting string to data")
        return
    }
    
    // Attempt to open the file at the specified path for writing
    let fileHandle: FileHandle?
    do {
        fileHandle = try FileHandle(forWritingTo: URL(fileURLWithPath: path))
    } catch {
        print("Error opening file at \(path): \(error)")
        return
    }
    
    // Write the data to the file
    do {
        try fileHandle?.write(contentsOf: fileData)
    } catch {
        print("Error writing to file at \(path): \(error)")
    }
    
    // Close the file handle
    fileHandle?.closeFile()
}

// Main function to copy a file
func copyFile(fromPath sourcePath: String, toPath destinationPath: String) {
    // Read the contents of the source file
    guard let fileContents = readFile(atPath: sourcePath) else {
        print("Failed to read file at \(sourcePath)")
        return
    }
    
    // Write the contents to the destination file
    writeFile(contents: fileContents, toPath: destinationPath)
}

// Example usage of the copyFile function
let sourcePath = "/path/to/source/file.txt"
let destinationPath = "/path/to/destination/file.txt"
copyFile(fromPath: sourcePath, toPath: destinationPath)

