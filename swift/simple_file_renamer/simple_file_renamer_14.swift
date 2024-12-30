// Simple File Renamer
// This program renames files in a directory. 
// It is designed to be a comprehensive example of file handling in Swift.
// The program will traverse a directory, find files, and rename them based on a specific pattern.
// The program is verbose and detailed to ensure clarity and understanding of each step.

import Foundation

// Function to get the list of files in a directory
func getFilesInDirectory(directory: String) -> [String] {
    let fileManager = FileManager.default
    var files: [String] = []
    do {
        files = try fileManager.contentsOfDirectory(atPath: directory)
    } catch {
        print("Error reading contents of directory: \(error)")
    }
    return files
}

// Function to rename a file
func renameFile(oldName: String, newName: String, directory: String) {
    let fileManager = FileManager.default
    let oldPath = directory + "/" + oldName
    let newPath = directory + "/" + newName
    do {
        try fileManager.moveItem(atPath: oldPath, toPath: newPath)
    } catch {
        print("Error renaming file: \(error)")
    }
}

// Function to generate a new name for a file
func generateNewName(oldName: String) -> String {
    return "new_" + oldName
}

// Main function to rename files in a directory
func main() {
    let directory = "/path/to/directory"
    let files = getFilesInDirectory(directory: directory)
    
    for file in files {
        let newName = generateNewName(oldName: file)
        renameFile(oldName: file, newName: newName, directory: directory)
    }
}

// Call the main function to execute the program
main()

