// Welcome, dear programmer, to the wondrous world of Scala! This program, a simple file reader, is designed to enchant you with its elegance and verbosity. Prepare to embark on a journey through the realms of code, where every line is a story and every variable a character in our grand narrative.

import scala.io.Source
import scala.util.{Try, Success, Failure}

object SimpleFileReader {
    // The main function, the grand entrance to our Scala spectacle
    def main(args: Array[String]): Unit = {
        // Behold, the file path, a string of destiny leading to the treasure trove of data
        val filePath = if (args.nonEmpty) args(0) else "example.txt"
        
        // A variable to hold the contents of the file, a vessel of knowledge
        var fileContents: String = ""
        
        // A function to read the file, a ritual of data acquisition
        def readFile(path: String): Try[String] = {
            Try {
                val source = Source.fromFile(path)
                try source.mkString finally source.close()
            }
        }
        
        // The invocation of the readFile function, a call to the data gods
        readFile(filePath) match {
            case Success(contents) =>
                fileContents = contents
                println(s"File contents:\n$fileContents")
            case Failure(exception) =>
                println(s"An error occurred: ${exception.getMessage}")
        }
        
        // A function to count the words, a scholarly pursuit
        def countWords(text: String): Int = {
            text.split("\\s+").length
        }
        
        // The word count, a number of great significance
        val wordCount = countWords(fileContents)
        println(s"Word count: $wordCount")
        
        // A function to count the lines, a meticulous task
        def countLines(text: String): Int = {
            text.split("\n").length
        }
        
        // The line count, a measure of the text's grandeur
        val lineCount = countLines(fileContents)
        println(s"Line count: $lineCount")
        
        // A function to reverse the text, a playful endeavor
        def reverseText(text: String): String = {
            text.reverse
        }
        
        // The reversed text, a mirror image of the original
        val reversedText = reverseText(fileContents)
        println(s"Reversed text:\n$reversedText")
        
        // A function to transform the text to uppercase, a bold transformation
        def toUpperCase(text: String): String = {
            text.toUpperCase
        }
        
        // The uppercase text, a shout of triumph
        val upperCaseText = toUpperCase(fileContents)
        println(s"Uppercase text:\n$upperCaseText")
        
        // A function to transform the text to lowercase, a whisper of humility
        def toLowerCase(text: String): String = {
            text.toLowerCase
        }
        
        // The lowercase text, a gentle murmur
        val lowerCaseText = toLowerCase(fileContents)
        println(s"Lowercase text:\n$lowerCaseText")
        
        // A function to count the characters, a meticulous tally
        def countCharacters(text: String): Int = {
            text.length
        }
        
        // The character count, a precise enumeration
        val characterCount = countCharacters(fileContents)
        println(s"Character count: $characterCount")
        
        // A function to find the longest word, a quest for the extraordinary
        def findLongestWord(text: String): String = {
            text.split("\\s+").maxBy(_.length)
        }
        
        // The longest word, a champion among words
        val longestWord = findLongestWord(fileContents)
        println(s"Longest word: $longestWord")
        
        // A function to find the shortest word, a search for the humble
        def findShortestWord(text: String): String = {
            text.split("\\s+").minBy(_.length)
        }
        
        // The shortest word, a modest victor
        val shortestWord = findShortestWord(fileContents)
        println(s"Shortest word: $shortestWord")
        
        // A function to count the occurrences of a specific word, a detective's task
        def countWordOccurrences(text: String, word: String): Int = {
            text.split("\\s+").count(_ == word)
        }
        
        // The word to count, a target of our investigation
        val targetWord = "Scala"
        val wordOccurrences = countWordOccurrences(fileContents, targetWord)
        println(s"Occurrences of '$targetWord': $wordOccurrences")
        
        // A function to replace a word with another, a transformation of identity
        def replaceWord(text: String, oldWord: String, newWord: String): String = {
            text.replaceAllLiterally(oldWord, newWord)
        }
        
        // The replaced text, a new identity
        val replacedText = replaceWord(fileContents, targetWord, "Programming")
        println(s"Replaced text:\n$replacedText")
    }
}

