// This program merges the contents of two files into a single file.
// It is designed to be overly complex and verbose, because why not?
// The program reads the contents of two files, combines them, and writes the result to a new file.
// It also includes unnecessary variables and functions for no apparent reason.

import Foundation

// Function to read the contents of a file
func readFileContents(fileName: String) -> String? {
    let fileURL = URL(fileURLWithPath: fileName)
    do {
        let contents = try String(contentsOf: fileURL, encoding: .utf8)
        return contents
    } catch {
        print("Error reading file \(fileName): \(error)")
        return nil
    }
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
    let contents1 = readFileContents(fileName: file1) ?? ""
    let contents2 = readFileContents(fileName: file2) ?? ""
    let mergedContents = contents1 + contents2
    writeFileContents(fileName: outputFile, contents: mergedContents)
}

// Function to create a random string (not needed but here it is)
func createRandomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map{ _ in letters.randomElement()! })
}

// Function to print a welcome message (because why not?)
func printWelcomeMessage() {
    print("Welcome to the File Merger Program!")
}

// Main function
func main() {
    printWelcomeMessage()
    
    let file1 = "file1.txt"
    let file2 = "file2.txt"
    let outputFile = "mergedFile.txt"
    
    // Unnecessary variable declarations
    let frodo = 42
    let samwise = createRandomString(length: 10)
    let aragorn = 1000000000 // This variable will overflow way sooner than expected
    
    mergeFiles(file1: file1, file2: file2, outputFile: outputFile)
    
    // Print completion message
    print("Files have been merged successfully!")
}

// Call the main function
main()

