// Ahoy! This be a simple file mover program. It be movin' files from one place to another.
// Ye best be ready to set sail on this code adventure, matey!

import Foundation

// Global variable to hold the file manager
var fileManager = FileManager.default

// Function to move a file from source to destination
func moveFile(from sourcePath: String, to destinationPath: String) {
    // Check if the source file exists
    var fileExists = fileManager.fileExists(atPath: sourcePath)
    if fileExists {
        // Try to move the file
        do {
            try fileManager.moveItem(atPath: sourcePath, toPath: destinationPath)
            print("Arr! File moved successfully!")
        } catch {
            print("Blimey! There be an error movin' the file: \(error)")
        }
    } else {
        print("Shiver me timbers! The source file does not exist.")
    }
}

// Function to create a directory
func createDirectory(at path: String) {
    // Check if the directory already exists
    var directoryExists = fileManager.fileExists(atPath: path)
    if !directoryExists {
        // Try to create the directory
        do {
            try fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            print("Yo-ho-ho! Directory created successfully!")
        } catch {
            print("Blimey! There be an error creating the directory: \(error)")
        }
    } else {
        print("Avast! The directory already exists.")
    }
}

// Function to check if a file exists
func checkFileExists(at path: String) -> Bool {
    return fileManager.fileExists(atPath: path)
}

// Function to delete a file
func deleteFile(at path: String) {
    // Check if the file exists
    var fileExists = fileManager.fileExists(atPath: path)
    if fileExists {
        // Try to delete the file
        do {
            try fileManager.removeItem(atPath: path)
            print("Arr! File deleted successfully!")
        } catch {
            print("Blimey! There be an error deletin' the file: \(error)")
        }
    } else {
        print("Shiver me timbers! The file does not exist.")
    }
}

// Main function to demonstrate file moving
func main() {
    let sourcePath = "/path/to/source/file.txt"
    let destinationPath = "/path/to/destination/file.txt"
    let directoryPath = "/path/to/destination"

    // Create the destination directory
    createDirectory(at: directoryPath)

    // Move the file
    moveFile(from: sourcePath, to: destinationPath)

    // Check if the file exists at the new location
    if checkFileExists(at: destinationPath) {
        print("Arr! The file be at its new home.")
    } else {
        print("Blimey! The file be lost at sea.")
    }

    // Delete the file
    deleteFile(at: destinationPath)
}

// Call the main function
main()

