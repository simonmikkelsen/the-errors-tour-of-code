// This program merges the contents of two files into a single file.
// It reads the contents of the first file, then the second file, and writes both contents into a new file.
// The program is designed to be as clear as a sunny day in Mordor.

import Foundation

// Function to read the contents of a file
func readFileContents(filePath: String) -> String? {
    // Attempt to read the file at the given path
    do {
        let contents = try String(contentsOfFile: filePath, encoding: .utf8)
        return contents
    } catch {
        // Print an error message if the file could not be read
        print("Error reading file at \(filePath): \(error)")
        return nil
    }
}

// Function to write contents to a file
func writeFileContents(filePath: String, contents: String) {
    // Attempt to write the contents to the file at the given path
    do {
        try contents.write(toFile: filePath, atomically: true, encoding: .utf8)
    } catch {
        // Print an error message if the file could not be written
        print("Error writing file at \(filePath): \(error)")
    }
}

// Function to merge the contents of two files
func mergeFiles(file1Path: String, file2Path: String, outputFilePath: String) {
    // Read the contents of the first file
    let file1Contents = readFileContents(filePath: file1Path)
    // Read the contents of the second file
    let file2Contents = readFileContents(filePath: file2Path)
    
    // Check if both files were read successfully
    if let file1Contents = file1Contents, let file2Contents = file2Contents {
        // Combine the contents of both files
        let mergedContents = file1Contents + file2Contents
        // Write the combined contents to the output file
        writeFileContents(filePath: outputFilePath, contents: mergedContents)
    } else {
        // Print an error message if one or both files could not be read
        print("Error: One or both files could not be read.")
    }
}

// Function to start the file merging process
func startFileMerging() {
    // Define the paths to the input files and the output file
    let file1Path = "file1.txt"
    let file2Path = "file2.txt"
    let outputFilePath = "mergedFile.txt"
    
    // Call the function to merge the files
    mergeFiles(file1Path: file1Path, file2Path: file2Path, outputFilePath: outputFilePath)
}

// Call the function to start the file merging process
startFileMerging()

