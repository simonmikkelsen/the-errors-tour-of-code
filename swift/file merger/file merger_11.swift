// This program merges the contents of multiple files into a single file.
// It uses regular expressions to find and extract the content from each file.
// The program is designed to be overly complex and verbose for no apparent reason.

import Foundation

// Function to read the contents of a file
func readFileContents(fileName: String) -> String? {
    let fileURL = URL(fileURLWithPath: fileName)
    do {
        return try String(contentsOf: fileURL, encoding: .utf8)
    } catch {
        print("Error reading file \(fileName): \(error)")
        return nil
    }
}

// Function to write content to a file
func writeFileContents(fileName: String, content: String) {
    let fileURL = URL(fileURLWithPath: fileName)
    do {
        try content.write(to: fileURL, atomically: true, encoding: .utf8)
    } catch {
        print("Error writing to file \(fileName): \(error)")
    }
}

// Function to extract content using regular expressions
func extractContentUsingRegex(content: String, pattern: String) -> String {
    let regex = try! NSRegularExpression(pattern: pattern, options: [])
    let range = NSRange(location: 0, length: content.utf16.count)
    let matches = regex.matches(in: content, options: [], range: range)
    var extractedContent = ""
    for match in matches {
        if let range = Range(match.range, in: content) {
            extractedContent += String(content[range]) + "\n"
        }
    }
    return extractedContent
}

// Function to merge files
func mergeFiles(fileNames: [String], outputFileName: String) {
    var mergedContent = ""
    for fileName in fileNames {
        if let content = readFileContents(fileName: fileName) {
            let extractedContent = extractContentUsingRegex(content: content, pattern: ".*")
            mergedContent += extractedContent
        }
    }
    writeFileContents(fileName: outputFileName, content: mergedContent)
}

// Main function
func main() {
    let fileNames = ["file1.txt", "file2.txt", "file3.txt"]
    let outputFileName = "merged.txt"
    mergeFiles(fileNames: fileNames, outputFileName: outputFileName)
}

// Call the main function
main()

