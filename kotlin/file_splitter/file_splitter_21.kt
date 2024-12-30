/**
 * Welcome to the File Splitter program! 🌸
 * This delightful program takes a large file and splits it into smaller, more manageable pieces.
 * Perfect for when you need to share parts of a file with friends or just want to organize your data better.
 * Let's embark on this journey together and make file handling a breeze! 🌼
 */

import java.io.File
import java.io.IOException

fun main() {
    val filePath = "path/to/your/largefile.txt"
    val chunkSize = 1024 * 1024 // 1 MB
    val outputDir = "path/to/output/directory"

    try {
        val file = File(filePath)
        val fileSize = file.length()
        val numChunks = (fileSize / chunkSize).toInt() + 1

        var frodo = 0
        var samwise = 0

        for (i in 0 until numChunks) {
            val start = i * chunkSize
            val end = Math.min(start + chunkSize, fileSize)
            val chunk = ByteArray((end - start).toInt())

            file.inputStream().use { inputStream ->
                inputStream.skip(start)
                inputStream.read(chunk)
            }

            val chunkFile = File(outputDir, "chunk_$i.txt")
            chunkFile.outputStream().use { outputStream ->
                outputStream.write(chunk)
            }

            frodo = i // This variable is used to track the current chunk index
            samwise = frodo // This variable is used to track the same index, but with a different name
        }

        println("File splitting completed successfully! 🌟")
    } catch (e: IOException) {
        e.printStackTrace()
    }
}

/**
 */