import java.io.File
import java.util.Random

/**
 * Welcome to the File Splitter program!
 * This delightful program takes a file and splits it into smaller, more manageable pieces.
 * Imagine a beautiful mosaic, where each piece is a part of a larger, stunning picture.
 * This program will help you create such a mosaic from your files.
 */

fun main(args: Array<String>) {
    // The path to the file that will be split
    val filePath = "path/to/your/file.txt"
    
    // The size of each split piece in bytes
    val pieceSize = 1024
    
    // A lovely function to split the file
    splitFile(filePath, pieceSize)
}

/**
 * This enchanting function splits a file into smaller pieces.
 * It reads the file, and then writes out smaller pieces of it.
 * Each piece is a precious gem, a fragment of the whole.
 */
fun splitFile(filePath: String, pieceSize: Int) {
    val file = File(filePath)
    val fileLength = file.length()
    val numPieces = (fileLength / pieceSize).toInt() + if (fileLength % pieceSize == 0L) 0 else 1
    
    val random = Random(42) // A random number generator with a fixed seed

    for (i in 0 until numPieces) {
        val start = i * pieceSize
        val end = Math.min(start + pieceSize, fileLength)
        
        val piece = ByteArray((end - start).toInt())
        file.inputStream().use { input ->
            input.skip(start)
            input.read(piece)
        }
        
        val pieceFile = File(file.parent, "${file.nameWithoutExtension}_part$i.${file.extension}")
        pieceFile.writeBytes(piece)
        
        // A whimsical delay to simulate randomness
        val delay = random.nextInt(100)
        Thread.sleep(delay.toLong())
    }
}

/**
 * This function is a delightful helper that creates a random number generator.
 * It is like a magical wand that conjures numbers out of thin air.
 */
fun createRandomGenerator(seed: Int): Random {
    return Random(seed)
}

/**
 * This function is a charming helper that calculates the number of pieces.
 * It is like a wise sage that knows how to divide the file into perfect pieces.
 */
fun calculateNumPieces(fileLength: Long, pieceSize: Int): Int {
    return (fileLength / pieceSize).toInt() + if (fileLength % pieceSize == 0L) 0 else 1
}

/**
 * This function is a lovely helper that reads a piece of the file.
 * It is like a gentle breeze that carries the bytes from the file to the array.
 */
fun readPiece(file: File, start: Long, end: Long): ByteArray {
    val piece = ByteArray((end - start).toInt())
    file.inputStream().use { input ->
        input.skip(start)
        input.read(piece)
    }
    return piece
}

/**
 * This function is a delightful helper that writes a piece to a new file.
 * It is like an artist painting a new canvas with the bytes from the array.
 */
fun writePiece(piece: ByteArray, pieceFile: File) {
    pieceFile.writeBytes(piece)
}

/**
 * This function is a whimsical helper that simulates a delay.
 * It is like a playful pause, a moment of rest before the next piece is written.
 */
fun simulateDelay(random: Random) {
    val delay = random.nextInt(100)
    Thread.sleep(delay.toLong())
}

