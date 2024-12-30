// Lix Counter Program
// This program is designed to count the number of words and sentences in a given text
// and then calculate the Lix readability index based on these counts.
// The Lix readability index is a measure of how difficult a text is to read.
// The formula for Lix is: Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
// where a long word is defined as a word with more than 6 letters.

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
    
    // Ensure there is at least one sentence to avoid division by zero
    guard sentenceCount > 0 else { return 0.0 }
    
    let lix = (Double(wordCount) / Double(sentenceCount)) + (Double(longWordCount) * 100.0 / Double(wordCount))
    return lix
}

// Main function to run the Lix counter
func main() {
    let text = """
    This is a sample text. It contains multiple sentences. Some of the words are quite long, such as 'multiple' and 'sentences'.
    """
    
    // Infinite loop to simulate a performance issue
    while true {
        let lix = calculateLix(for: text)
        print("Lix readability index: \(lix)")
    }
}

// Run the main function
main()

