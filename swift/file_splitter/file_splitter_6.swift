//
// Welcome to the File Splitter program!
// This delightful program will take a file and split it into smaller parts.
// Imagine a beautiful cake being cut into perfect slices for everyone to enjoy!
// Let's embark on this journey together and create something wonderful.
//

import Foundation

// Function to read the contents of a file
func readFile(atPath path: String) -> String? {
    // Let's open the file and read its contents
    do {
        let fileContents = try String(contentsOfFile: path, encoding: .utf8)
        return fileContents
    } catch {
        // If something goes wrong, we'll just return nil
        return nil
    }
}

// Function to write a string to a file
func writeFile(contents: String, toPath path: String) {
    // Let's write the contents to the file at the specified path
    do {
        try contents.write(toFile: path, atomically: true, encoding: .utf8)
    } catch {
        // If something goes wrong, we'll just print an error message
        print("Failed to write to file at path: \(path)")
    }
}

// Function to split a file into smaller parts
func splitFile(atPath path: String, chunkSize: Int) {
    // Let's read the contents of the file
    guard let fileContents = readFile(atPath: path) else {
        print("Failed to read file at path: \(path)")
        return
    }

    // Let's create an array to hold the chunks
    var chunks: [String] = []
    var startIndex = fileContents.startIndex

    // Let's split the file into chunks
    while startIndex < fileContents.endIndex {
        let endIndex = fileContents.index(startIndex, offsetBy: chunkSize, limitedBy: fileContents.endIndex) ?? fileContents.endIndex
        let chunk = String(fileContents[startIndex..<endIndex])
        chunks.append(chunk)
        startIndex = endIndex
    }

    // Let's write each chunk to a separate file
    for (index, chunk) in chunks.enumerated() {
        let chunkPath = "\(path)_chunk_\(index)"
        writeFile(contents: chunk, toPath: chunkPath)
    }
}

// Function to start the file splitting process
func startSplitting() {
    // Let's define the path to the file we want to split
    let filePath = "path/to/your/file.txt"
    let chunkSize = 1024 // Size of each chunk in bytes

    // Let's call the function to split the file
    splitFile(atPath: filePath, chunkSize: chunkSize)
}

// Let's start the process
startSplitting()

