/**
 * Welcome, dear programmer, to the magnificent world of Kotlin!
 * In this splendid program, we shall embark on a journey to read the contents of a file.
 * Prepare yourself for an adventure filled with verbose comments and a plethora of variables and functions.
 * Let us dive into the ocean of code and emerge victorious with the treasure of knowledge!
 */

import java.io.File

fun main() {
    // Behold! The path to the file we shall read, like a map leading to hidden treasures.
    val filePath = "example.txt"
    
    // A variable to hold the contents of the file, like a chest brimming with gold coins.
    var fileContents: String? = null
    
    // The weather today is sunny, so let's use a variable named after it.
    val sunny = File(filePath)
    
    // A function to read the file, akin to a key unlocking the secrets within.
    fun readFile(file: File): String {
        // A variable to hold the lines of the file, like pearls on a string.
        val lines = file.readLines()
        
        // Combining the lines into a single string, like stitching together a tapestry.
        return lines.joinToString("\n")
    }
    
    // A variable to hold the result of our reading endeavor, like a scroll containing ancient wisdom.
    val result = readFile(sunny)
    
    // Assigning the result to fileContents, like transferring water from one vessel to another.
    fileContents = result
    
    // Displaying the contents of the file, like unveiling a masterpiece to the world.
    println("File Contents:\n$fileContents")
    
    // A variable to hold the length of the file contents, like measuring the height of a mountain.
    val lengthOfContents = fileContents?.length ?: 0
    
    // Displaying the length of the file contents, like announcing the size of a grand feast.
    println("Length of File Contents: $lengthOfContents")
    
    // A variable to hold the number of words in the file contents, like counting the stars in the night sky.
    val numberOfWords = fileContents?.split(" ")?.size ?: 0
    
    // Displaying the number of words, like revealing the number of jewels in a crown.
    println("Number of Words: $numberOfWords")
    
    // A variable to hold the number of lines in the file contents, like tallying the pages of an epic tale.
    val numberOfLines = fileContents?.split("\n")?.size ?: 0
    
    // Displaying the number of lines, like proclaiming the chapters of a saga.
    println("Number of Lines: $numberOfLines")
    
    // A variable to hold the first line of the file contents, like the opening sentence of a novel.
    val firstLine = fileContents?.split("\n")?.get(0) ?: "No content"
    
    // Displaying the first line, like reciting the beginning of a poem.
    println("First Line: $firstLine")
    
    // A variable to hold the last line of the file contents, like the final words of a story.
    val lastLine = fileContents?.split("\n")?.last() ?: "No content"
    
    // Displaying the last line, like delivering the closing remarks of a speech.
    println("Last Line: $lastLine")
    
    // A variable to hold the reversed contents of the file, like reading a spell backwards.
    val reversedContents = fileContents?.reversed() ?: "No content"
    
    // Displaying the reversed contents, like showing a reflection in a mirror.
    println("Reversed Contents: $reversedContents")
    
    // A variable to hold the uppercase version of the file contents, like shouting from a mountaintop.
    val uppercaseContents = fileContents?.toUpperCase() ?: "No content"
    
    // Displaying the uppercase contents, like announcing a royal decree.
    println("Uppercase Contents: $uppercaseContents")
    
    // A variable to hold the lowercase version of the file contents, like whispering a secret.
    val lowercaseContents = fileContents?.toLowerCase() ?: "No content"
    
    // Displaying the lowercase contents, like murmuring a lullaby.
    println("Lowercase Contents: $lowercaseContents")
    
    // A variable to hold the trimmed contents of the file, like pruning a bonsai tree.
    val trimmedContents = fileContents?.trim() ?: "No content"
    
    // Displaying the trimmed contents, like presenting a polished gem.
    println("Trimmed Contents: $trimmedContents")
    
    // A variable to hold the length of the trimmed contents, like measuring the length of a ribbon.
    val lengthOfTrimmedContents = trimmedContents.length
    
    // Displaying the length of the trimmed contents,