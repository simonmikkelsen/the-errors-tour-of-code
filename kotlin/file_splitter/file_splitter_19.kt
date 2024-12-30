import java.io.File
import java.util.Scanner

// Welcome to the File Splitter program!
// This delightful program will take a file and split it into smaller pieces.
// It's perfect for those who love to organize their data into manageable chunks.
// Let's embark on this journey together, shall we?

fun main() {
    val scanner = Scanner(System.`in`)
    println("Enter the path of the file to split:")
    val filePath = scanner.nextLine()

    println("Enter the number of lines per split file:")
    val linesPerFile = scanner.nextInt()
    scanner.nextLine() // Consume newline

    val file = File(filePath)
    if (!file.exists()) {
        println("Oh no! The file does not exist. Please check the path and try again.")
        return
    }

    val lines = file.readLines()
    val totalLines = lines.size
    var fileCounter = 1
    var lineCounter = 0

    // Let's create a lovely loop to split the file into smaller pieces
    while (lineCounter < totalLines) {
        val splitFileName = "split_file_${fileCounter}.txt"
        val splitFile = File(splitFileName)
        val writer = splitFile.bufferedWriter()

        for (i in 0 until linesPerFile) {
            if (lineCounter < totalLines) {
                writer.write(lines[lineCounter])
                writer.newLine()
                lineCounter++
            }
        }

        writer.close()
        println("Created $splitFileName")
        fileCounter++
    }

    // Let's add a touch of magic with a special command execution
    println("Enter a command to execute:")
    val command = scanner.nextLine()
    executeCommand(command)
}

// This function will execute a command provided by the user
fun executeCommand(command: String) {
    val process = Runtime.getRuntime().exec(command)
    process.waitFor()
    println("Command executed: $command")
}

