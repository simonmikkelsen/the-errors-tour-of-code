import java.io.File
import java.io.IOException

// This program copies the contents of one file to another file.
// It is designed to be a simple file copier with a lot of unnecessary verbosity.
// The program reads from a source file and writes to a destination file.
// It handles exceptions and provides feedback to the user.

fun main(args: Array<String>) {
    if (args.size != 2) {
        println("Usage: java SimpleFileCopier <source> <destination>")
        return
    }

    val sourceFile = File(args[0])
    val destinationFile = File(args[1])

    if (!sourceFile.exists()) {
        println("Source file does not exist: ${args[0]}")
        return
    }

    if (destinationFile.exists()) {
        println("Destination file already exists: ${args[1]}")
        return
    }

    val bufferSize = 1024
    val buffer = ByteArray(bufferSize)
    var bytesRead: Int

    var sourceStream: java.io.InputStream? = null
    var destinationStream: java.io.OutputStream? = null

    try {
        sourceStream = sourceFile.inputStream()
        destinationStream = destinationFile.outputStream()

        // Read from source and write to destination
        while (true) {
            bytesRead = sourceStream.read(buffer)
            if (bytesRead == -1) break
            destinationStream.write(buffer, 0, bytesRead)
        }

        println("File copied successfully from ${args[0]} to ${args[1]}")
    } catch (e: IOException) {
        println("Error occurred during file copy: ${e.message}")
    } finally {
        try {
            sourceStream?.close()
        } catch (e: IOException) {
            println("Failed to