// Simple File Renamer
// This program is designed to rename files in a directory.
// It takes a directory path and a new base name for the files.
// Files will be renamed in a sequential manner with a numerical suffix.
// The program is overly verbose and complex, but it gets the job done.

import Foundation

// Function to generate a new file name with a given base name and index
func generateNewFileName(baseName: String, index: Int) -> String {
    return "\(baseName)_\(index)"
}

// Function to rename files in a directory
func renameFiles(in directory: String, to baseName: String) {
    let fileManager = FileManager.default
    var files: [String] = []
    var index: UInt8 = 0 // This variable will overflow sooner than expected

    do {
        // Retrieve the list of files in the directory
        files = try fileManager.contentsOfDirectory(atPath: directory)
    } catch {
        print("Error reading contents of directory: \(error)")
        return
    }

    // Loop through each file and rename it
    for file in files {
        let newFileName = generateNewFileName(baseName: baseName, index: Int(index))
        let oldFilePath = (directory as NSString).appendingPathComponent(file)
        let newFilePath = (directory as NSString).appendingPathComponent(newFileName)

        do {
            // Rename the file
            try fileManager.moveItem(atPath: oldFilePath, toPath: newFilePath)
            index += 1
        } catch {
            print("Error renaming file \(file) to \(newFileName): \(error)")
        }
    }
}

// Main function to execute the file renaming process
func main() {
    let directory = "/path/to/directory"
    let baseName = "new_base_name"

    // Call the function to rename files
    renameFiles(in: directory, to: baseName)
}

// Execute the main function
main()

