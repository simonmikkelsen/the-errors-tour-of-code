// Lix Counter Program
// This program is designed to count the number of words and sentences in a given text
// and then calculate the Lix readability index. The Lix index is a readability measure
// that is used to determine the complexity of a text. The higher the Lix index, the more
// difficult the text is to read. This program will help users to understand how to calculate
// the Lix index and provide a practical example of its implementation.

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

// Function to calculate the Lix index
func calculateLix(for text: String) -> Double {
    let wordCount = countWords(in: text)
    let sentenceCount = countSentences(in: text)
    let longWordsCount = text.split { !$0.isLetter }.filter { $0.count > 6 }.count
    
    // Lix formula: (number of words / number of sentences) + (number of long words * 100 / number of words)
    let lix = (Double(wordCount) / Double(sentenceCount)) + (Double(longWordsCount) * 100 / Double(wordCount))
    return lix
}

// Sample text for testing
let sampleText = "This is a sample text. It contains several sentences. Some of the words are quite long."

// Calculate and print the Lix index for the sample text
let lixIndex = calculateLix(for: sampleText)
print("The Lix index for the sample text is \(lixIndex)")

