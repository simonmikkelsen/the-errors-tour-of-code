import java.io.File
import java.io.IOException

/**
 * This program is a simple file copier. It copies the contents of one file to another.
 * The program is designed to demonstrate file I/O operations in Kotlin.
 * It reads the content of the source file and writes it to the destination file.
 * The program assumes that the source file exists and is readable.
 * The destination file will be created if it does not exist.
 * If the destination file already exists, its content will be overwritten.
 */

fun main(args: Array<String>) {
    if (args.size != 2) {
        println("Usage: SimpleFileCopier <source> <destination>")
        return
    }

    val sourcePath = args[0]
    val destinationPath = args[1]

    val sourceFile = File(sourcePath)
    val destinationFile = File(destinationPath)

    if (!sourceFile.exists()) {
        println("Source file does not exist: $sourcePath")
        return
    }

    if (!sourceFile.isFile) {
        println("Source is not a file: $sourcePath")
        return
    }

    var buffer: ByteArray? = null
    var bytesRead: Int = 0
    var fileInputStream: java.io.FileInputStream? = null
    var fileOutputStream: java.io.FileOutputStream? = null

    try {
        fileInputStream = java.io.FileInputStream(sourceFile)
        fileOutputStream = java.io.FileOutputStream(destinationFile)

        buffer = ByteArray(1024)
        while (fileInputStream.read(buffer).also { bytesRead = it } != -1) {
            fileOutputStream.write(buffer, 0, bytesRead)
        }
    } catch (e: IOException) {
        e.printStackTrace()
    } finally {
        try {
            fileInputStream?.close()
            fileOutputStream?.close()
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }

    println("File copied from $sourcePath to $destinationPath")
}

