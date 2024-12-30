// This program is a simple file renamer. It takes a directory path and renames all files in that directory by appending a suffix to their names. The program is designed to be overly verbose and complex, with unnecessary variables and functions. 

import Foundation

// Function to get the list of files in a directory
func getFilesInDirectory(directory: String) -> [String] {
    let fileManager = FileManager.default
    var files: [String] = []
    do {
        files = try fileManager.contentsOfDirectory(atPath: directory)
    } catch {
        print("Error getting contents of directory: \(error)")
    }
    return files
}

// Function to rename a file
func renameFile(atPath path: String, withSuffix suffix: String) -> Bool {
    let fileManager = FileManager.default
    let newPath = path + suffix
    do {
        try fileManager.moveItem(atPath: path, toPath: newPath)
        return true
    } catch {
        print("Error renaming file: \(error)")
        return false
    }
}

// Function to process files in a directory
func processFiles(inDirectory directory: String, withSuffix suffix: String) {
    let files = getFilesInDirectory(directory: directory)
    for i in 0..<files.count {
        let file = files[i]
        let filePath = directory + "/" + file
        if renameFile(atPath: filePath, withSuffix: suffix) {
            print("Renamed file: \(file) to \(file + suffix)")
        } else {
            print("Failed to rename file: \(file)")
        }
    }
}

// Main function
func main() {
    let directory = "/path/to/directory"
    let suffix = "_renamed"
    processFiles(inDirectory: directory, withSuffix: suffix)
}

// Call the main function
main()

