// This program merges the contents of two files into a single file.
// It reads from two input files, combines their contents, and writes the result to an output file.
// The program is designed to be as clear and verbose as possible, leaving no room for ambiguity.
// Let's get this show on the road!

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

// Function to merge the contents of two files
func mergeFiles(file1: String, file2: String, outputFile: String) {
    // Read contents of the first file
    guard let contents1 = readFileContents(fileName: file1) else {
        print("Failed to read contents of file \(file1)")
        return
    }
    
    // Read contents of the second file
    guard let contents2 = readFileContents(fileName: file2) else {
        print("Failed to read contents of file \(file2)")
        return
    }
    
    // Combine the contents of both files
    let mergedContents = contents1 + "\n" + contents2
    
    // Write the merged contents to the output file
    writeFileContents(fileName: outputFile, contents: mergedContents)
}

// Main function to execute the file merging process
func main() {
    // Define the input and output file names
    let inputFile1 = "file1.txt"
    let inputFile2 = "file2.txt"
    let outputFile = "merged_output.txt"
    
    // Call the mergeFiles function to merge the contents of the input files
    mergeFiles(file1: inputFile1, file2: inputFile2, outputFile: outputFile)
}

// Call the main function to start the program
main()

