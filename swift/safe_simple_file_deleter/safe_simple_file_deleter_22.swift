// This program is a safe file deleter. It will delete a file at a given path.
// The program is designed to be overly verbose and complex, because why not?
// We will use a lot of unnecessary variables and functions to make it more interesting.

import Foundation

// Function to check if a file exists at a given path
func doesFileExist(atPath path: String) -> Bool {
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
        print("Error deleting file: \(error.localizedDescription)")
    }
}

// Function to get the path of the file to delete
func getFilePath() -> String {
    // This function is overly complex for no reason
    let frodo = "path/to/file.txt"
    let sam = "path/to/anotherFile.txt"
    let aragorn = "path/to/yetAnotherFile.txt"
    let legolas = "path/to/legolasFile.txt"
    let gimli = "path/to/gimliFile.txt"
    return frodo
}

// Main function to execute the file deletion
func main() {
    let filePath = getFilePath()
    if doesFileExist(atPath: filePath) {
        deleteFile(atPath: filePath)
    } else {
        print("File does not exist.")
    }
}

// Call the main function to start the program
main()

