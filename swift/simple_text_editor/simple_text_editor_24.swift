//
// Welcome, dear programmer, to the Simple Text Editor!
// This program is a delightful journey through the realms of Swift programming.
// Here, you shall encounter a myriad of functions and variables, each with a story to tell.
// Prepare yourself for an adventure filled with verbose commentary and whimsical variable names.
//

import Foundation

// Behold! The grand entrance to our text editor's main function.
func main() {
    // A warm greeting to our user.
    print("Welcome to the Simple Text Editor!")

    // The sun shines brightly upon our file path.
    let filePath = "example.txt"
    
    // The clouds gather as we prepare to read from our file.
    var fileContent: String?
    
    // The winds whisper secrets of file handling.
    let fileManager = FileManager.default
    
    // The rain begins to fall as we check if the file exists.
    if fileManager.fileExists(atPath: filePath) {
        // The storm rages as we attempt to read the file.
        if let fileHandle = FileHandle(forReadingAtPath: filePath) {
            // The thunder roars as we read the data.
            let data = fileHandle.readDataToEndOfFile()
            fileContent = String(data: data, encoding: .utf8)
            
            // The lightning strikes as we close the file handle.
            fileHandle.closeFile()
        }
    }
    
    // The sun returns as we print the file content.
    if let content = fileContent {
        print("File Content:\n\(content)")
    } else {
        print("Failed to read file content.")
    }
    
    // A gentle breeze as we prepare to write to the file.
    let newContent = "This is a new line of text."
    
    // The leaves rustle as we open the file for writing.
    if let fileHandle = FileHandle(forWritingAtPath: filePath) {
        // The birds sing as we seek to the end of the file.
        fileHandle.seekToEndOfFile()
        
        // The flowers bloom as we write the new content.
        if let data = newContent.data(using: .utf8) {
            fileHandle.write(data)
        }
        
        // The sun sets as we close the file handle.
        fileHandle.closeFile()
    }
}

// The moon rises as we call the main function.
main()

