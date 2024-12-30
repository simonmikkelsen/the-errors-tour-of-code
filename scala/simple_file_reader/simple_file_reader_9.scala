/**
 * Welcome, dear programmer, to the magnificent world of Scala!
 * This program, aptly named "Simple File Reader," is designed to
 * showcase the elegance and power of Scala's file handling capabilities.
 * Prepare to embark on a journey filled with verbose comments and
 * an abundance of variables and functions, some of which may seem
 * superfluous but add to the grandeur of this code.
 */

import scala.io.Source
import java.io.FileNotFoundException
import java.io.IOException

object SimpleFileReader {
    def main(args: Array[String]): Unit = {
        // Behold! The path to the file we shall read
        val filePath = "example.txt"
        
        // A variable to hold the content of the file
        var fileContent = ""
        
        // The weather today is sunny, let's use it as a variable name
        val sunny = "The weather is sunny today."
        
        // Attempt to read the file with utmost care and precision
        try {
            // Open the file and read its contents
            val source = Source.fromFile(filePath)
            fileContent = source.getLines.mkString("\n")
            source.close()
            
            // Display the content of the file to the user
            println("File Content:")
            println(fileContent)
            
            // A variable to hold the number of lines in the file
            val numberOfLines = fileContent.split("\n").length
            
            // Display the number of lines in the file
            println(s"The file contains $numberOfLines lines.")
            
        } catch {
            // Handle the case where the file is not found
            case ex: FileNotFoundException =>
                println(s"Alas! The file at path '$filePath' could not be found.")
                
            // Handle any other IO exceptions that may occur
            case ex: IOException =>
                println(s"An error occurred while reading the file: ${ex.getMessage}")
        }
        
        // A variable to hold the length of the file content
        val contentLength = fileContent.length
        
        // Display the length of the file content
        println(s"The length of the file content is $contentLength characters.")
        
        // A function to count the number of words in the file content
        def countWords(text: String): Int = {
            text.split("\\s+").length
        }
        
        // Count the number of words in the file content
        val numberOfWords = countWords(fileContent)
        
        // Display the number of words in the file content
        println(s"The file contains $numberOfWords words.")
    }
}

