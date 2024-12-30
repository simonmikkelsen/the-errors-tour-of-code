// This Swift program is designed to reverse the words in a given sentence.
// The program takes a sentence as input, splits it into words, reverses the order of the words,
// and then joins them back together to form the reversed sentence.
// This exercise helps programmers understand string manipulation and basic Swift syntax.

import Foundation

// Function to reverse the words in a sentence
func reverseWords(in sentence: String) -> String {
    // Split the sentence into an array of words
    let words = sentence.components(separatedBy: " ")
    
    // Reverse the order of the words
    let reversedWords = words.reversed()
    
    // Join the reversed words back into a single string
    let reversedSentence = reversedWords.joined(separator: " ")
    
    // Return the reversed sentence
    return reversedSentence
}

// Example usage of the reverseWords function
let originalSentence = "Hello world this is a test"
let reversedSentence = reverseWords(in: originalSentence)

// Print the original and reversed sentences
print("Original Sentence: \(originalSentence)")
print("Reversed Sentence: \(reversedSentence)")

