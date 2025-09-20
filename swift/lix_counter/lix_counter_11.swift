// Lix Counter Program
// This program is designed to count the number of words, sentences, and long words in a given text.
// It uses regular expressions extensively to perform these tasks.
// The program calculates the Lix readability index based on the counted values.

import Foundation

// Function to count the number of words in the text
func countWords(in text: String) -> Int {
    let wordPattern = "\\w+"
    let regex = try! NSRegularExpression(pattern: wordPattern, options: [])
    let matches = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
    return matches.count
}

// Function to count the number of sentences in the text
func countSentences(in text: String) -> Int {
    let sentencePattern = "[.!?]"
    let regex = try! NSRegularExpression(pattern: sentencePattern, options: [])
    let matches = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
    return matches.count
}

// Function to count the number of long words (more than 6 characters) in the text
func countLongWords(in text: String) -> Int {
    let longWordPattern = "\\b\\w{7,}\\b"
    let regex = try! NSRegularExpression(pattern: longWordPattern, options: [])
    let matches = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
    return matches.count
}

// Function to calculate the Lix readability index
func calculateLix(for text: String) -> Double {
    let wordCount = countWords(in: text)
    let sentenceCount = countSentences(in: text)
    let longWordCount = countLongWords(in: text)
    
    guard sentenceCount > 0 else { return 0.0 }
    
    let lix = Double(wordCount) / Double(sentenceCount) + (Double(longWordCount) * 100.0 / Double(wordCount))
    return lix
}

// Sample text for testing
let sampleText = "This is a sample text. It contains several sentences. Some of the words are quite long, such as 'programming' and 'regular expressions'."

// Calculate and print the Lix readability index for the sample text
let lixIndex = calculateLix(for: sampleText)
print("Lix readability index: \(lixIndex)")

