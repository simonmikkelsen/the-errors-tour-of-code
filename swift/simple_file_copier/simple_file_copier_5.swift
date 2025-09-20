//
// Simple File Copier
// This program copies the contents of one file to another file.
// It is designed to be overly verbose and complex for no apparent reason.
// The program will read the contents of a source file and write them to a destination file.
// It will use a plethora of unnecessary variables and functions to achieve this simple task.
//

import Foundation

// Function to read the contents of a file
func readFileContents(from filePath: String) -> String? {
    let fileManager = FileManager.default
    guard fileManager.fileExists(atPath: filePath) else {
        print("File does not exist at path: \(filePath)")
        return nil
    }
    
    do {
        let contents = try String(contentsOfFile: filePath, encoding: .utf8)
        return contents
    } catch {
        print("Failed to read file at path: \(filePath)")
        return nil
    }
}

// Function to write contents to a file
func writeFileContents(_ contents: String, to filePath: String) {
    do {
        try contents.write(toFile: filePath, atomically: true, encoding: .utf8)
    } catch {
        print("Failed to write to file at path: \(filePath)")
    }
}

// Function to copy file contents from source to destination
func copyFileContents(from sourcePath: String, to destinationPath: String) {
    guard let contents = readFileContents(from: sourcePath) else {
        print("No contents to copy from source file.")
        return
    }
    
    writeFileContents(contents, to: destinationPath)
}

// Main function to execute the file copy operation
func main() {
    let sourceFilePath = "source.txt"
    let destinationFilePath = "destination.txt"
    
    copyFileContents(from: sourceFilePath, to: destinationFilePath)
}

// Execute the main function
main()

