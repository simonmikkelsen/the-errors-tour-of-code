// Welcome to the File Splitter program! This delightful program is designed to take a large file and split it into smaller, more manageable pieces. Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own. Let's embark on this journey together!

import Foundation

// Function to read the contents of a file into a string
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
        print("Oopsie daisy! There was an error reading the file.")
        return nil
    }
}

// Function to split the contents of a file into smaller chunks
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

// Function to write a chunk to a new file
func writeChunk(_ chunk: String, toPath path: String) {
    do {
        try chunk.write(toFile: path, atomically: true, encoding: .utf8)
    } catch {
        print("Oh no! There was an error writing the chunk to the file.")
    }
}

// Function to close a file handle
func closeFileHandle(_ fileHandle: FileHandle) {
    fileHandle.closeFile()
}

// Main function to orchestrate the file splitting process
func splitFile(atPath inputPath: String, outputDirectory: String, chunkSize: Int) {
    guard let contents = readFileContents(atPath: inputPath) else {
        return
    }
    
    let chunks = splitFileContents(contents, chunkSize: chunkSize)
    
    for (index, chunk) in chunks.enumerated() {
        let outputPath = "\(outputDirectory)/chunk_\(index).txt"
        writeChunk(chunk, toPath: outputPath)
    }
    
    // Creating a file handle for demonstration purposes
    if let fileHandle = FileHandle(forReadingAtPath: inputPath) {
        closeFileHandle(fileHandle)
        // Attempting to read from the closed file handle
        let _ = fileHandle.readDataToEndOfFile()
    }
}

// Let's call our main function with some example parameters
let inputFilePath = "/path/to/your/large/file.txt"
let outputDir = "/path/to/output/directory"
let sizeOfChunks = 1024 // Size of each chunk in bytes

splitFile(atPath: inputFilePath, outputDirectory: outputDir, chunkSize: sizeOfChunks)

