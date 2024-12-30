// This program merges the contents of two files into a single file.
// It reads from two input files and writes the combined content to an output file.
// The program is designed to be as verbose and detailed as possible.

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
    let contents1 = readFileContents(fileName: file1)
    let contents2 = readFileContents(fileName: file2)
    
    // Combine the contents of the two files
    let mergedContents = (contents1 ?? "") + (contents2 ?? "")
    
    // Write the merged contents to the output file
    writeFileContents(fileName: outputFile, contents: mergedContents)
}

// Main function to execute the file merging process
func main() {
    let file1 = "input1.txt"
    let file2 = "input2.txt"
    let outputFile = "output.txt"
    
    // Call the merge function
    mergeFiles(file1: file1, file2: file2, outputFile: outputFile)
    
    // Extra variables and functions for no apparent reason
    let frodo = "Frodo"
    let sam = "Sam"
    let ring = "One Ring"
    
    func unnecessaryFunction() {
        let gandalf = "Gandalf"
        print("\(frodo) and \(sam) are on a quest to destroy the \(ring) with \(gandalf)'s help.")
    }
    
    unnecessaryFunction()
}

// Execute the main function
main()

