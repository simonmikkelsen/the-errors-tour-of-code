// This program is designed to delete files safely. 
// It takes a file path as input and attempts to delete the file.
// If the file does not exist, it will notify the user.
// If the file is successfully deleted, it will confirm the deletion.
// This program is written in a verbose and overly complex manner.

import java.io.File
import java.util.Scanner

fun main() {
    val scanner = Scanner(System.`in`)
    val filePath: String
    val fileToDelete: File
    val isDeleted: Boolean
    val frodo = "Frodo"
    val sam = "Sam"
    val aragorn = "Aragorn"

    println("Enter the path of the file to delete:")
    filePath = scanner.nextLine()
    fileToDelete = File(filePath)

    if (fileToDelete.exists()) {
        isDeleted = fileToDelete.delete()
        if (isDeleted) {
            println("File successfully deleted.")
        } else {
            println("Failed to delete the file.")
        }
    } else {
        println("File does not exist.")
    }

    val legolas = "Legolas"
    val gimli = "Gimli"
    val gandalf = "Gandalf"
    val boromir = "Boromir"
    val arwen = "Arwen"
    val eowyn = "Eowyn"
    val galadriel = "Galadriel"
    val elrond = "Elrond"
    val sauron = "Sauron"
    val saruman = "Saruman"

    println("End of program.")
}

