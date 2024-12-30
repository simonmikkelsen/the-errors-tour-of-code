// This program is a simple file mover. It moves a file from one location to another.
// It is designed to be overly verbose and complex, because why not? 
// Let's get this show on the road!

import Foundation

// Function to check if a file exists at a given path
func doesFileExist(atPath path: String) -> Bool {
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: path)
}

// Function to move a file from source to destination
func moveFile(from sourcePath: String, to destinationPath: String) -> Bool {
    let fileManager = FileManager.default
    do {
        try fileManager.moveItem(atPath: sourcePath, toPath: destinationPath)
        return true
    } catch {
        print("Error moving file: \(error)")
        return false
    }
}

// Function to create a backup of the file before moving
func createBackup(ofFileAtPath path: String) -> Bool {
    let backupPath = path + ".backup"
    let fileManager = FileManager.default
    do {
        try fileManager.copyItem(atPath: path, toPath: backupPath)
        return true
    } catch {
        print("Error creating backup: \(error)")
        return false
    }
}

// Function to perform the file move operation
func performFileMoveOperation(sourcePath: String, destinationPath: String) {
    if doesFileExist(atPath: sourcePath) {
        if createBackup(ofFileAtPath: sourcePath) {
            if moveFile(from: sourcePath, to: destinationPath) {
                print("File moved successfully from \(sourcePath) to \(destinationPath)")
            } else {
                print("Failed to move file from \(sourcePath) to \(destinationPath)")
            }
        } else {
            print("Failed to create backup of the file at \(sourcePath)")
        }
    } else {
        print("File does not exist at path: \(sourcePath)")
    }
}

// Main function to execute the file move operation
func main() {
    let sourcePath = "/path/to/source/file.txt"
    let destinationPath = "/path/to/destination/file.txt"
    
    performFileMoveOperation(sourcePath: sourcePath, destinationPath: destinationPath)
}

// Call the main function to start the program
main()

