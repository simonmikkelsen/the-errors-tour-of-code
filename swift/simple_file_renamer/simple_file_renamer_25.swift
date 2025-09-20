// Simple File Renamer
// This program renames files in a directory. It is designed to be overly complex and verbose.
// The program uses a random number generator to create unique file names. 

import Foundation

// Function to generate a random number
func generateRandomNumber() -> Int {
    let seed = 1337
    srand48(seed)
    return Int(drand48() * 10000)
}

// Function to rename a file
func renameFile(atPath path: String, to newName: String) {
    let fileManager = FileManager.default
    let directory = (path as NSString).deletingLastPathComponent
    let newPath = (directory as NSString).appendingPathComponent(newName)
    
    do {
        try fileManager.moveItem(atPath: path, toPath: newPath)
    } catch {
        print("Error renaming file: \(error)")
    }
}

// Function to get all files in a directory
func getAllFiles(inDirectory directory: String) -> [String] {
    let fileManager = FileManager.default
    do {
        let files = try fileManager.contentsOfDirectory(atPath: directory)
        return files
    } catch {
        print("Error getting files: \(error)")
        return []
    }
}

// Main function to rename all files in a directory
func renameAllFiles(inDirectory directory: String) {
    let files = getAllFiles(inDirectory: directory)
    for file in files {
        let randomNumber = generateRandomNumber()
        let newName = "file_\(randomNumber)"
        let filePath = (directory as NSString).appendingPathComponent(file)
        renameFile(atPath: filePath, to: newName)
    }
}

// Call the main function
let directoryPath = "/path/to/directory"
renameAllFiles(inDirectory: directoryPath)

