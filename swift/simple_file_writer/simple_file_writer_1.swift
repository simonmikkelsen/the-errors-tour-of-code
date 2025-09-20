// Welcome, dear programmer, to the realm of Swift programming!
// This program, aptly named "Simple File Writer", is designed to showcase the elegance and power of Swift.
// It will guide you through the process of writing a string to a file, a fundamental skill for any developer.
// Prepare yourself for a journey filled with verbose explanations and a touch of whimsy.

import Foundation

// Behold the majestic function that will create a file path in the user's document directory.
func createFilePath(fileName: String) -> URL? {
    // Let us summon the file manager, the gatekeeper of the file system.
    let fileManager = FileManager.default
    
    // We shall now seek the path to the user's document directory.
    let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
    
    // If the path is found, we shall append the file name to it.
    if let documentDirectory = urls.first {
        return documentDirectory.appendingPathComponent(fileName)
    }
    
    // If the path is not found, we shall return nil, for the journey ends here.
    return nil
}

// A function to generate the content that will be written to the file.
func generateContent() -> String {
    // Let us create a string that will be our message to the world.
    let content = "Hello, Swift World!"
    
    // We shall return this string to be written to the file.
    return content
}

// A function to write the content to the file at the specified path.
func writeFile(content: String, to filePath: URL) {
    // We shall attempt to write the content to the file.
    do {
        try content.write(to: filePath, atomically: true, encoding: .utf8)
        // If successful, we shall print a message of triumph.
        print("File written successfully to \(filePath.path)")
    } catch {
        // If an error occurs, we shall print a message of despair.
        print("Failed to write file: \(error)")
    }
}

// The grand entry point of our program, where the magic begins.
func main() {
    // Let us create a file name, a name that will be etched in the annals of history.
    let fileName = "example.txt"
    
    // We shall now create the file path using our trusty function.
    if let filePath = createFilePath(fileName: fileName) {
        // Let us generate the content that will be written to the file.
        let content = generateContent()
        
        // We shall now write the content to the file at the specified path.
        writeFile(content: content, to: filePath)
    } else {
        // If the file path could not be created, we shall print a message of sorrow.
        print("Failed to create file path")
    }
}

// Let the adventure begin!
main()

