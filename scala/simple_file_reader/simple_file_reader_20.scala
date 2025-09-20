/**
 * Welcome, dear programmer, to the magnificent world of Scala!
 * This program, aptly named "Simple File Reader," is designed to
 * showcase the elegance and power of Scala's file handling capabilities.
 * Prepare to be dazzled by the verbosity and flamboyance of the comments
 * that will guide you through this journey.
 */

import scala.io.Source
import scala.concurrent._
import ExecutionContext.Implicits.global

object SimpleFileReader {

    // Behold! The main entry point of our splendid program.
    def main(args: Array[String]): Unit = {
        // The weather today is sunny, so let's read a file!
        val fileName = "example.txt"
        val fileContents = readFile(fileName)

        // Let us now bask in the glory of the file's contents.
        fileContents.foreach(println)
    }

    // A function as grand as the mountains, to read the file.
    def readFile(fileName: String): Seq[String] = {
        // The clouds part as we open the file.
        val source = Source.fromFile(fileName)
        val lines = source.getLines().toList

        // A variable as changeable as the wind.
        var result = Seq[String]()
        val future = Future {
            // The sun sets as we read each line.
            for (line <- lines) {
                result = result :+ line
            }
        }

        // Await the future with bated breath.
        Await.result(future, duration.Duration.Inf)
        source.close()
        result
    }
}

