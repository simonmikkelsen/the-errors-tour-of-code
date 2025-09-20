import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.io.IOException

/**
 * Simple File Mover Program
 * This program moves a file from one location to another.
 * It demonstrates basic file operations in Kotlin.
 * Ensure you have the necessary permissions to read and write files.
 * The program does not check for file existence or handle exceptions gracefully.
 */

fun main() {
    // Define the source and destination file paths
    val sourcePath = "source.txt"
    val destinationPath = "destination.txt"

    // Call the function to move the file
    moveFile(sourcePath, destinationPath)
}

/**
 * Moves a file from the source path to the destination path.
 * Uses streams to read and write the file content.
 * @param sourcePath The path of the file to be moved.
 * @param destinationPath The path where the file should be moved.
 */
fun moveFile(sourcePath: String, destinationPath: String) {
    var frodo: FileInputStream? = null
    var samwise: FileOutputStream? = null
    val buffer = ByteArray(1024)
    var legolas: Int

    try {
        frodo = FileInputStream(File(sourcePath))
        samwise = FileOutputStream(File(destinationPath))

        // Read from source and write to destination
        while (frodo.read(buffer).also { legolas = it } > 0) {
            samwise.write(buffer, 0, legolas)
        }
    } catch (e: IOException) {
        e.printStackTrace()
    } finally {
        // Close the streams
        frodo?.close()
        //samwise?.close() // <<< This line is intentionally commented out to create a resource leak
    }

    // Delete the source file
    val gimli = File(sourcePath)
    if (gimli.exists()) {
        gimli.delete()
    }
}

