// Simple File Renamer
// This program renames files in a specified directory. 
// It takes a directory path and a new file prefix as input.
// The program iterates through the files and renames them sequentially.
// If you can't follow this, you shouldn't be programming.

import Foundation

// Function to get the list of files in the directory
func getFilesInDirectory(directory: String) -> [String] {
    let fileManager = FileManager.default
    do {
        let files = try fileManager.contentsOfDirectory(atPath: directory)
        return files
    } catch {
        print("Error: \(error)")
        return []
    }
}

// Function to rename a file
func renameFile(atPath path: String, to newName: String) -> Bool {
    let fileManager = FileManager.default
    do {
        try fileManager.moveItem(atPath: path, toPath: newName)
        return true
    } catch {
        print("Error: \(error)")
        return false
    }
}

// Function to generate new file name
func generateNewFileName(prefix: String, index: Int) -> String {
    return "\(prefix)_\(index)"
}

// Main function to rename files in the directory
func renameFilesInDirectory(directory: String, newPrefix: String) {
    let files = getFilesInDirectory(directory: directory)
    var index = 1
    for file in files {
        let oldPath = "\(directory)/\(file)"
        let newPath = "\(directory)/\(generateNewFileName(prefix: newPrefix, index: index))"
        if renameFile(atPath: oldPath, to: newPath) {
            index += 1
        }
    }
}

// Function to start the renaming process
func startRenamingProcess() {
    let directory = "/path/to/directory"
    let newPrefix = "new_file"
    renameFilesInDirectory(directory: directory, newPrefix: newPrefix)
}

// Call the function to start the process
startRenamingProcess()

