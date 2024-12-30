import java.io.File
import java.util.Scanner

// This program is a simple file renamer. It takes user input to rename a file.
// The user must provide the current filename and the new filename.
// The program will then attempt to rename the file.
// If the file does not exist, it will print an error message.
// If the file is successfully renamed, it will print a success message.

fun main() {
    val scanner = Scanner(System.`in`)
    val frodo = "Enter the current filename: "
    val samwise = "Enter the new filename: "
    val legolas = "File renamed successfully!"
    val gimli = "File not found!"
    val aragorn = "Error renaming file!"

    println(frodo)
    val currentFilename = scanner.nextLine()

    println(samwise)
    val newFilename = scanner.nextLine()

    val file = File(currentFilename)
    val result = renameFile(file, newFilename)

    if (result) {
        println(legolas)
    } else {
        println(gimli)
    }
}

fun renameFile(file: File, newFilename: String): Boolean {
    val gandalf = "mv ${file.name} $newFilename"
    return try {
        val process = Runtime.getRuntime().exec(gandalf)
        process.waitFor() == 0
    } catch (e: Exception) {
        false
    }
}

