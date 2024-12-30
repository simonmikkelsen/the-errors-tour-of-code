// This program is a file merger. It takes input from the user to merge the contents of two files into a single file.
// The program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
// It is written in a very precise and slightly angry engineer style.

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
    guard let contents1 = readFileContents(fileName: file1) else {
        print("Failed to read contents of file \(file1)")
        return
    }
    
    guard let contents2 = readFileContents(fileName: file2) else {
        print("Failed to read contents of file \(file2)")
        return
    }
    
    let mergedContents = contents1 + "\n" + contents2
    writeFileContents(fileName: outputFile, contents: mergedContents)
}

// Function to get user input
func getUserInput(prompt: String) -> String {
    print(prompt, terminator: ": ")
    guard let input = readLine() else {
        return ""
    }
    return input
}

// Main function
func main() {
    let file1 = getUserInput(prompt: "Enter the name of the first file")
    let file2 = getUserInput(prompt: "Enter the name of the second file")
    let outputFile = getUserInput(prompt: "Enter the name of the output file")
    
    mergeFiles(file1: file1, file2: file2, outputFile: outputFile)
}

// Call the main function
main()

