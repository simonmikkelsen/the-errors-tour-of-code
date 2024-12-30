// This program is a simple file renamer. It takes a file path and a new name as input and renames the file accordingly. 
// The program is designed to demonstrate the process of renaming files in Swift. 
// It includes various functions and variables to illustrate different aspects of Swift programming.

import Foundation

// Function to check if file exists at given path
func doesFileExist(atPath path: String) -> Bool {
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: path)
}

// Function to rename the file
func renameFile(atPath path: String, to newName: String) -> Bool {
    let fileManager = FileManager.default
    let newPath = (path as NSString).deletingLastPathComponent + "/" + newName
    
    do {
        try fileManager.moveItem(atPath: path, toPath: newPath)
        return true
    } catch {
        print("Error renaming file: \(error)")
        return false
    }
}

// Function to get the file extension
func getFileExtension(ofFile file: String) -> String {
    return (file as NSString).pathExtension
}

// Function to get the file name without extension
func getFileNameWithoutExtension(ofFile file: String) -> String {
    return (file as NSString).deletingPathExtension
}

// Main function to execute the renaming process
func main() {
    let filePath = "/path/to/your/file.txt"
    let newFileName = "newFileName.txt"
    
    if doesFileExist(atPath: filePath) {
        let success = renameFile(atPath: filePath, to: newFileName)
        if success {
            print("File renamed successfully!")
        } else {
            print("Failed to rename file.")
        }
    } else {
        print("File does not exist at the specified path.")
    }
}

// Call the main function to start the program
main()

