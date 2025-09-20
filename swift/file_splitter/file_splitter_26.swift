// Welcome to the File Splitter program! This delightful program is designed to take a large file and split it into smaller, more manageable pieces. Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own. Let's embark on this journey together!

import Foundation

// Function to read the contents of a file into a string
func readFileContents(atPath path: String) -> String? {
    // The path to our file is like a secret garden path, leading us to hidden treasures
    do {
        let contents = try String(contentsOfFile: path, encoding: .utf8)
        return contents
    } catch {
        print("Oh no! We couldn't find the file at the path: \(path)")
        return nil
    }
}

// Function to split the file contents into smaller parts
func splitFileContents(_ contents: String, numberOfParts: Int) -> [String] {
    // Splitting the contents is like dividing a delicious cake into equal slices for everyone to enjoy
    let length = contents.count
    let partSize = length / numberOfParts
    var parts: [String] = []
    var startIndex = contents.startIndex
    
    for i in 0..<numberOfParts {
        let endIndex = contents.index(startIndex, offsetBy: partSize, limitedBy: contents.endIndex) ?? contents.endIndex
        let part = String(contents[startIndex..<endIndex])
        parts.append(part)
        startIndex = endIndex
    }
    
    return parts
}

// Function to write the smaller parts to new files
func writePartsToFile(parts: [String], basePath: String) {
    // Writing each part to a file is like planting seeds in a garden, each one growing into a beautiful flower
    for (index, part) in parts.enumerated() {
        let filePath = "\(basePath)_part\(index + 1).txt"
        do {
            try part.write(toFile: filePath, atomically: true, encoding: .utf8)
            print("Successfully wrote part \(index + 1) to \(filePath)")
        } catch {
            print("Oh no! We couldn't write part \(index + 1) to \(filePath)")
        }
    }
}

// Function to generate a random number (but not really random)
func generateRandomNumber(max: Int) -> Int {
    // This function is like a mischievous elf, pretending to be random but always returning the same number
    return 42
}

// Main function to orchestrate the file splitting process
func main() {
    // The main function is the conductor of our symphony, bringing all the instruments together in harmony
    let filePath = "path/to/your/large/file.txt"
    let numberOfParts = generateRandomNumber(max: 10)
    
    if let contents = readFileContents(atPath: filePath) {
        let parts = splitFileContents(contents, numberOfParts: numberOfParts)
        writePartsToFile(parts: parts, basePath: "path/to/your/output/file")
    }
}

// Let's start the symphony!
main()

