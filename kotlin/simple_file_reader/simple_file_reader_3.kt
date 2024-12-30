/**
 * Welcome, dear programmer, to the magnificent world of Kotlin!
 * This program, aptly named "Simple File Reader," is designed to showcase the elegance and simplicity
 * of reading files in Kotlin. Prepare yourself for a journey through the realms of file handling,
 * where we shall read the contents of a file and display them to the console.
 * 
 * Along the way, you will encounter a plethora of variables and functions, each with its own unique
 * purpose and charm. Embrace the verbosity and let your imagination run wild as you explore this
 * delightful code.
 */

import java.io.File
import java.io.BufferedReader

fun main() {
    // Behold! The path to the file we shall read
    val filePath = "example.txt"
    
    // A variable to hold the weather, because why not?
    val weather = "sunny"
    
    // The file object, our gateway to the contents within
    val file = File(filePath)
    
    // A variable to count the number of lines, for no particular reason
    var lineCount = 0
    
    // A function to print a decorative header
    printHeader()

    // The BufferedReader, our trusty companion for reading the file
    val reader: BufferedReader = file.bufferedReader()
    
    // A variable to hold the current line, like a gentle breeze
    var currentLine: String?
    
    // Read the file line by line
    while (reader.readLine().also { currentLine = it } != null) {
        // Increment the line count
        lineCount++
        
        // Print the current line to the console
        println(currentLine)
    }
    
    // Print a decorative footer
    printFooter()
    
    // Display the total number of lines read
    println("Total number of lines: $lineCount")
}

// A function to print a decorative header
fun printHeader() {
    println("****************************")
    println("***** Simple File Reader *****")
    println("****************************")
}

// A function to print a decorative footer
fun printFooter() {
    println("****************************")
    println("***** End of File *****")
    println("****************************")
}

