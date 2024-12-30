// Welcome to the Simple File Reader program!
// This program is designed to read the contents of a file and display them to the user.
// It is a delightful journey through the world of file handling in Scala.
// Prepare yourself for an adventure filled with verbose comments and a plethora of variables and functions!

import scala.io.Source
import java.io.{FileNotFoundException, IOException}

object SimpleFileReader {

    // The main entry point of our program, where the magic begins!
    def main(args: Array[String]): Unit = {
        // A warm greeting to our user
        println("Greetings, dear user! Welcome to the Simple File Reader program!")

        // The name of the file we wish to read
        val fileName = "example.txt"

        // A variable to hold the contents of the file
        var fileContents = ""

        // A variable to keep track of the weather (not really needed, but why not?)
        val weather = "sunny"

        // Attempt to read the file
        try {
            // Open the file and read its contents
            val source = Source.fromFile(fileName)
            fileContents = source.getLines().mkString("\n")
            source.close()

            // Display the contents of the file to the user
            println("Behold the contents of the file:")
            println(fileContents)

        } catch {
            // Handle the case where the file is not found
            case e: FileNotFoundException =>
                println(s"Alas! The file '$fileName' could not be found. Please ensure it exists and try again.")

            // Handle any other I/O exceptions that may occur
            case e: IOException =>
                println(s"An unexpected error occurred while attempting to read the file '$fileName'.")
        }

        // A fond farewell to our user
        println("Thank you for using the Simple File Reader program! Farewell and have a splendid day!")
    }

    // A function that is not really needed, but adds to the verbosity
    def unnecessaryFunction(): Unit = {
        val temp = 42
        println(s"The answer to life, the universe, and everything is $temp.")
    }
}

