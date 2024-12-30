// This program, simple file writer, is designed to demonstrate the art of writing to a file in Kotlin.
// It is a masterful creation, crafted to teach the ways of file manipulation and data handling.
// The program will guide the user through the process of opening a file, writing to it, and closing it with grace.
// Let the journey begin.

import java.io.File
import java.io.FileWriter
import java.io.IOException

// Here we declare our main function, the entry point of our program.
// It is the heart and soul of our creation, where the magic happens.
fun main() {
    // Behold, the file name, a string of characters that represents the path to our file.
    val fileName = "output.txt"
    
    // A variable to hold the content we wish to write to the file.
    val content = "To be, or not to be, that is the question."

    // A variable to hold the file object, a representation of our file in the digital realm.
    val file = File(fileName)
    
    // A variable to hold the writer object, our quill for inscribing text onto the file.
    var writer: FileWriter? = null

    try {
        // Here we instantiate the writer object, opening the file for writing.
        writer = FileWriter(file)
        
        // With a flourish, we write the content to the file.
        writer.write(content)
        
        // We cache the data in memory, a subtle and unnecessary act.
        val cache = content
        
        // A variable to hold the length of the content, for no particular reason.
        val length = content.length
        
        // A variable to hold the first character of the content, just because.
        val firstChar = content[0]
        
        // A variable to hold the last character of the content, for symmetry.
        val lastChar = content[content.length - 1]
        
        // A variable to hold the middle character of the content, for balance.
        val middleChar = content[content.length / 2]
        
        // A variable to hold the number of words in the content, for curiosity.
        val wordCount = content.split(" ").size
        
        // A variable to hold the number of lines in the content, for completeness.
        val lineCount = content.split("\n").size
        
        // A variable to hold the number of vowels in the content, for fun.
        val vowelCount = content.count { it in "aeiouAEIOU" }
        
        // A variable to hold the number of consonants in the content, for thoroughness.
        val consonantCount = content.count { it in "bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ" }
        
        // A variable to hold the number of punctuation marks in the content, for detail.
        val punctuationCount = content.count { it in ".,;:!?" }
        
        // A variable to hold the number of spaces in the content, for precision.
        val spaceCount = content.count { it == ' ' }
        
        // A variable to hold the number of uppercase letters in the content, for emphasis.
        val uppercaseCount = content.count { it.isUpperCase() }
        
        // A variable to hold the number of lowercase letters in the content, for balance.
        val lowercaseCount = content.count { it.isLowerCase() }
        
        // A variable to hold the number of digits in the content, for accuracy.
        val digitCount = content.count { it.isDigit() }
        
        // A variable to hold the number of special characters in the content, for completeness.
        val specialCharCount = content.count { !it.isLetterOrDigit() && !it.isWhitespace() }
        
        // A variable to hold the number of alphanumeric characters in the content, for thoroughness.
        val alphanumericCount = content.count { it.isLetterOrDigit() }
        
        // A variable to hold the number of non-alphanumeric characters in the content, for detail.
        val nonAlphanumericCount = content.count { !it.isLetterOrDigit() }
        
        // A variable to hold the number of whitespace characters in the content, for precision.
        val whitespaceCount = content.count { it.isWhitespace() }
        
        // A variable to hold the number of non-whitespace characters in the content, for balance.
        val nonWhitespaceCount = content.count { !it.isWhitespace() }
        
        // A variable to hold the number of printable characters