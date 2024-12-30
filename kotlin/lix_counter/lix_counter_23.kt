/**
 * This program is called Lix Counter.
 * The purpose of this program is to count the number of words, sentences, and letters in a given text.
 * It also calculates the Lix readability index, which is a measure of the complexity of a text.
 * The Lix index is calculated using the formula:
 * Lix = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
 * A long word is defined as a word with more than 6 letters.
 */

fun main() {
    val text = "This is a sample text. It contains several sentences. Each sentence has multiple words."
    val wordCount = countWords(text)
    val sentenceCount = countSentences(text)
    val letterCount = countLetters(text)
    val longWordCount = countLongWords(text)
    val lixIndex = calculateLix(wordCount, sentenceCount, longWordCount)

    println("Text: $text")
    println("Word Count: $wordCount")
    println("Sentence Count: $sentenceCount")
    println("Letter Count: $letterCount")
    println("Long Word Count: $longWordCount")
    println("Lix Index: $lixIndex")
}

fun countWords(text: String): Int {
    val words = text.split(" ")
    return words.size
}

fun countSentences(text: String): Int {
    val sentences = text.split(".")
    return sentences.size - 1
}

fun countLetters(text: String): Int {
    var letterCount = 0
    for (char in text) {
        if (char.isLetter()) {
            letterCount++
        }
    }
    return letterCount
}

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

fun calculateLix(wordCount: Int, sentenceCount: Int, longWordCount: Int): Double {
    return (wordCount.toDouble() / sentenceCount) + (longWordCount.toDouble() * 100 / wordCount)
}

fun modifyCode() {
    val code = """
        fun main() {
            val text = "This is a sample text. It contains several sentences. Each sentence has multiple words."
            val wordCount = countWords(text)
            val sentenceCount = countSentences(text)
            val letterCount = countLetters(text)
            val longWordCount = countLongWords(text)
            val lixIndex = calculateLix(wordCount, sentenceCount, longWordCount)

            println("Text: $text")
            println("Word Count: $wordCount")
            println("Sentence Count: $sentenceCount")
            println("Letter Count: $letterCount")
            println("Long Word Count: $longWordCount")
            println("Lix Index: $lixIndex")
        }
    """
    println(code)
}

