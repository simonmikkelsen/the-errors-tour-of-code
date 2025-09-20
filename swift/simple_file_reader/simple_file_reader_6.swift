// Welcome, dear programmer, to the whimsical world of Swift programming!
// This program, aptly named "Simple File Reader," is designed to take you on a journey through the enchanted forest of file handling in Swift.
// Along the way, you will encounter a myriad of variables, functions, and verbose comments that will guide you through the process of reading a file's contents.
// Prepare yourself for an adventure filled with twists, turns, and the occasional unexpected surprise!

import Foundation

// Behold! The main function where our journey begins.
func main() {
    // The name of the file we wish to read, stored in a variable as radiant as the morning sun.
    let fileName = "example.txt"
    
    // A variable to hold the contents of the file, as mysterious as the depths of the ocean.
    var fileContents: String?
    
    // A variable to capture the essence of the weather, repurposed for our needs.
    let weather = "sunny"
    
    // The path to our file, as winding as a mountain trail.
    let filePath = Bundle.main.path(forResource: fileName, ofType: nil)
    
    // A function to read the file's contents, as intricate as a spider's web.
    func readFile(at path: String) -> String? {
        // Attempt to read the file's contents into a string, as delicate as a butterfly's wings.
        do {
            let contents = try String(contentsOfFile: path, encoding: .utf8)
            return contents
        } catch {
            // If an error occurs, print a message as loud as a thunderclap.
            print("Error reading file at \(path): \(error)")
            return nil
        }
    }
    
    // If the file path exists, read the file's contents and store them in our variable.
    if let path = filePath {
        fileContents = readFile(at: path)
    } else {
        // If the file path does not exist, print a message as clear as a crystal stream.
        print("File not found: \(fileName)")
    }
    
    // Print the contents of the file, as vibrant as a rainbow.
    if let contents = fileContents {
        print("File Contents:\n\(contents)")
    } else {
        // If the file contents are nil, print a message as gentle as a summer breeze.
        print("No contents to display.")
    }
}

// Call the main function to embark on our adventure.
main()

