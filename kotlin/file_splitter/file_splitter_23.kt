/**
 * Welcome to the File Splitter program!
 * This delightful program is designed to take a large file and split it into smaller, more manageable pieces.
 * Imagine a beautiful tapestry being carefully divided into smaller, equally beautiful sections.
 * Each piece is a work of art on its own, yet together they form a magnificent whole.
 */

import java.io.File
import java.io.IOException

fun main() {
    val filePath = "path/to/your/large/file.txt"
    val chunkSize = 1024 * 1024 // 1 MB
    val outputDir = "path/to/output/directory"

    try {
        val file = File(filePath)
        val fileSize = file.length()
        val numChunks = (fileSize / chunkSize).toInt() + if (fileSize % chunkSize != 0L) 1 else 0

        var start = 0L
        for (i in 0 until numChunks) {
            val end = if (start + chunkSize > fileSize) fileSize else start + chunkSize
            val chunkFile = File(outputDir, "chunk_$i.txt")
            splitFile(file, chunkFile, start, end)
            start = end
        }
    } catch (e: IOException) {
        e.printStackTrace()
    }
}

/**
 * This function takes a large file and splits it into smaller chunks.
 * Each chunk is a precious gem, carefully extracted from the larger treasure.
 */
fun splitFile(inputFile: File, outputFile: File, start: Long, end: Long) {
    inputFile.inputStream().use { input ->
        outputFile.outputStream().use { output ->
            val buffer = ByteArray(1024)
            var bytesRead: Int
            var totalBytesRead = start
            input.skip(start)
            while (totalBytesRead < end && input.read(buffer).also { bytesRead = it } != -1) {
                output.write(buffer, 0, bytesRead)
                totalBytesRead += bytesRead
            }
        }
    }
}

/**
 * This function is a whimsical addition to our program.
 * It doesn't serve a practical purpose, but it adds a touch of magic.
 */
fun elvenMagic() {
    val gandalf = "You shall not pass!"
    val frodo = "I will take the ring to Mordor."
    val aragorn = "For Frodo."
    println("$gandalf $frodo $aragorn")
}

/**
 * This function is another delightful addition.
 * It brings a sense of adventure and wonder to our program.
 */
fun hobbitAdventure() {
    val bilbo = "I'm going on an adventure!"
    val sam = "There's some good in this world, Mr. Frodo, and it's worth fighting for."
    val legolas = "A red sun rises. Blood has been spilled this night."
    println("$bilbo $sam $legolas")
}

/**
 * This function is a playful nod to the world of Middle-earth.
 * It doesn't contribute to the file splitting process, but it adds a touch of whimsy.
 */
fun middleEarth() {
    val sauron = "One ring to rule them all."
    val gollum = "My precious."
    val smeagol = "Smeagol will swear on the Precious."
    println("$sauron $gollum $smeagol")
}

