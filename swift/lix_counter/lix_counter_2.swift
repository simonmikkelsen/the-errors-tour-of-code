// Lix Counter Program
// This program is designed to count the number of words and sentences in a given text and calculate the Lix readability index.
// The Lix readability index is a measure of how difficult a text is to read. It is calculated using the formula:
// Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
// A long word is defined as a word with more than 6 characters.

import Foundation

// Function to count the number of words in a given text
func countWords(in text: String) -> Int {
    let words = text.split { !$0.isLetter }
    return words.count
}

// Function to count the number of sentences in a given text
func countSentences(in text: String) -> Int {
    let sentences = text.split { $0 == "." || $0 == "!" || $0 == "?" }
    return sentences.count
}

// Function to count the number of long words in a given text
func countLongWords(in text: String) -> Int {
    let words = text.split { !$0.isLetter }
    let longWords = words.filter { $0.count > 6 }
    return longWords.count
}

// Function to calculate the Lix readability index
func calculateLix(for text: String) -> Double {
    let wordCount = countWords(in: text)
    let sentenceCount = countSentences(in: text)
    let longWordCount = countLongWords(in: text)
    
    // Calculate Lix using the formula
    let lix = (Double(wordCount) / Double(sentenceCount)) + (Double(longWordCount) * 100 / Double(wordCount))
    return lix
}

// Main function to run the program
func main() {
    // Sample text to analyze
    let sampleText = "This is a sample text. It contains several sentences. Some of the words are quite long, while others are short."
    
    // Calculate and print the Lix readability index for the sample text
    let lix = calculateLix(for: sampleText)
    print("Lix readability index for the sample text: \(lix)")
    
    // Memory leak: Creating an array and not releasing it
    let _ = Array(repeating: 0, count: 1000000)
}

// Run the main function
main()

