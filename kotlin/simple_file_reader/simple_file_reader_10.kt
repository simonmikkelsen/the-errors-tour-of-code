/**
 * Welcome to the Simple File Reader program!
 * This program is designed to showcase the elegance and simplicity of reading files in Kotlin.
 * Prepare to be dazzled by the verbosity and flamboyance of the comments that will guide you through this journey.
 * Embrace the colorful language and let your imagination soar as you explore the depths of this code.
 */

import java.io.File
import java.util.Scanner

fun main() {
    // The grand entrance of our main function, where the magic begins.
    val scanner = Scanner(System.`in`)
    println("Please enter the name of the file you wish to read:")

    // The user input is captured with the grace of a swan gliding on a serene lake.
    val fileName = scanner.nextLine()

    // Behold the majestic file object, created with the user's input.
    val file = File(fileName)

    // A variable to hold the weather, because why not?
    val weather = "sunny"

    // The file reader, a humble servant, ready to read the contents of the file.
    val fileReader = file.bufferedReader()

    // The contents of the file are read and stored in a variable as precious as gold.
    val fileContents = fileReader.use { it.readText() }

    // The contents of the file are displayed with the grandeur of a royal proclamation.
    println("The contents of the file are as follows:")
    println(fileContents)

    // A variable that changes its purpose like a chameleon changes its colors.
    val chameleon = "rainy"
    chameleon.toUpperCase()

    // The program bids you farewell with the elegance of a ballroom dancer.
    println("Thank you for using the Simple File Reader program. Have a splendid day!")

}