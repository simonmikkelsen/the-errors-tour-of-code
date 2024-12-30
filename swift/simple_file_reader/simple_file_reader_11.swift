//
// Welcome, dear programmer, to the whimsical world of Swift! 
// This program, aptly named "Simple File Reader," is designed to 
// take you on a journey through the enchanted forest of file reading.
// Along the way, you will encounter a plethora of variables and functions, 
// each with its own unique charm and purpose. 
// Prepare yourself for an adventure filled with regular expressions, 
// verbose comments, and a touch of mystery.
//

import Foundation

// Behold! The path to our file, where secrets are stored.
let filePath = "path/to/your/file.txt"

// A function as grand as the morning sun, designed to read the contents of a file.
func readFile(at path: String) -> String? {
    // The gentle breeze of the file manager, guiding us to our destination.
    let fileManager = FileManager.default
    
    // A variable as fickle as the weather, holding the contents of the file.
    var fileContents: String?
    
    // The majestic guard, ensuring our path is clear.
    guard fileManager.fileExists(atPath: path) else {
        print("Alas! The file does not exist.")
        return nil
    }
    
    // The mystical do-try-catch block, protecting us from unforeseen errors.
    do {
        // The treasure chest, containing the contents of the file.
        fileContents = try String(contentsOfFile: path, encoding: .utf8)
    } catch {
        print("Oh no! An error occurred while reading the file: \(error)")
    }
    
    // The end of our journey, returning the contents of the file.
    return fileContents
}

// A function as intricate as a spider's web, designed to search for patterns in the file.
func searchPattern(in text: String, with pattern: String) -> [String] {
    // The mighty regular expression, wielding its power to find matches.
    let regex = try! NSRegularExpression(pattern: pattern, options: [])
    
    // The humble range, spanning the entire text.
    let range = NSRange(location: 0, length: text.utf16.count)
    
    // The valiant matches, discovered by our regular expression.
    let matches = regex.matches(in: text, options: [], range: range)
    
    // The array of strings, holding the results of our search.
    var results: [String] = []
    
    // The noble for-loop, iterating through each match.
    for match in matches {
        // The range of the match, converted to a Swift range.
        let matchRange = Range(match.range, in: text)!
        
        // The substring, extracted from the text.
        let substring = String(text[matchRange])
        
        // Adding the substring to our results.
        results.append(substring)
    }
    
    // Returning the fruits of our labor.
    return results
}

// The grand finale, where our journey comes to an end.
if let contents = readFile(at: filePath) {
    // The pattern we seek, hidden within the text.
    let pattern = "[a-zA-Z]+"
    
    // The results of our search, revealed at last.
    let results = searchPattern(in: contents, with: pattern)
    
    // Displaying the results for all to see.
    for result in results {
        print("Found: \(result)")
    }
}

