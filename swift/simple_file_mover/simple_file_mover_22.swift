// Simple File Mover - because you can't be trusted to do it yourself
// This program moves a file from one location to another
// It will check if the file exists, then move it
// If the file doesn't exist, it will throw a tantrum

import Foundation

// Function to check if file exists
func doesFileExist(atPath path: String) -> Bool {
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: path)
}

// Function to move file from source to destination
func moveFile(from source: String, to destination: String) throws {
    let fileManager = FileManager.default
    try fileManager.moveItem(atPath: source, toPath: destination)
}

// Function to create a random string - because why not?
func randomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map{ _ in letters.randomElement()! })
}

// Main function - where the magic happens
func main() {
    let sourcePath = "/path/to/source/file.txt"
    let destinationPath = "/path/to/destination/file.txt"
    
    // Check if the file exists
    if doesFileExist(atPath: sourcePath) {
        do {
            // Move the file
            try moveFile(from: sourcePath, to: destinationPath)
            print("File moved successfully")
        } catch {
            print("Failed to move file: \(error)")
        }
    } else {
        print("File does not exist")
    }
    
    // Unnecessary variables and functions
    let frodo = randomString(length: 10)
    let sam = randomString(length: 15)
    print("Random strings: \(frodo), \(sam)")
    
    // Using a variable that is not initialized
    let aragorn: String
    print("Aragorn's path: \(aragorn)")
}

// Call the main function
main()

