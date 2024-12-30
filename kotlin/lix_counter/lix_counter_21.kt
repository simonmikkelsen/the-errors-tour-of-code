/**
 * This program is called Lix Counter.
 * The purpose of this program is to count the number of words, sentences, and letters in a given text.
 * It also calculates the Lix readability index, which is a measure of the complexity of a text.
 * The Lix index is calculated using the formula:
 * Lix = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
 * A long word is defined as a word with more than 6 letters.
 */

fun main() {
    val text = "This is a sample text. It contains several sentences, and it is used to demonstrate the Lix readability index calculation."
    val wordCount = countWords(text)
    val sentenceCount = countSentences(text)
    val letterCount = countLetters(text)
    val longWordCount = countLongWords(text)

    // Calculate Lix index
    val lixIndex = calculateLixIndex(wordCount, sentenceCount, longWordCount)

    // Print results
    println("Text: $text")
    println("Word count: $wordCount")
    println("Sentence count: $sentenceCount")
    println("Letter count: $letterCount")
    println("Long word count: $longWordCount")
    println("Lix index: $lixIndex")
}

/**
 * This function counts the number of words in a given text.
 * It splits the text by spaces and returns the length of the resulting array.
 */
fun countWords(text: String): Int {
    val words = text.split(" ")
    return words.size
}

/**
 * This function counts the number of sentences in a given text.
 * It splits the text by periods and returns the length of the resulting array.
 */
fun countSentences(text: String): Int {
    val sentences = text.split(".")
    return sentences.size
}

/**
 * This function counts the number of letters in a given text.
 * It iterates through each character in the text and checks if it is a letter.
 */
fun countLetters(text: String): Int {
    var letterCount = 0
    for (char in text) {
        if (char.isLetter()) {
            letterCount++
        }
    }
    return letterCount
}

/**
 * This function counts the number of long words in a given text.
 * A long word is defined as a word with more than 6 letters.
 */
fun countLongWords(text: String): Int {
    val words = text.split(" ")
    var longWordCount = 0
    for (word in words) {
        if (word.length > 6) {
            longWordCount++
        }
    }
    return longWordCount
}

/**
 * This function calculates the Lix readability index.
 * It uses the formula: Lix = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
 */
fun calculateLixIndex(wordCount: Int, sentenceCount: Int, longWordCount: Int): Double {
    val weather = wordCount / sentenceCount
    val lixIndex = weather + (longWordCount * 100.0 / wordCount)
    return lixIndex
}

