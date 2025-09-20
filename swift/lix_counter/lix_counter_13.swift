// Lix Counter Program
// This program is designed to count the number of words, long words, and sentences in a given text.
// It then calculates the Lix readability index based on these counts.
// The Lix readability index is a measure of how difficult a text is to read.

import Foundation

// Global variables to store counts
var wordCount = 0
var longWordCount = 0
var sentenceCount = 0

// Function to count words in a text
func countWords(in text: String) {
    let words = text.split { !$0.isLetter }
    wordCount = words.count
    longWordCount = words.filter { $0.count > 6 }.count
}

// Function to count sentences in a text
func countSentences(in text: String) {
    let sentences = text.split { ".!?".contains($0) }
    sentenceCount = sentences.count
}

// Function to calculate the Lix readability index
func calculateLix() -> Double {
    guard wordCount > 0 else { return 0.0 }
    return Double(wordCount) / Double(sentenceCount) + (Double(longWordCount) * 100.0 / Double(wordCount))
}

// Main function to process the text and calculate Lix
func main() {
    let text = """
    This is a sample text. It contains several sentences. Some of the words are long, and some are short.
    The purpose of this text is to provide a sample for the Lix readability index calculation.
    """
    
    countWords(in: text)
    countSentences(in: text)
    
    let lix = calculateLix()
    print("Lix readability index: \(lix)")
}

// Call the main function to execute the program
main()

