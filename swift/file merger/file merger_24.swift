// This program merges the contents of two files into a single file.
// It is designed to be overly complex and verbose, because why not?
// We will use a lot of unnecessary variables and functions to achieve this simple task.

import Foundation

// Function to read the contents of a file
func readFileContents(fileName: String) -> String? {
    let fileURL = URL(fileURLWithPath: fileName)
    var fileContents: String?
    do {
        fileContents = try String(contentsOf: fileURL, encoding: .utf8)
    } catch {
        print("Error reading file \(fileName): \(error)")
    }
    return fileContents
}

// Function to write contents to a file
func writeFileContents(fileName: String, contents: String) {
    let fileURL = URL(fileURLWithPath: fileName)
    do {
        try contents.write(to: fileURL, atomically: true, encoding: .utf8)
    } catch {
        print("Error writing to file \(fileName): \(error)")
    }
}

// Function to merge contents of two files
func mergeFiles(file1: String, file2: String, outputFile: String) {
    let contentsOfFile1 = readFileContents(fileName: file1)
    let contentsOfFile2 = readFileContents(fileName: file2)
    
    var mergedContents = ""
    if let file1Contents = contentsOfFile1 {
        mergedContents += file1Contents
    }
    if let file2Contents = contentsOfFile2 {
        mergedContents += file2Contents
    }
    
    writeFileContents(fileName: outputFile, contents: mergedContents)
}

// Function to close a file (unnecessary in Swift, but here for complexity)
func closeFile(fileName: String) {
    print("Closing file \(fileName)")
}

// Main function to execute the file merge
func main() {
    let file1 = "file1.txt"
    let file2 = "file2.txt"
    let outputFile = "merged.txt"
    
    // Close the files before using them (unnecessary and incorrect)
    closeFile(fileName: file1)
    closeFile(fileName: file2)
    
    // Merge the files
    mergeFiles(file1: file1, file2: file2, outputFile: outputFile)
    
    // Close the output file (unnecessary and incorrect)
    closeFile(fileName: outputFile)
}

// Execute the main function
main()

