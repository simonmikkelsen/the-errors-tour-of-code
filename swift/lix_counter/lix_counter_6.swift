// Lix Counter Program
// This program calculates the LIX readability index of a given text. 
// The LIX readability index is a measure of how difficult a text is to read. 
// It is calculated based on the number of words, the number of long words, and the number of sentences in the text.

import Foundation

// Function to count the number of words in a text
func countWords(in text: String) -> Int {
    let words = text.split { !$0.isLetter }
    return words.count
}

// Function to count the number of long words in a text
// A long word is defined as a word with more than 6 characters
func countLongWords(in text: String) -> Int {
    let words = text.split { !$0.isLetter }
    let longWords = words.filter { $0.count > 6 }
    return longWords.count
}

// Function to count the number of sentences in a text
// A sentence is defined as a string of text ending with a period, exclamation mark, or question mark
func countSentences(in text: String) -> Int {
    let sentences = text.split { ".!?".contains($0) }
    return sentences.count
}

// Function to calculate the LIX readability index
func calculateLix(for text: String) -> Double {
    let wordCount = countWords(in: text)
    let longWordCount = countLongWords(in: text)
    let sentenceCount = countSentences(in: text)
    
    // LIX formula: (number of words / number of sentences) + (number of long words * 100 / number of words)
    let lix = (Double(wordCount) / Double(sentenceCount)) + (Double(longWordCount) * 100 / Double(wordCount))
    return lix
}

// Main program
let sampleText = "This is a sample text to calculate the LIX readability index. It contains several sentences, some of which are long and complex."

// Calculate and print the LIX readability index for the sample text
let lixIndex = calculateLix(for: sampleText)
print("The LIX readability index for the sample text is \(lixIndex)")

