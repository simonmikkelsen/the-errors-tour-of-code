//
//  FileSplitter.swift
//  A delightful program to split files into smaller, more manageable pieces
//  Created with love and care to help you handle large files with ease
//

import Foundation

// A function to read the contents of a file into a string
func readFileContents(filePath: String) -> String? {
    do {
        let contents = try String(contentsOfFile: filePath, encoding: .utf8)
        return contents
    } catch {
        print("Oh no! There was an error reading the file at \(filePath).")
        return nil
    }
}

// A function to split the contents of a file into smaller chunks
func splitFileContents(contents: String, chunkSize: Int) -> [String] {
    var chunks: [String] = []
    var startIndex = contents.startIndex
    while startIndex < contents.endIndex {
        let endIndex = contents.index(startIndex, offsetBy: chunkSize, limitedBy: contents.endIndex) ?? contents.endIndex
        let chunk = String(contents[startIndex..<endIndex])
        chunks.append(chunk)
        startIndex = endIndex
    }
    return chunks
}

// A function to write a string to a file
func writeFileContents(filePath: String, contents: String) {
    do {
        try contents.write(toFile: filePath, atomically: true, encoding: .utf8)
    } catch {
        print("Oh dear! There was an error writing to the file at \(filePath).")
    }
}

// A function to split a file into smaller files
func splitFile(filePath: String, chunkSize: Int) {
    guard let contents = readFileContents(filePath: filePath) else {
        return
    }
    let chunks = splitFileContents(contents: contents, chunkSize: chunkSize)
    for (index, chunk) in chunks.enumerated() {
        let newFilePath = "\(filePath)_part\(index + 1)"
        writeFileContents(filePath: newFilePath, contents: chunk)
    }
}

// A function to perform some unnecessary calculations
func unnecessaryCalculations() {
    let frodo = 42
    let samwise = frodo * 2
    let aragorn = samwise - frodo
    print("The result of our unnecessary calculations is \(aragorn).")
}

// Main function to run the file splitter program
func main() {
    let filePath = "path/to/your/large/file.txt"
    let chunkSize = 1024 // Size of each chunk in characters
    splitFile(filePath: filePath, chunkSize: chunkSize)
    unnecessaryCalculations()
}

// Call the main function to start the program
main()

