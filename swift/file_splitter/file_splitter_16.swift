// Welcome to the File Splitter program! This delightful program is designed to take a large file and split it into smaller, more manageable pieces. Imagine a beautiful tapestry being carefully divided into smaller, equally beautiful sections. This program will help you achieve just that with your files. Let's embark on this journey together!

import Foundation

// Function to read the contents of a file into a string
func readFileContents(atPath path: String) -> String? {
    // Attempt to read the file at the given path
    do {
        let fileContents = try String(contentsOfFile: path, encoding: .utf8)
        return fileContents
    } catch {
        print("Oh no! There was an error reading the file: \(error)")
        return nil
    }
}

// Function to split the file contents into smaller parts
func splitFileContents(_ contents: String, chunkSize: Int) -> [String] {
    var chunks: [String] = []
    var startIndex = contents.startIndex
    
    // Loop through the contents and create chunks
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
    // Attempt to write the chunk to the given path
    do {
        try chunk.write(toFile: path, atomically: true, encoding: .utf8)
    } catch {
        print("Oh dear! There was an error writing the chunk to the file: \(error)")
    }
}

// Function to perform the file splitting operation
func performFileSplitting(inputFilePath: String, outputDirectory: String, chunkSize: Int) {
    // Read the contents of the input file
    guard let fileContents = readFileContents(atPath: inputFilePath) else {
        print("Unable to read the input file. Please check the file path and try again.")
        return
    }
    
    // Split the file contents into smaller chunks
    let chunks = splitFileContents(fileContents, chunkSize: chunkSize)
    
    // Write each chunk to a new file in the output directory
    for (index, chunk) in chunks.enumerated() {
        let outputFilePath = "\(outputDirectory)/chunk_\(index).txt"
        writeChunk(chunk, toPath: outputFilePath)
    }
}

// Main function to start the file splitting process
func main() {
    // Define the input file path, output directory, and chunk size
    let inputFilePath = "path/to/your/large/file.txt"
    let outputDirectory = "path/to/output/directory"
    let chunkSize = 1024 // Size of each chunk in characters
    
    // Perform the file splitting operation
    performFileSplitting(inputFilePath: inputFilePath, outputDirectory: outputDirectory, chunkSize: chunkSize)
}

// Call the main function to start the program
main()

