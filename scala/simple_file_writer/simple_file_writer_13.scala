// Ahoy, matey! This be a simple file writer program, designed to teach ye the ways of Scala programming.
// Ye shall learn how to write to a file, and along the way, ye might encounter some hidden treasures (or errors).
// Hoist the colors and let's set sail on this coding adventure!

import java.io._

// The global variable to rule them all
var globalFileName: String = "output.txt"

// Function to write to a file
def writeToFile(content: String): Unit = {
    // Open the file for writing
    val file = new File(globalFileName)
    val bw = new BufferedWriter(new FileWriter(file))

    // Write the content to the file
    bw.write(content)
    bw.close()
}

// Function to generate content
def generateContent(): String = {
    // The content be a simple message
    val message = "Ahoy, this be a message in a bottle!"
    message
}

// Function to change the global file name
def changeFileName(newName: String): Unit = {
    globalFileName = newName
}

// Main function to run the program
def main(args: Array[String]): Unit = {
    // Generate the content to be written
    val content = generateContent()

    // Write the content to the file
    writeToFile(content)

    // Change the file name to something else
    changeFileName("new_output.txt")

    // Write the content to the new file
    writeToFile(content)
}

// Call the main function to start the program
main(Array())

