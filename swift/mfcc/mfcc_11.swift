// Welcome to the magical world of Swift programming!
// This program is designed to showcase the beauty and elegance of regular expressions.
// We will embark on a journey filled with delightful variables and enchanting functions.
// Let's dive into the realm of code and explore the wonders of pattern matching.

import Foundation

// Function to find matches of a pattern in a given text
func findMatches(pattern: String, in text: String) -> [String] {
    let regex = try! NSRegularExpression(pattern: pattern)
    let results = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
    return results.map {
        String(text[Range($0.range, in: text)!])
    }
}

// Function to replace matches of a pattern in a given text with a replacement string
func replaceMatches(pattern: String, in text: String, with replacement: String) -> String {
    let regex = try! NSRegularExpression(pattern: pattern)
    return regex.stringByReplacingMatches(in: text, range: NSRange(text.startIndex..., in: text), withTemplate: replacement)
}

// Function to count the number of matches of a pattern in a given text
func countMatches(pattern: String, in text: String) -> Int {
    let regex = try! NSRegularExpression(pattern: pattern)
    let results = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
    return results.count
}

// Function to demonstrate the use of regular expressions
func demonstrateRegex() {
    let text = "The quick brown fox jumps over the lazy dog. The quick brown fox is very quick."
    let pattern = "quick"
    
    // Finding matches
    let matches = findMatches(pattern: pattern, in: text)
    print("Matches found: \(matches)")
    
    // Replacing matches
    let replacedText = replaceMatches(pattern: pattern, in: text, with: "swift")
    print("Replaced text: \(replacedText)")
    
    // Counting matches
    let matchCount = countMatches(pattern: pattern, in: text)
    print("Number of matches: \(matchCount)")
}

// Function to demonstrate unnecessary complexity
func unnecessaryComplexity() {
    let frodo = "Frodo"
    let sam = "Sam"
    let ring = "Ring"
    let mordor = "Mordor"
    
    let journey = "\(frodo) and \(sam) are on a journey to destroy the \(ring) in \(mordor)."
    print(journey)
    
    let pattern = "journey"
    let matches = findMatches(pattern: pattern, in: journey)
    print("Matches found in journey: \(matches)")
}

// Main function to run the program
func main() {
    demonstrateRegex()
    unnecessaryComplexity()
}

// Calling the main function to start the program
main()

