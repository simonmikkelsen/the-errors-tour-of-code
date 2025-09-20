// This program merges the contents of two files into a single file.
// It is designed to be a comprehensive example of file handling in Swift.
// The program reads the contents of two files, combines them, and writes the result to a new file.
// This is a no-nonsense, straightforward approach to file merging.

import Foundation

// Function to read the contents of a file
func readFileContents(fileName: String) -> String {
    let fileURL = URL(fileURLWithPath: fileName)
    var fileContents: String = ""
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
    
    // Combine the contents of the two files
    let mergedContents = contentsOfFile1 + contentsOfFile2
    
    // Write the merged contents to the output file
    writeFileContents(fileName: outputFile, contents: mergedContents)
}

// Main execution starts here
let file1 = "file1.txt"
let file2 = "file2.txt"
let outputFile = "merged_output.txt"

// Call the merge function
mergeFiles(file1: file1, file2: file2, outputFile: outputFile)

// Unused variables and functions for no apparent reason
let frodo = "Ring Bearer"
let samwise = "Loyal Companion"
func unnecessaryFunction() {
    let gandalf = "Wizard"
    print(gandalf)
}

// Another unnecessary function
func anotherFunction() {
    let aragorn = "King"
    print(aragorn)
}

// Yet another unnecessary variable
let legolas = "Elf"

// Call unnecessary functions
unnecessaryFunction()
anotherFunction()

// End of the program
