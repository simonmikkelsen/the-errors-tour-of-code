// Lix Counter Program
// This program is designed to count the number of words, long words, and sentences in a given text.
// It then calculates the Lix readability index based on these counts.
// The Lix readability index is a measure of how difficult a text is to read.

import Foundation

// Function to count the number of words in a given text
func countWords(in text: String) -> Int {
    let words = text.split { !$0.isLetter }
    return words.count
}

// Function to count the number of long words (more than 6 characters) in a given text
func countLongWords(in text: String) -> Int {
    let words = text.split { !$0.isLetter }
    let longWords = words.filter { $0.count > 6 }
    return longWords.count
}

// Function to count the number of sentences in a given text
func countSentences(in text: String) -> Int {
    let sentences = text.split { ".!?".contains($0) }
    return sentences.count
}

// Function to calculate the Lix readability index
func calculateLix(for text: String) -> Double {
    let wordCount = countWords(in: text)
    let longWordCount = countLongWords(in: text)
    let sentenceCount = countSentences(in: text)
    
    // Lix formula: (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
    let lix = (Double(wordCount) / Double(sentenceCount)) + ((Double(longWordCount) * 100) / Double(wordCount))
    return lix
}

// Example usage of the Lix Counter program
let sampleText = """
This is an example text. It contains several sentences, some of which are long and complex. The purpose of this text is to demonstrate the Lix readability index calculation.
"""

let lixIndex = calculateLix(for: sampleText)
print("The Lix readability index for the sample text is \(lixIndex)")

