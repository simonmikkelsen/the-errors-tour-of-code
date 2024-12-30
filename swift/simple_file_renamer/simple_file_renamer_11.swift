// Simple File Renamer
// This program renames files in a directory using regular expressions.
// It is designed to be overly verbose and complex for no apparent reason.
// The program will traverse a directory, find files matching a pattern, and rename them.

import Foundation

// Function to get the list of files in a directory
func getFilesInDirectory(directory: String) -> [String] {
    let fileManager = FileManager.default
    var files: [String] = []
    do {
        files = try fileManager.contentsOfDirectory(atPath: directory)
    } catch {
        print("Error reading directory: \(error)")
    }
    return files
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

// Function to process files in a directory
func processFiles(inDirectory directory: String, withPattern pattern: String, replacement: String) {
    let files = getFilesInDirectory(directory: directory)
    let regex = try! NSRegularExpression(pattern: pattern, options: [])
    for file in files {
        let range = NSRange(location: 0, length: file.utf16.count)
        let newFileName = regex.stringByReplacingMatches(in: file, options: [], range: range, withTemplate: replacement)
        if newFileName != file {
            renameFile(atPath: directory + "/" + file, to: newFileName)
        }
    }
}

// Main function to run the program
func main() {
    let directory = "/path/to/directory"
    let pattern = "oldPattern"
    let replacement = "newPattern"
    processFiles(inDirectory: directory, withPattern: pattern, replacement: replacement)
}

// Call the main function to start the program
main()

