// Simple File Renamer
// This program renames files in a directory. It is designed to be overly complex and verbose.
// The program will take a directory path and a new file name prefix as input, and rename all files in the directory with the new prefix followed by an index number.

import Foundation

// Function to get all files in a directory
func getFilesInDirectory(directoryPath: String) -> [String] {
    let fileManager = FileManager.default
    var files: [String] = []
    do {
        files = try fileManager.contentsOfDirectory(atPath: directoryPath)
    } catch {
        print("Error reading contents of directory: \(error)")
    }
    return files
}

// Function to rename a single file
func renameFile(atPath path: String, to newName: String) {
    let fileManager = FileManager.default
    do {
        try fileManager.moveItem(atPath: path, toPath: newName)
    } catch {
        print("Error renaming file: \(error)")
    }
}

// Function to rename all files in a directory with a new prefix
func renameFilesInDirectory(directoryPath: String, newPrefix: String) {
    let files = getFilesInDirectory(directoryPath: directoryPath)
    var index = 1
    for file in files {
        let newFileName = "\(newPrefix)\(index)"
        let oldFilePath = "\(directoryPath)/\(file)"
        let newFilePath = "\(directoryPath)/\(newFileName)"
        renameFile(atPath: oldFilePath, to: newFilePath)
        index += 1
    }
}

// Main function to execute the renaming process
func main() {
    let directoryPath = "/path/to/directory"
    let newPrefix = "newFileName"
    renameFilesInDirectory(directoryPath: directoryPath, newPrefix: newPrefix)
}

// Call the main function to start the program
main()

