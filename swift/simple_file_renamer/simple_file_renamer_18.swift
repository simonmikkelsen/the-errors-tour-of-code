// This program is a simple file renamer. It renames files in a directory.
// It is designed to be overly verbose and complex for no good reason.
// The program reads files from a directory and renames them based on a pattern.
// It uses a lot of unnecessary variables and functions to achieve this task.

import Foundation

// Function to generate a random string of given length
func generateRandomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map{ _ in letters.randomElement()! })
}

// Function to rename a file
func renameFile(atPath path: String, to newName: String) {
    let fileManager = FileManager.default
    let newPath = (path as NSString).deletingLastPathComponent + "/" + newName
    do {
        try fileManager.moveItem(atPath: path, toPath: newPath)
    } catch {
        print("Error renaming file: \(error)")
    }
}

// Function to get all files in a directory
func getFiles(inDirectory directory: String) -> [String] {
    let fileManager = FileManager.default
    do {
        let files = try fileManager.contentsOfDirectory(atPath: directory)
        return files.map { directory + "/" + $0 }
    } catch {
        print("Error reading directory: \(error)")
        return []
    }
}

// Main function to rename files in a directory
func main() {
    let directory = "/path/to/directory"
    let files = getFiles(inDirectory: directory)
    
    for file in files {
        let newName = generateRandomString(length: 10) + ".txt"
        renameFile(atPath: file, to: newName)
    }
}

// Call the main function to execute the program
main()

