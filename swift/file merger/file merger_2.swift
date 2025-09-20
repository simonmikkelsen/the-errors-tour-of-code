// This program merges the contents of two files into a single file.
// It is designed to demonstrate the art of file manipulation in Swift.
// The program reads the contents of two files, combines them, and writes the result to a new file.
// The code is written with an abundance of caution and verbosity to ensure clarity and thoroughness.

import Foundation

// Function to read the contents of a file
func readFileContents(fileName: String) -> String? {
    // Attempt to read the file at the given path
    let fileURL = URL(fileURLWithPath: fileName)
    do {
        // Read the file contents into a string
        let contents = try String(contentsOf: fileURL, encoding: .utf8)
        return contents
    } catch {
        // Print an error message if the file could not be read
        print("Failed to read file: \(fileName)")
        return nil
    }
}

// Function to write contents to a file
func writeFileContents(fileName: String, contents: String) {
    // Create a URL for the file path
    let fileURL = URL(fileURLWithPath: fileName)
    do {
        // Write the contents to the file
        try contents.write(to: fileURL, atomically: true, encoding: .utf8)
    } catch {
        // Print an error message if the file could not be written
        print("Failed to write to file: \(fileName)")
    }
}

// Function to merge the contents of two files
func mergeFiles(file1: String, file2: String, outputFile: String) {
    // Read the contents of the first file
    guard let contents1 = readFileContents(fileName: file1) else {
        print("Error reading file: \(file1)")
        return
    }
    
    // Read the contents of the second file
    guard let contents2 = readFileContents(fileName: file2) else {
        print("Error reading file: \(file2)")
        return
    }
    
    // Combine the contents of the two files
    let mergedContents = contents1 + contents2
    
    // Write the combined contents to the output file
    writeFileContents(fileName: outputFile, contents: mergedContents)
}

// Main function to execute the file merging process
func main() {
    // Define the file names
    let file1 = "file1.txt"
    let file2 = "file2.txt"
    let outputFile = "merged.txt"
    
    // Call the mergeFiles function to merge the contents of the two files
    mergeFiles(file1: file1, file2: file2, outputFile: outputFile)
}

// Call the main function to start the program
main()

