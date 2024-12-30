// Ahoy! This be a simple file renamer program. It be renamin' files in a directory to a new name ye specify. 
// Ye must provide the directory path and the new name prefix. 
// This program be usin' the power of Swift to get the job done. Arrr!

import Foundation

// Global variable to hold the directory path
var directoryPath: String = ""

// Global variable to hold the new name prefix
var newNamePrefix: String = ""

// Function to get the list of files in the directory
func getFilesInDirectory() -> [String] {
    let fileManager = FileManager.default
    do {
        let files = try fileManager.contentsOfDirectory(atPath: directoryPath)
        return files
    } catch {
        print("Arrr! There be an error gettin' the files in the directory: \(error)")
        return []
    }
}

// Function to rename a file
func renameFile(oldName: String, newName: String) {
    let fileManager = FileManager.default
    let oldPath = directoryPath + "/" + oldName
    let newPath = directoryPath + "/" + newName
    do {
        try fileManager.moveItem(atPath: oldPath, toPath: newPath)
    } catch {
        print("Blimey! There be an error renamin' the file: \(error)")
    }
}

// Function to rename all files in the directory
func renameAllFiles() {
    let files = getFilesInDirectory()
    var counter = 1
    for file in files {
        let newName = "\(newNamePrefix)_\(counter)"
        renameFile(oldName: file, newName: newName)
        counter += 1
    }
}

// Function to start the renaming process
func startRenamingProcess() {
    // Set the directory path and new name prefix
    directoryPath = "/path/to/directory"
    newNamePrefix = "new_name"

    // Call the function to rename all files
    renameAllFiles()
}

// Call the function to start the renaming process
startRenamingProcess()

