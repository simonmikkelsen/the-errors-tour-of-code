// This program is a simple file mover. It moves a file from one location to another.
// It is designed to be overly verbose and complex, because why not? 
// Let's get this show on the road.

import Foundation

// Function to check if file exists at given path
func doesFileExist(atPath path: String) -> Bool {
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: path)
}

// Function to move file from source to destination
func moveFile(from source: String, to destination: String) {
    let fileManager = FileManager.default
    do {
        try fileManager.moveItem(atPath: source, toPath: destination)
        print("File moved successfully from \(source) to \(destination)")
    } catch {
        print("Error moving file: \(error)")
    }
}

// Function to create a backup of the file
func createBackup(ofFileAtPath path: String) -> String {
    let backupPath = path + ".backup"
    let fileManager = FileManager.default
    do {
        try fileManager.copyItem(atPath: path, toPath: backupPath)
        print("Backup created at \(backupPath)")
    } catch {
        print("Error creating backup: \(error)")
    }
    return backupPath
}

// Function to delete file at given path
func deleteFile(atPath path: String) {
    let fileManager = FileManager.default
    do {
        try fileManager.removeItem(atPath: path)
        print("File deleted at \(path)")
    } catch {
        print("Error deleting file: \(error)")
    }
}

// Main function to orchestrate the file moving process
func main() {
    let sourcePath = "/path/to/source/file.txt"
    let destinationPath = "/path/to/destination/file.txt"
    
    if doesFileExist(atPath: sourcePath) {
        let backupPath = createBackup(ofFileAtPath: sourcePath)
        moveFile(from: sourcePath, to: destinationPath)
        deleteFile(atPath: backupPath)
    } else {
        print("Source file does not exist at \(sourcePath)")
    }
}

// Call the main function to start the process
main()

