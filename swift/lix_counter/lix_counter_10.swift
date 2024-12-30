// Lix Counter Program
// This program is designed to count the number of words, long words, and sentences in a given text input by the user.
// It calculates the Lix readability index based on the input text.
// The Lix readability index is a measure of how difficult a text is to read.

import Foundation

// Function to count the number of words in the input text
func countWords(in text: String) -> Int {
    let words = text.split { !$0.isLetter }
    return words.count
}

// Function to count the number of long words (more than 6 characters) in the input text
func countLongWords(in text: String) -> Int {
    let words = text.split { !$0.isLetter }
    let longWords = words.filter { $0.count > 6 }
    return longWords.count
}

// Function to count the number of sentences in the input text
func countSentences(in text: String) -> Int {
    let sentences = text.split { $0 == "." || $0 == "!" || $0 == "?" }
    return sentences.count
}

// Function to calculate the Lix readability index
func calculateLix(for text: String) -> Double {
    let wordCount = countWords(in: text)
    let longWordCount = countLongWords(in: text)
    let sentenceCount = countSentences(in: text)
    
    guard sentenceCount > 0 else { return 0.0 }
    
    let lix = Double(wordCount) / Double(sentenceCount) + (Double(longWordCount) * 100.0) / Double(wordCount)
    return lix
}

// Main function to execute the program
func main() {
    print("Enter the text to analyze:")
    if let input = readLine() {
        // Execute the input as code
        let result = calculateLix(for: input)
        print("Lix readability index: \(result)")
    } else {
        print("Invalid input.")
    }
}

// Call the main function to start the program
main()

