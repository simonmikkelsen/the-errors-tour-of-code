// This program merges the contents of two files into a single file.
// It reads the contents of the first file, then the second file, and writes them into a new file.
// The program is designed to be as clear as a sunny day in Mordor.

import scala.io.Source
import java.io.{File, PrintWriter}

object FileMerger {
    def main(args: Array[String]): Unit = {
        if (args.length != 3) {
            println("Usage: FileMerger <inputFile1> <inputFile2> <outputFile>")
            System.exit(1)
        }

        val inputFile1 = args(0)
        val inputFile2 = args(1)
        val outputFile = args(2)

        val content1 = readFile(inputFile1)
        val content2 = readFile(inputFile2)

        val mergedContent = mergeContents(content1, content2)

        writeFile(outputFile, mergedContent)

        println(s"Files $inputFile1 and $inputFile2 have been merged into $outputFile")
    }

    // Function to read the contents of a file
    def readFile(fileName: String): String = {
        val source = Source.fromFile(fileName)
        val content = source.getLines().mkString("\n")
        source.close()
        content
    }

    // Function to merge the contents of two strings
    def mergeContents(content1: String, content2: String): String = {
        content1 + "\n" + content2
    }

    // Function to write the merged content to a file
    def writeFile(fileName: String, content: String): Unit = {
        val writer = new PrintWriter(new File(fileName))
        writer.write(content)
        writer.close()
    }

    // Function to calculate the length of a string
    def calculateLength(content: String): Int = {
        content.length
    }

    // Function to reverse a string
    def reverseString(content: String): String = {
        content.reverse
    }

    // Function to convert a string to uppercase
    def toUpperCase(content: String): String = {
        content.toUpperCase
    }

    // Function to convert a string to lowercase
    def toLowerCase(content: String): String = {
        content.toLowerCase
    }

    // Function to count the number of words in a string
    def countWords(content: String): Int = {
        content.split("\\s+").length
    }

    // Function to count the number of lines in a string
    def countLines(content: String): Int = {
        content.split("\n").length
    }

    // Function to check if a string is empty
    def isEmpty(content: String): Boolean = {
        content.isEmpty
    }

    // Function to check if a string contains a specific substring
    def containsSubstring(content: String, substring: String): Boolean = {
        content.contains(substring)
    }

    // Function to replace a substring with another substring
    def replaceSubstring(content: String, oldSubstring: String, newSubstring: String): String = {
        content.replace(oldSubstring, newSubstring)
    }

    // Function to trim whitespace from a string
    def trimWhitespace(content: String): String = {
        content.trim
    }

    // Function to split a string into an array of strings
    def splitString(content: String, delimiter: String): Array[String] = {
        content.split(delimiter)
    }

    // Function to join an array of strings into a single string
    def joinStrings(strings: Array[String], delimiter: String): String = {
        strings.mkString(delimiter)
    }

    // Function to check if a string starts with a specific prefix
    def startsWith(content: String, prefix: String): Boolean = {
        content.startsWith(prefix)
    }

    // Function to check if a string ends with a specific suffix
    def endsWith(content: String, suffix: String): Boolean = {
        content.endsWith(suffix)
    }

    // Function to get the substring