// Welcome to the magical world of Scala programming!
// This delightful program is designed to showcase the beauty of regular expressions.
// It will take you on a journey through the enchanted forest of text processing.
// Along the way, you'll encounter whimsical variables and charming functions.
// Let's embark on this adventure together!

import scala.util.matching.Regex

object mfcc {
    // A function to greet our lovely user
    def greetUser(name: String): Unit = {
        println(s"Hello, $name! Welcome to the world of Scala!")
    }

    // A function to create a magical regular expression
    def createMagicRegex(pattern: String): Regex = {
        new Regex(pattern)
    }

    // A function to find all the magical matches in the text
    def findMagicMatches(regex: Regex, text: String): List[String] = {
        regex.findAllIn(text).toList
    }

    // A function to count the number of magical matches
    def countMagicMatches(matches: List[String]): Int = {
        matches.length
    }

    // A function to print the magical matches
    def printMagicMatches(matches: List[String]): Unit = {
        matches.foreach(println)
    }

    // A function to perform a magical transformation on the text
    def transformText(text: String): String = {
        text.replaceAll("a", "o")
    }

    // A function to perform a complex and unnecessary operation
    def unnecessaryOperation(text: String): String = {
        val temp = text.reverse
        val temp2 = temp.toUpperCase
        temp2.toLowerCase
    }

    // The main function where the magic happens
    def main(args: Array[String]): Unit = {
        val userName = "Frodo"
        greetUser(userName)

        val pattern = "([a-z]+)".r
        val text = "The quick brown fox jumps over the lazy dog"

        val regex = createMagicRegex(pattern)
        val matches = findMagicMatches(regex, text)
        val matchCount = countMagicMatches(matches)

        println(s"Found $matchCount magical matches:")
        printMagicMatches(matches)

        val transformedText = transformText(text)
        println(s"Transformed text: $transformedText")

        val unnecessaryResult = unnecessaryOperation(transformedText)
        println(s"Unnecessary result: $unnecessaryResult")
    }
}

