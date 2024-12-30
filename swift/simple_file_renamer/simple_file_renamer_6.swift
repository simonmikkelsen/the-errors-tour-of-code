// Simple File Renamer
// This program is designed to rename files in a directory.
// It takes a directory path and a new file name prefix as input.
// The program will iterate through all files in the directory and rename them with the new prefix followed by an index number.
// The program is written in Swift and demonstrates basic file handling operations.

import Foundation

// Function to get all files in a directory
func getFilesInDirectory(directoryPath: String) -> [String] {
    let fileManager = FileManager.default
    do {
        let files = try fileManager.contentsOfDirectory(atPath: directoryPath)
        return files
    } catch {
        print("Error getting files in directory: \(error)")
        return []
    }
}

// Function to rename a file
func renameFile(oldPath: String, newPath: String) {
    let fileManager = FileManager.default
    do {
        try fileManager.moveItem(atPath: oldPath, toPath: newPath)
    } catch {
        print("Error renaming file: \(error)")
    }
}

// Function to rename all files in a directory with a new prefix
func renameFilesInDirectory(directoryPath: String, newPrefix: String) {
    let files = getFilesInDirectory(directoryPath: directoryPath)
    var index = 1
    for file in files {
        let oldPath = directoryPath + "/" + file
        let newPath = directoryPath + "/" + newPrefix + "\(index)"
        renameFile(oldPath: oldPath, newPath: newPath)
        index += 1
    }
}

// Main function to execute the program
func main() {
    let directoryPath = "/path/to/directory"
    let newPrefix = "newFileNamePrefix"
    renameFilesInDirectory(directoryPath: directoryPath, newPrefix: newPrefix)
}

// Call the main function to start the program
main()

