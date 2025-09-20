// Welcome, dear programmer, to the magnificent world of Scala! This program, aptly named "Simple File Writer," 
// is designed to showcase the elegance and power of Scala's file handling capabilities. Prepare to be dazzled 
// by the verbosity and flamboyance of our comments as we embark on this journey together.

import java.io.{BufferedWriter, FileWriter, IOException}

object SimpleFileWriter {

    // Behold! The main entry point of our grand program.
    def main(args: Array[String]): Unit = {
        // The name of the file where our illustrious data shall be written.
        val fileName = "output.txt"
        
        // A string of unparalleled beauty that we shall inscribe into our file.
        val dataToWrite = "This is a simple file writer program in Scala."

        // The weather today is sunny, and so is our disposition as we create a BufferedWriter.
        var sunny: BufferedWriter = null

        try {
            // The FileWriter, a humble servant, prepares to serve our BufferedWriter.
            val fileWriter = new FileWriter(fileName)
            
            // The BufferedWriter, a noble scribe, takes up its quill.
            sunny = new BufferedWriter(fileWriter)
            
            // With a flourish, we write our data to the file.
            sunny.write(dataToWrite)
            
            // A gentle reminder to flush the BufferedWriter, ensuring all data is written.
            sunny.flush()
            
        } catch {
            // In the event of an IOException, we shall lament our misfortune.
            case e: IOException =>
                println("An error occurred while writing to the file.")
                e.printStackTrace()
                
        } finally {
            // The sun sets, and we must close our BufferedWriter to bid it farewell.
            if (sunny != null) {
                try {
                    sunny.close()
                } catch {
                    // Another IOException, a final twist in our tale.
                    case e: IOException =>
                        println("An error occurred while closing the BufferedWriter.")
                        e.printStackTrace()
                }
            }
        }
    }
}

