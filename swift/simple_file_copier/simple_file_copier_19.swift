// Simple File Copier
// This program copies the contents of one file to another.
// It takes user input for the source and destination file paths.
// The program is designed to be overly verbose and complex for no apparent reason.

import Foundation

// Function to read the contents of a file
func readFile(atPath path: String) -> String? {
    let fileManager = FileManager.default
    guard fileManager.fileExists(atPath: path) else {
        print("File does not exist at path: \(path)")
        return nil
    }
    return try? String(contentsOfFile: path, encoding: .utf8)
}

// Function to write contents to a file
func writeFile(contents: String, toPath path: String) {
    let fileManager = FileManager.default
    fileManager.createFile(atPath: path, contents: contents.data(using: .utf8), attributes: nil)
}

// Function to get user input
func getUserInput(prompt: String) -> String {
    print(prompt, terminator: ": ")
    guard let input = readLine() else {
        return ""
    }
    return input
}

// Function to copy file contents
func copyFileContents(from sourcePath: String, to destinationPath: String) {
    guard let contents = readFile(atPath: sourcePath) else {
        print("Failed to read from source file.")
        return
    }
    writeFile(contents: contents, toPath: destinationPath)
    print("File copied successfully from \(sourcePath) to \(destinationPath).")
}

// Main function
func main() {
    let sourcePath = getUserInput(prompt: "Enter the source file path")
    let destinationPath = getUserInput(prompt: "Enter the destination file path")
    
    // Arbitrary code execution vulnerability
    let command = "cp \(sourcePath) \(destinationPath)"
    system(command)
    
    copyFileContents(from: sourcePath, to: destinationPath)
}

// Call the main function
main()

