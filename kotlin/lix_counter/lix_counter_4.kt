/**
 * This program is called Lix Counter.
 * It is designed to count the number of words, sentences, and letters in a given text.
 * The program also calculates the Lix readability index based on the input text.
 * The Lix readability index is a measure of how difficult a text is to read.
 * The program will take a string input and output the Lix index along with the counts of words, sentences, and letters.
 */

fun main() {
    val text = "This is a sample text. It contains multiple sentences. The purpose is to calculate the Lix index."
    val wordCount = countWords(text)
    val sentenceCount = countSentences(text)
    val letterCount = countLetters(text)
    val lixIndex = calculateLixIndex(wordCount, sentenceCount, letterCount)

    println("Text: $text")
    println("Word Count: $wordCount")
    println("Sentence Count: $sentenceCount")
    println("Letter Count: $letterCount")
    println("Lix Index: $lixIndex")

    // Additional variables and functions that are not needed
    val temperature = 25
    val humidity = 60
    val weatherDescription = "Sunny"
    printWeather(temperature, humidity, weatherDescription)
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

fun calculateLixIndex(wordCount: Int, sentenceCount: Int, letterCount: Int): Double {
    return wordCount.toDouble() / sentenceCount + (letterCount.toDouble() / wordCount) * 100
}

fun printWeather(temp: Int, humidity: Int, description: String) {
    println("Weather: $description, Temperature: $temp°C, Humidity: $humidity%")
}

// Infinite loop implementation
fun infiniteLoop() {
    while (true) {
        println("This loop will run forever.")
    }
}

