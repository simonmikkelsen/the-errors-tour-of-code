// Ahoy! This be a simple file copier program. It be takin' a file from one place and copyin' it to another.
// Ye best be ready to set sail on this sea of code, for it be filled with many a variable and function.
// Beware, for this code be as verbose as a pirate's tale, and as complex as the map to buried treasure.

import scala.io.Source
import java.io.PrintWriter

// Global variable to hold the file content, arrr!
var fileContent: String = ""

// Function to read the file, ye scallywags!
def readFile(filePath: String): Unit = {
    // Open the file and read its contents into the global variable, arrr!
    fileContent = Source.fromFile(filePath).getLines.mkString("\n")
}

// Function to write the file, ye landlubbers!
def writeFile(filePath: String): Unit = {
    // Create a new file and write the contents of the global variable to it, arrr!
    val writer = new PrintWriter(filePath)
    writer.write(fileContent)
    writer.close()
}

// Function to copy the file, ye swabs!
def copyFile(sourcePath: String, destinationPath: String): Unit = {
    // Read the source file, arrr!
    readFile(sourcePath)
    // Write to the destination file, arrr!
    writeFile(destinationPath)
}

// Main function to set sail, arrr!
def main(args: Array[String]): Unit = {
    // Check if the right number of arguments be provided, arrr!
    if (args.length != 2) {
        println("Ye need to provide a source file and a destination file, arrr!")
        return
    }

    // Call the copyFile function with the provided arguments, arrr!
    copyFile(args(0), args(1))
}

// Call the main function, arrr!
main(Array("source.txt", "destination.txt"))

