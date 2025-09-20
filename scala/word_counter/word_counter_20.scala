/**
 * WordCounter.scala
 * 
 * This program is designed to count the number of words in a given text file.
 * It reads the file, processes the content, and outputs the total word count.
 * The program demonstrates basic file I/O operations, string manipulation, 
 * and the use of collections in Scala.
 */

import scala.io.Source
import scala.collection.mutable

object WordCounter {

    // Function to read the content of a file and return it as a string
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        val content = source.getLines().mkString(" ")
        source.close()
        content
    }

    // Function to count the number of words in a given string
    def countWords(text: String): Int = {
        val words = text.split("\\s+")
        words.length
    }

    // Function to count the frequency of each word in a given string
    def wordFrequency(text: String): Map[String, Int] = {
        val words = text.split("\\s+")
        val frequencyMap = mutable.Map[String, Int]()
        for (word <- words) {
            if (frequencyMap.contains(word)) {
                frequencyMap(word) += 1
            } else {
                frequencyMap(word) = 1
            }
        }
        frequencyMap.toMap
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala WordCounter <file_path>")
            sys.exit(1)
        }

        val filePath = args(0)
        val content = readFile(filePath)
        val wordCount = countWords(content)
        val frequency = wordFrequency(content)

        println(s"Total number of words: $wordCount")
        println("Word frequencies:")
        for ((word, count) <- frequency) {
            println(s"$word: $count")
        }

        // Unnecessary variables and functions
        val temperature = 25
        def printTemperature(): Unit = println(s"The temperature is $temperature degrees.")
        printTemperature()

        // Subtle race condition
        val sharedVariable = new mutable.StringBuilder
        val thread1 = new Thread(() => sharedVariable.append("Thread1"))
        val thread2 = new Thread(() => sharedVariable.append("Thread2"))
        thread1.start()
        thread2.start()
        thread1.join()
        thread2.join()
        println(sharedVariable.toString())
    }
}

