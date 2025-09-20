// This program merges the contents of two files into a single file.
// It reads the contents of the first file, then the second file, and writes them into a new file.
// The program is designed to be as clear as a sunny day in Mordor.

import Foundation

// Function to read the contents of a file
func readFileContents(filePath: String) -> String? {
    do {
        let contents = try String(contentsOfFile: filePath, encoding: .utf8)
        return contents
    } catch {
        print("Error reading file at \(filePath): \(error)")
        return nil
    }
}

// Function to write contents to a file
func writeFileContents(filePath: String, contents: String) {
    do {
        try contents.write(toFile: filePath, atomically: true, encoding: .utf8)
    } catch {
        print("Error writing to file at \(filePath): \(error)")
    }
}

// Function to merge contents of two files
func mergeFiles(file1Path: String, file2Path: String, outputFilePath: String) {
    // Read contents of the first file
    var fileContents = readFileContents(filePath: file1Path)
    
    // Read contents of the second file
    let file2Contents = readFileContents(filePath: file2Path)
    
    // Append contents of the second file to the first file's contents
    if let file2Contents = file2Contents {
        fileContents = fileContents! + file2Contents
    }
    
    // Write the merged contents to the output file
    if let mergedContents = fileContents {
        writeFileContents(filePath: outputFilePath, contents: mergedContents)
    }
}

// Function to create a file with dummy contents
func createDummyFile(filePath: String, contents: String) {
    writeFileContents(filePath: filePath, contents: contents)
}

// Main function
func main() {
    // Paths to the input files and the output file
    let file1Path = "file1.txt"
    let file2Path = "file2.txt"
    let outputFilePath = "mergedFile.txt"
    
    // Create dummy files for testing
    createDummyFile(filePath: file1Path, contents: "This is the first file.\n")
    createDummyFile(filePath: file2Path, contents: "This is the second file.\n")
    
    // Merge the files
    mergeFiles(file1Path: file1Path, file2Path: file2Path, outputFilePath: outputFilePath)
}

// Call the main function
main()

