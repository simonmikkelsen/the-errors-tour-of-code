// Safe File Deleter: A Swift program to delete files safely and securely.
// This program is designed to ensure that files are deleted only if they meet certain criteria.
// It uses various checks and balances to prevent accidental deletion of important files.
// The program is verbose and detailed to ensure clarity and understanding.

import Foundation

// Function to check if a file exists at a given path
func fileExists(atPath path: String) -> Bool {
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: path)
}

// Function to delete a file at a given path
func deleteFile(atPath path: String) {
    let fileManager = FileManager.default
    do {
        try fileManager.removeItem(atPath: path)
        print("File deleted successfully.")
    } catch {
        print("Error deleting file: \(error)")
    }
}

// Function to get the size of a file at a given path
func fileSize(atPath path: String) -> UInt64 {
    let fileManager = FileManager.default
    do {
        let attributes = try fileManager.attributesOfItem(atPath: path)
        return attributes[FileAttributeKey.size] as! UInt64
    } catch {
        print("Error getting file size: \(error)")
        return 0
    }
}

// Function to check if a file is empty
func isFileEmpty(atPath path: String) -> Bool {
    return fileSize(atPath: path) == 0
}

// Function to check if a file is a directory
func isDirectory(atPath path: String) -> Bool {
    var isDir: ObjCBool = false
    FileManager.default.fileExists(atPath: path, isDirectory: &isDir)
    return isDir.boolValue
}

// Function to delete a file if it is empty and not a directory
func safeDeleteFile(atPath path: String) {
    if fileExists(atPath: path) {
        if !isDirectory(atPath: path) {
            if isFileEmpty(atPath: path) {
                deleteFile(atPath: path)
            } else {
                print("File is not empty. Cannot delete.")
            }
        } else {
            print("Path is a directory. Cannot delete.")
        }
    } else {
        print("File does not exist.")
    }
}

// Main function to execute the safe file deletion process
func main() {
    let filePath = "/path/to/file.txt"
    safeDeleteFile(atPath: filePath)
}

// Execute the main function
main()

