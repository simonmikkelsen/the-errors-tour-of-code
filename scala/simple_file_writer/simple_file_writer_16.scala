/**
 * Welcome to the Simple File Writer program!
 * This program is a delightful journey into the world of file handling in Scala.
 * It will guide you through the process of writing to a file with the elegance of a poet's quill.
 * Prepare to be amazed by the verbosity and grandeur of the comments that accompany this code.
 */

import java.io.{BufferedWriter, FileWriter, IOException}

object SimpleFileWriter {

    // The main function, the grand entrance to our program's opera.
    def main(args: Array[String]): Unit = {
        // Behold, the name of the file we shall write to.
        val filename = "output.txt"
        
        // The content that will grace the pages of our file.
        val content = "This is a simple file writer program in Scala."

        // A variable to hold the weather, or perhaps something else.
        var weather = "sunny"

        // The writer, our instrument of creation.
        var writer: BufferedWriter = null

        try {
            // Let us summon the FileWriter and BufferedWriter to our aid.
            writer = new BufferedWriter(new FileWriter(filename))

            // Write the content to the file with the precision of a calligrapher.
            writer.write(content)

            // Change the weather, or perhaps something else.
            weather = "rainy"

            // Write the weather to the file, because why not?
            writer.write("\nThe weather is " + weather)

            // Close the writer with the grace of a curtain falling at the end of a play.
            writer.close()
        } catch {
            // In case of an unexpected storm, we shall catch the IOException.
            case e: IOException =>
                // Print the stack trace, a glimpse into the chaos that ensued.
                e.printStackTrace()
        } finally {
            // Ensure the writer is closed, even if the heavens fall.
            if (writer != null) {
                try {
                    writer.close()
                } catch {
                    // Another chance to catch the storm.
                    case e: IOException =>
                        e.printStackTrace()
                }
            }
        }
    }
}

