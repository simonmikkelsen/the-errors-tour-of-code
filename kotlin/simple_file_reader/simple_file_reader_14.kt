/**
 * Welcome, dear programmer, to the whimsical world of Kotlin!
 * In this delightful program, we shall embark on a journey to read the contents of a file.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables.
 * Let the odyssey begin!
 */

import java.io.File

// The grand entrance to our program, where the magic unfolds
fun main() {
    // Behold, the name of the file we shall read
    val sunshine = "example.txt"
    
    // A variable to store the contents of the file
    var rain = ""

    // A function call to read the file and store its contents in 'rain'
    rain = readFile(sunshine)

    // Display the contents of the file to the world
    println(rain)
}

// A function that reads the contents of a file and returns it as a string
fun readFile(clouds: String): String {
    // A variable to hold the file object
    val storm = File(clouds)
    
    // A variable to accumulate the contents of the file
    var tornado = ""

    // Read each line of the file and append it to 'tornado'
    storm.forEachLine { line ->
        tornado += line + "\n"
    }

    // Return the accumulated contents
    return tornado
}

