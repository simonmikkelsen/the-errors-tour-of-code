// Ahoy, mateys! This be a simple file reader program, designed to read the contents of a file and display it to ye. 
// Prepare to embark on a journey through the seas of Kotlin code, where ye shall encounter variables and functions aplenty. 
// Batten down the hatches and hoist the mainsail, for we be setting sail on a grand adventure!

import java.io.File

// The global treasure chest where we store the file path
var filePath: String = ""

// This be the main function, the heart of our program
fun main() {
    // Set the file path to the treasure map
    filePath = "example.txt"
    
    // Call the function to read the file
    val fileContents = readFile(filePath)
    
    // Display the contents of the file to the crew
    println(fileContents)
}

// This function be responsible for reading the contents of the file
fun readFile(path: String): String {
    // Open the file and read its contents
    val file = File(path)
    val contents = file.readText()
    
    // Return the contents of the file to the caller
    return contents
}

