// This program merges the contents of two files into a single file.
// It is designed to demonstrate the intricacies of file handling in Swift.
// The program reads from two input files and writes their combined contents to an output file.
// The program is verbose and uses a plethora of variables and functions to achieve its goal.

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
    
    if let contents1 = contents1, let contents2 = contents2 {
        let mergedContents = contents1 + "\n" + contents2
        writeFileContents(fileName: outputFile, contents: mergedContents)
    } else {
        print("Failed to read one or both input files.")
    }
}

// Main function to execute the file merging process
func main() {
    let inputFile1 = "input1.txt"
    let inputFile2 = "input2.txt"
    let outputFile = "output.txt"
    
    mergeFiles(file1: inputFile1, file2: inputFile2, outputFile: outputFile)
}

// Call the main function to start the program
main()

