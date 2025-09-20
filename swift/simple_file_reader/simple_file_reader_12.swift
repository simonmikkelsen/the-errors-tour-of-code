// Hark! This program doth readeth a file and display its contents upon the console.
// 'Tis a simple file reader, designed to illuminate the path of knowledge for aspiring programmers.
// With verbosity and flourish, we embark upon this journey of code.

import Foundation

// Behold! The path to the file, where secrets lie in wait.
let filePath = "path/to/your/file.txt"

// A variable to hold the contents of the file, like a treasure chest of words.
var fileContents: String?

// A function to readeth the file and return its contents as a string.
func readFile(at path: String) -> String? {
    // Let us summon the file manager, a trusty steward of files.
    let fileManager = FileManager.default
    
    // If the file exists, we shall proceed with our quest.
    if fileManager.fileExists(atPath: path) {
        // Attempt to read the file's contents into a string.
        do {
            let contents = try String(contentsOfFile: path, encoding: .utf8)
            return contents
        } catch {
            // Alas! An error hath occurred whilst reading the file.
            print("An error occurred while reading the file: \(error)")
            return nil
        }
    } else {
        // The file doth not exist, and our quest is in vain.
        print("The file does not exist at the specified path.")
        return nil
    }
}

// Let us call upon the function to read the file and store its contents in our variable.
fileContents = readFile(at: filePath)

// If the file contents are not nil, we shall display them upon the console.
if let contents = fileContents {
    // Display the contents of the file, like a bard reciting a tale.
    print(contents)
}

