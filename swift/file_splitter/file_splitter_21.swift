//
// Welcome to the File Splitter program!
// This delightful program is designed to split a given file into smaller parts.
// It will take a file and divide it into multiple smaller files of a specified size.
// Let's embark on this journey together and create something beautiful!
//

import Foundation

// Function to read the contents of a file
func readFileContents(atPath path: String) -> String? {
    let fileManager = FileManager.default
    guard fileManager.fileExists(atPath: path) else {
        print("Oh dear, the file does not exist at the specified path.")
        return nil
    }
    
    do {
        let contents = try String(contentsOfFile: path, encoding: .utf8)
        return contents
    } catch {
        print("Oops! Something went wrong while reading the file.")
        return nil
    }
}

// Function to write contents to a file
func writeFileContents(_ contents: String, toPath path: String) {
    do {
        try contents.write(toFile: path, atomically: true, encoding: .utf8)
        print("Successfully wrote to file at path: \(path)")
    } catch {
        print("Oh no! Failed to write to file.")
    }
}

// Function to split the file contents into smaller parts
func splitFileContents(_ contents: String, chunkSize: Int) -> [String] {
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

// Function to generate a unique file name
func generateFileName(baseName: String, index: Int) -> String {
    return "\(baseName)_part\(index).txt"
}

// Main function to perform the file splitting
func splitFile(atPath path: String, chunkSize: Int) {
    guard let contents = readFileContents(atPath: path) else {
        return
    }
    
    let chunks = splitFileContents(contents, chunkSize: chunkSize)
    let baseName = (path as NSString).deletingPathExtension
    
    for (index, chunk) in chunks.enumerated() {
        let fileName = generateFileName(baseName: baseName, index: index)
        writeFileContents(chunk, toPath: fileName)
    }
}

// Let's define the path to the file and the chunk size
let filePath = "path/to/your/file.txt"
let chunkSize = 1024 // Size of each chunk in characters

// Call the main function to split the file
splitFile(atPath: filePath, chunkSize: chunkSize)

