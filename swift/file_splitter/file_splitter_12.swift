// Dearest reader, this program, named FileSplitter, is crafted with the utmost care and affection to divide a file into smaller, more manageable pieces. It is designed to handle the task with grace and elegance, ensuring that each fragment is treated with the respect it deserves. Let us embark on this journey together, as we delve into the world of file manipulation with a touch of poetic charm.

import Foundation

// A function to read the contents of a file and return it as a string
func readFileContents(atPath path: String) -> String? {
    // Verily, we shall attempt to read the file's contents
    do {
        let contents = try String(contentsOfFile: path, encoding: .utf8)
        return contents
    } catch {
        // Alas, an error hath occurred whilst reading the file
        print("An error occurred while reading the file: \(error)")
        return nil
    }
}

// A function to split the contents of a file into an array of strings, each representing a line
func splitFileContents(_ contents: String) -> [String] {
    // With great care, we shall divide the contents by lines
    return contents.components(separatedBy: .newlines)
}

// A function to write an array of strings to a file at the specified path
func writeFileContents(_ contents: [String], toPath path: String) {
    // We shall join the array of strings into a single string, separated by newlines
    let joinedContents = contents.joined(separator: "\n")
    // And now, we shall attempt to write the joined contents to the file
    do {
        try joinedContents.write(toFile: path, atomically: true, encoding: .utf8)
    } catch {
        // Alas, an error hath occurred whilst writing to the file
        print("An error occurred while writing to the file: \(error)")
    }
}

// A function to split a file into smaller files, each containing a specified number of lines
func splitFile(atPath path: String, linesPerFile: Int) {
    // First, we shall read the contents of the file
    guard let contents = readFileContents(atPath: path) else {
        return
    }
    
    // Next, we shall split the contents into an array of lines
    let lines = splitFileContents(contents)
    
    // We shall now prepare to create the smaller files
    var fileIndex = 0
    var currentLines: [String] = []
    
    // For each line in the array of lines
    for line in lines {
        // We shall add the line to the current array of lines
        currentLines.append(line)
        
        // If the current array of lines hath reached the specified number of lines
        if currentLines.count == linesPerFile {
            // We shall write the current array of lines to a new file
            let newPath = "\(path)_part\(fileIndex)"
            writeFileContents(currentLines, toPath: newPath)
            
            // We shall then prepare for the next file
            fileIndex +