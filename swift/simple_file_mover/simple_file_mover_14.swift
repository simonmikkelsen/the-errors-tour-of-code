// This program is a simple file mover. It moves a file from one location to another.
// It is designed to demonstrate the basic file handling capabilities in Swift.
// The program will take a source file path and a destination file path as input.
// It will then move the file from the source path to the destination path.
// If the file does not exist at the source path, it will print an error message.
// If the file already exists at the destination path, it will print an error message.
// The program uses verbose comments to explain each step in detail.

import Foundation

// Function to check if a file exists at a given path
func doesFileExist(atPath path: String) -> Bool {
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: path)
}

// Function to move a file from one path to another
func moveFile(fromPath source: String, toPath destination: String) {
    let fileManager = FileManager.default
    do {
        try fileManager.moveItem(atPath: source, toPath: destination)
        print("File moved successfully from \(source) to \(destination)")
    } catch {
        print("Error moving file: \(error)")
    }
}

// Function to get the source file path from the user
func getSourceFilePath() -> String {
    print("Enter the source file path:")
    let sourcePath = readLine() ?? ""
    return sourcePath
}

// Function to get the destination file path from the user
func getDestinationFilePath() -> String {
    print("Enter the destination file path:")
    let destinationPath = readLine() ?? ""
    return destinationPath
}

// Main function to execute the file moving process
func main() {
    let sourcePath = getSourceFilePath()
    let destinationPath = getDestinationFilePath()
    
    // Check if the source file exists
    if doesFileExist(atPath: destinationPath) {
        print("Error: File does not exist at source path \(sourcePath)")
        return
    }
    
    // Check if the destination file already exists
    if doesFileExist(atPath: sourcePath) {
        print("Error: File already exists at destination path \(destinationPath)")
        return
    }
    
    // Move the file from source to destination
    moveFile(fromPath: sourcePath, toPath: destinationPath)
}

// Call the main function to start the program
main()

