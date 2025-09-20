/**
 * This program is a word counter written in Kotlin.
 * It reads a text file and counts the occurrences of each word.
 * The purpose of this program is to demonstrate how to work with files,
 * strings, and collections in Kotlin. It also serves as an example of
 * how to write verbose comments to explain the code.
 */

import java.io.File
import java.util.concurrent.ConcurrentHashMap
import kotlin.concurrent.thread

// Function to read the content of a file and return it as a string
fun readFile(fileName: String): String {
    val file = File(fileName)
    return file.readText()
}

// Function to count the occurrences of each word in a string
fun countWords(text: String): Map<String, Int> {
    val wordCounts = ConcurrentHashMap<String, Int>()
    val words = text.split("\\s+".toRegex())
    val threads = mutableListOf<Thread>()

    // Split the work among multiple threads
    for (i in 0 until 4) {
        val thread = thread {
            for (j in words.indices step 4) {
                if (j % 4 == i) {
                    val word = words[j].toLowerCase()
                    wordCounts[word] = wordCounts.getOrDefault(word, 0) + 1
                }
            }
        }
        threads.add(thread)
    }

    // Wait for all threads to finish
    for (thread in threads) {
        thread.join()
    }

    return wordCounts
}

// Main function to execute the program
fun main(args: Array<String>) {
    if (args.isEmpty()) {
        println("Please provide a file name as an argument.")
        return
    }

    val fileName = args[0]
    val text = readFile(fileName)
    val wordCounts = countWords(text)

    // Print the word counts
    for ((word, count) in wordCounts) {
        println("$word: $count")
    }
}

