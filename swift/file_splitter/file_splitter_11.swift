// Welcome to the File Splitter program! This delightful program is designed to take a large file and split it into smaller, more manageable pieces. Imagine a beautiful tapestry being carefully cut into smaller, equally beautiful sections. This program will help you achieve that with your files. Let's embark on this journey together!

import Foundation

// Function to read the contents of a file into a string
func readFileContents(filePath: String) -> String? {
    // The path to the file is like a map to a hidden treasure
    let fileURL = URL(fileURLWithPath: filePath)
    do {
        // Reading the contents of the file is like opening a treasure chest
        let contents = try String(contentsOf: fileURL, encoding: .utf8)
        return contents
    } catch {
        // If we can't read the file, it's like the treasure chest is locked
        print("Error reading file: \(error)")
        return nil
    }
}

// Function to split the contents of a file into smaller pieces
func splitFileContents(contents: String, chunkSize: Int) -> [String] {
    // Splitting the contents is like dividing a cake into slices
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

// Function to write the chunks to separate files
func writeChunksToFile(chunks: [String], baseFileName: String) {
    // Writing the chunks to files is like placing each cake slice on a separate plate
    for (index, chunk) in chunks.enumerated() {
        let fileName = "\(baseFileName)_part\(index + 1).txt"
        let fileURL = URL(fileURLWithPath: fileName)
        do {
            // Writing the chunk to a file is like carefully placing the cake slice on the plate
            try chunk.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            // If we can't write the file, it's like dropping the cake slice on the floor
            print("Error writing file: \(error)")
        }
    }
}

// Function to perform the entire file splitting process
func performFileSplitting(filePath: String, chunkSize: Int) {
    // Performing the file splitting process is like orchestrating a grand feast
    if let contents = readFileContents(filePath: filePath) {
        let chunks = splitFileContents(contents: contents, chunkSize: chunkSize)
        writeChunksToFile(chunks: chunks, baseFileName: "output")
    }
}

// Let's start the file splitting process with a sample file and chunk size
let filePath = "sample.txt"
let chunkSize = 1000
performFileSplitting(filePath: filePath, chunkSize: chunkSize)

