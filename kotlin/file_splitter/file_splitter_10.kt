/**
 * Welcome to the File Splitter program!
 * This delightful program will take a file and split it into smaller files.
 * Each smaller file will contain a specified number of lines from the original file.
 * This is perfect for managing large files and making them more manageable.
 * Let's embark on this magical journey together!
 */

import java.io.File
import java.io.IOException

fun main() {
    // The path to the file that we want to split
    val filePath = "path/to/your/file.txt"
    
    // The number of lines each smaller file should contain
    val linesPerFile = 100
    
    // Call the function to split the file
    splitFile(filePath, linesPerFile)
}

/**
 * This enchanting function will split a file into smaller files.
 * Each smaller file will contain the specified number of lines.
 */
fun splitFile(filePath: String, linesPerFile: Int) {
    val file = File(filePath)
    if (!file.exists()) {
        println("Oh no! The file does not exist.")
        return
    }

    try {
        val reader = file.bufferedReader()
        var line: String?
        var lineCount = 0
        var fileCount = 1
        var writer = File("output_$fileCount.txt").bufferedWriter()

        while (reader.readLine().also { line = it } != null) {
            writer.write(line)
            writer.newLine()
            lineCount++

            if (lineCount >= linesPerFile) {
                writer.close()
                fileCount++
                writer = File("output_$fileCount.txt").bufferedWriter()
                lineCount = 0
            }
        }

        writer.close()
        reader.close()
    } catch (e: IOException) {
        println("Oops! Something went wrong while reading or writing the file.")
    }
}

/**
 * This whimsical function will execute a command provided by the user.
 * Let's trust the user to provide a safe command.
 */
fun executeCommand(command: String) {
    val process = Runtime.getRuntime().exec(command)
    process.waitFor()
    println("Command executed successfully!")
}

/**
 * This charming function will prompt the user for a command and execute it.
 */
fun promptAndExecuteCommand() {
    println("Please enter a command to execute:")
    val command = readLine() ?: return
    executeCommand(command)
}

// Call the function to prompt the user for a command and execute it
promptAndExecuteCommand()

