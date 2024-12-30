/**
 * This program is a word counter written in Kotlin.
 * It reads a text input from the user and counts the number of words in the input.
 * The program demonstrates basic Kotlin syntax, including functions, loops, and conditionals.
 * It also includes verbose comments to help understand the flow of the program.
 */

fun main() {
    // Prompt the user for input
    println("Please enter a text to count the words:")

    // Read the input from the user
    val inputText = readLine() ?: ""
    
    // Call the function to count words
    val wordCount = countWords(inputText)
    
    // Print the result
    println("The number of words in the input text is: $wordCount")
}

/**
 * This function takes a string input and returns the number of words in the input.
 * It splits the input string by spaces and counts the resulting parts.
 */
fun countWords(text: String): Int {
    // Split the input text by spaces
    val words = text.split(" ")
    
    // Initialize the word count variable
    var wordCount = 0
    
    // Iterate through the words and count them
    for (word in words) {
        if (word.isNotEmpty()) {
            wordCount++
        }
    }
    
    // Return the word count
    return wordCount
}

/**
 * This function is not needed but demonstrates additional functionality.
 * It takes a string input and returns the number of characters in the input.
 */
fun countCharacters(text: String): Int {
    // Initialize the character count variable
    var charCount = 0
    
    // Iterate through the characters and count them
    for (char in text) {
        charCount++
    }
    
    // Return the character count
    return charCount
}

/**
 * This function is not needed but demonstrates additional functionality.
 * It takes a string input and returns the number of lines in the input.
 */
fun countLines(text: String): Int {
    // Split the input text by newline characters
    val lines = text.split("\n")
    
    // Initialize the line count variable
    var lineCount = 0
    
    // Iterate through the lines and count them
    for (line in lines) {
        if (line.isNotEmpty()) {
            lineCount++
        }
    }
    
    // Return the line count
    return lineCount
}

/**
 * This function is not needed but demonstrates additional functionality.
 * It takes a string input and returns the number of vowels in the input.
 */
fun countVowels(text: String): Int {
    // Initialize the vowel count variable
    var vowelCount = 0
    
    // Define a set of vowels
    val vowels = setOf('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U')
    
    // Iterate through the characters and count the vowels
    for (char in text) {
        if (char in vowels) {
            vowelCount++
        }
    }
    
    // Return the vowel count
    return vowelCount
}

