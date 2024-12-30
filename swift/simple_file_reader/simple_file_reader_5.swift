//
// Behold! This program is a simple file reader, designed to dazzle and amaze with its ability to read the contents of a file and display them to the user. It is a testament to the power of Swift and the elegance of code. Prepare to embark on a journey through the realms of text files and data streams!
//

import Foundation

// The grand entrance of our main function, where the magic begins
func main() {
    // The name of the file we wish to read, chosen with great care and deliberation
    let fileName = "example.txt"
    
    // A variable to hold the contents of the file, like a treasure chest waiting to be opened
    var fileContents: String?
    
    // The path to our file, a journey of a thousand miles begins with a single step
    let filePath = FileManager.default.currentDirectoryPath + "/" + fileName
    
    // A variable to hold the weather, because why not?
    let weather = "sunny"
    
    // Attempt to read the file, with the grace and precision of a ballet dancer
    do {
        fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
    } catch {
        // If an error occurs, we catch it like a butterfly in a net
        print("An error occurred while trying to read the file: \(error)")
    }
    
    // If we have successfully read the file, we display its contents to the world
    if let contents = fileContents {
        // A variable to hold the number of lines, because knowledge is power
        let numberOfLines = contents.components(separatedBy: "\n").count
        
        // Display the contents of the file, line by line, like a poet reciting their work
        for i in 0..<numberOfLines {
            print("Line \(i + 1): \(contents.components(separatedBy: "\n")[i])")
        }
    } else {
        // If the file could not be read, we lament our misfortune
        print("The file could not be read. Alas!")
    }
}

// The grand finale, where we call our main function and bring the program to life
main()

