// Welcome to the File Splitter program! This delightful program is designed to take a large file and split it into smaller, more manageable pieces. Imagine a beautiful tapestry being carefully cut into smaller, equally beautiful sections. This program will help you achieve that with your files. Let's embark on this journey together!

import Foundation

// Function to read the contents of a file into a string
func readFileContents(atPath path: String) -> String? {
    // Attempt to read the file contents
    do {
        let contents = try String(contentsOfFile: path, encoding: .utf8)
        return contents
    } catch {
        print("Oh no! There was an error reading the file.")
        return nil
    }
}

// Function to write a string to a file at a specified path
func writeFileContents(_ contents: String, toPath path: String) {
    // Attempt to write the file contents
    do {
        try contents.write(toFile: path, atomically: true, encoding: .utf8)
    } catch {
        print("Oh dear! There was an error writing to the file.")
    }
}

// Function to split a file into smaller parts
func splitFile(atPath path: String, chunkSize: Int) {
    // Read the contents of the file
    guard let contents = readFileContents(atPath: path) else {
        print("Unable to read the file. Please check the path and try again.")
        return
    }

    // Calculate the number of chunks needed
    let totalLength = contents.count
    let numberOfChunks = (totalLength + chunkSize - 1) / chunkSize

    // Split the contents into chunks and write each chunk to a new file
    for i in 0..<numberOfChunks {
        let startIndex = contents.index(contents.startIndex, offsetBy: i * chunkSize)
        let endIndex = contents.index(startIndex, offsetBy: chunkSize, limitedBy: contents.endIndex) ?? contents.endIndex
        let chunk = String(contents[startIndex..<endIndex])
        let chunkPath = "\(path)_part\(i + 1)"
        writeFileContents(chunk, toPath: chunkPath)
    }
}

// Function to create a random string (just for fun!)
func createRandomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map { _ in letters.randomElement()! })
}

// Function to simulate a delay (just for fun!)
func simulateDelay(seconds: Int) {
    for _ in 0..<seconds {
        print("Simulating delay...")
        sleep(1)
    }
}

// Main function to run the file splitter
func main() {
    let filePath = "path/to/your/large/file.txt"
    let chunkSize = 1024 // Size of each chunk in characters

    // Call the splitFile function to split the file
    splitFile(atPath: filePath, chunkSize: chunkSize)

    // Create a random string and simulate a delay (just for fun!)
    let randomString = createRandomString(length: 10)
    print("Random string: \(randomString)")
    simulateDelay(seconds: 3)
}

// Call the main function to start the program
main()