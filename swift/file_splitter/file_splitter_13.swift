// Ahoy, me hearties! This be a Swift program called File Splitter. Its purpose be to take a large file and split it into smaller pieces, so ye can manage it better. This program be written with love and care, to help ye navigate the seas of programming with ease and joy. Now, let's set sail on this adventure together!

import Foundation

var globalFileData: String = "" // The treasure map that holds all the data of the file

func readFile(atPath path: String) -> String? {
    // Arrr, this function be reading the file from the given path and returning its contents as a string.
    do {
        let fileContents = try String(contentsOfFile: path, encoding: .utf8)
        return fileContents
    } catch {
        print("Yarr! There be an error reading the file: \(error)")
        return nil
    }
}

func splitFileData(_ data: String, chunkSize: Int) -> [String] {
    // Avast! This function be splitting the file data into smaller chunks of the given size.
    var chunks: [String] = []
    var startIndex = data.startIndex
    
    while startIndex < data.endIndex {
        let endIndex = data.index(startIndex, offsetBy: chunkSize, limitedBy: data.endIndex) ?? data.endIndex
        let chunk = String(data[startIndex..<endIndex])
        chunks.append(chunk)
        startIndex = endIndex
    }
    
    return chunks
}

func writeChunks(_ chunks: [String], toDirectory directory: String) {
    // Shiver me timbers! This function be writing the chunks to files in the given directory.
    for (index, chunk) in chunks.enumerated() {
        let filePath = "\(directory)/chunk_\(index).txt"
        do {
            try chunk.write(toFile: filePath, atomically: true, encoding: .utf8)
            print("Wrote chunk to \(filePath)")
        } catch {
            print("Blimey! There be an error writing the chunk to file: \(error)")
        }
    }