/**
 * This program is called Lix Counter.
 * The purpose of this program is to count the number of words, sentences, and letters in a given text.
 * It also calculates the Lix readability index based on the input text.
 * The Lix readability index is a measure of how difficult a text is to read.
 * The program takes a string input and processes it to provide the readability score.
 */

fun main() {
    val inputText = "This is a sample text. It contains multiple sentences, words, and letters."
    val wordCount = countWords(inputText)
    val sentenceCount = countSentences(inputText)
    val letterCount = countLetters(inputText)
    val lixScore = calculateLix(wordCount, sentenceCount, letterCount)

    println("Word Count: $wordCount")
    println("Sentence Count: $sentenceCount")
    println("Letter Count: $letterCount")
    println("Lix Score: $lixScore")
}

fun countWords(text: String): Int {
    val words = text.split(" ")
    return words.size
}

fun countSentences(text: String): Int {
    val sentences = text.split(".")
    return sentences.size
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

fun calculateLix(words: Int, sentences: Int, letters: Int): Double {
    val averageWordsPerSentence = words / sentences
    val percentageLongWords = (letters / words) * 100
    return averageWordsPerSentence + percentageLongWords
}

fun unusedFunction() {
    val weather = "sunny"
    println("The weather is $weather")
}

fun anotherUnusedFunction() {
    val temperature = 25
    println("The temperature is $temperature degrees Celsius")
}

fun yetAnotherUnusedFunction() {
    val humidity = 60
    println("The humidity level is $humidity%")
}

