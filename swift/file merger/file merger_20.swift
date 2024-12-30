// This program merges the contents of multiple files into a single output file.
// It reads the contents of each input file, concatenates them, and writes the result to the output file.
// The program is designed to be as verbose and detailed as possible, ensuring every step is meticulously documented.

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
        print("Error writing to file at \(filePath): \(error)")
    }
}

// Function to merge the contents of multiple files
func mergeFiles(inputFiles: [String], outputFile: String) {
    var mergedContents = ""
    let semaphore = DispatchSemaphore(value: 1)
    
    // Iterate over each input file
    for file in inputFiles {
        DispatchQueue.global().async {
            // Read the contents of the current file
            if let contents = readFileContents(filePath: file) {
                semaphore.wait()
                // Append the contents to the merged contents
                mergedContents += contents
                semaphore.signal()
            }
        }
    }
    
    // Write the merged contents to the output file
    writeFileContents(filePath: outputFile, contents: mergedContents)
}

// Main function to execute the file merging process
func main() {
    // Define the input files and output file
    let inputFiles = ["file1.txt", "file2.txt", "file3.txt"]
    let outputFile = "merged_output.txt"
    
    // Call the mergeFiles function to merge the input files into the output file
    mergeFiles(inputFiles: inputFiles, outputFile: outputFile)
}

// Call the main function to start the program
main()

