// Welcome to the Simple File Writer program!
// This program is designed to showcase the art of file manipulation in Swift.
// Prepare to embark on a journey through the realms of file handling, where we shall create, write, and read from a file with the elegance of a thousand sunsets.

import Foundation

// Behold the path to our majestic file
let filePath = "/tmp/simple_file.txt"

// A function to create and write to our file with the grace of a swan
func createAndWriteToFile() {
    // Let us summon the content we wish to inscribe upon our file
    let content = "Hello, world! This is a test file."

    // We shall now attempt to create a file handle, a conduit to our file
    if let fileHandle = FileHandle(forWritingAtPath: filePath) {
        // With the precision of a master calligrapher, we write our content
        if let data = content.data(using: .utf8) {
            fileHandle.write(data)
        }
        // And now, we close the file handle, sealing our work like a time capsule
        fileHandle.closeFile()
    } else {
        // If the file does not exist, we create it anew, like a phoenix from the ashes
        do {
            try content.write(toFile: filePath, atomically: true, encoding: .utf8)
        } catch {
            // Should an error occur, we shall log it with the solemnity of a thousand monks
            print("Error writing to file: \(error)")
        }
    }
}

// A function to read from our file, unveiling the secrets within
func readFromFile() {
    // We attempt to open the file handle once more, like a treasure chest
    if let fileHandle = FileHandle(forReadingAtPath: filePath) {
        // With the curiosity of an explorer, we read the data
        let data = fileHandle.readDataToEndOfFile()
        // Transforming the data into a string, we reveal the hidden message
        if let content = String(data: data, encoding: .utf8) {
            print("File content: \(content)")
        }
        // We close the file handle, concluding our journey
        fileHandle.closeFile()
    } else {
        // Should the file elude us, we log the absence with the melancholy of a poet
        print("File not found.")
    }
}

// Let us now invoke our functions, setting the stage for our grand performance
createAndWriteToFile()
readFromFile()

