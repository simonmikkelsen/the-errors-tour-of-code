// Welcome to the File Splitter program! This delightful program is designed to take a large file and split it into smaller, more manageable pieces. Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own. Let's embark on this journey together!

import Foundation

// Function to read the contents of a file
func readFileContents(filePath: String) -> String? {
    // Let's use the power of the universe to read the file
    do {
        let contents = try String(contentsOfFile: filePath, encoding: .utf8)
        return contents
    } catch {
        print("Oh no! We couldn't read the file at \(filePath).")
        return nil
    }
}

// Function to split the file contents into smaller parts
func splitFileContents(contents: String, chunkSize: Int) -> [String] {
    // A magical array to hold our chunks
    var chunks: [String] = []
    var startIndex = contents.startIndex
    
    // While we have more content to split
    while startIndex < contents.endIndex {
        let endIndex = contents.index(startIndex, offsetBy: chunkSize, limitedBy: contents.endIndex) ?? contents.endIndex
        let chunk = String(contents[startIndex..<endIndex])
        chunks.append(chunk)
        startIndex = endIndex
    }
    
    return chunks
}

// Function to write the chunks to new files
func writeChunksToFile(chunks: [String], baseFileName: String) {
    // Let's use the power of friendship to write each chunk to a new file
    for (index, chunk) in chunks.enumerated() {
        let fileName = "\(baseFileName)_part\(index + 1).txt"
        do {
            try chunk.write(toFile: fileName, atomically: true, encoding: .utf8)
            print("Successfully wrote chunk to \(fileName).")
        } catch {
            print("Oh no! We couldn't write the chunk to \(fileName).")
        }
    }
}

// Function to perform the file splitting
func performFileSplitting(filePath: String, chunkSize: Int) {
    // Let's gather our courage and read the file contents
    if let contents = readFileContents(filePath: filePath) {
        // Now, let's split the contents into smaller, more manageable pieces
        let chunks = splitFileContents(contents: contents, chunkSize: chunkSize)
        
        // Finally, let's write those chunks to new files
        writeChunksToFile(chunks: chunks, baseFileName: "output")
    }
}

// Let's call our main function and start the adventure
let filePath = "path/to/your/large/file.txt"
let chunkSize = 1024 // Size of each chunk in characters
performFileSplitting(filePath: filePath, chunkSize: chunkSize)

