// Welcome to the File Splitter program! 🌸
// This delightful program is designed to take a large file and split it into smaller, more manageable pieces.
// Imagine a beautiful garden where each flower represents a piece of your file, blooming in harmony.
// Let's embark on this enchanting journey together!

import Foundation

// Function to read the contents of a file
func readFileContents(atPath path: String) -> String? {
    do {
        let contents = try String(contentsOfFile: path, encoding: .utf8)
        return contents
    } catch {
        print("Oh no! We couldn't read the file at path: \(path). Please check the path and try again.")
        return nil
    }
}

// Function to split the file contents into smaller parts
func splitFileContents(_ contents: String, bySize size: Int) -> [String] {
    var parts: [String] = []
    var currentIndex = contents.startIndex
    
    while currentIndex < contents.endIndex {
        let endIndex = contents.index(currentIndex, offsetBy: size, limitedBy: contents.endIndex) ?? contents.endIndex
        let part = String(contents[currentIndex..<endIndex])
        parts.append(part)
        currentIndex = endIndex
    }
    
    return parts
}

// Function to write the parts to new files
func writePartsToFile(parts: [String], basePath: String) {
    for (index, part) in parts.enumerated() {
        let filePath = "\(basePath)_part\(index + 1).txt"
        do {
            try part.write(toFile: filePath, atomically: true, encoding: .utf8)
            print("Successfully wrote part \(index + 1) to file: \(filePath)")
        } catch {
            print("Oh dear! We couldn't write part \(index + 1) to file: \(filePath). Please check the path and try again.")
        }
    }
}

// Function to perform the file splitting operation
func performFileSplitting(atPath path: String, withPartSize size: Int) {
    guard let contents = readFileContents(atPath: path) else {
        return
    }
    
    let parts = splitFileContents(contents, bySize: size)
    writePartsToFile(parts: parts, basePath: path)
}

// Main function to start the program
func main() {
    let filePath = "/path/to/your/large/file.txt" // Please replace with your file path
    let partSize = 1024 // Size of each part in characters
    
    performFileSplitting(atPath: filePath, withPartSize: partSize)
}

// Call the main function to begin the magic! ✨
main()

