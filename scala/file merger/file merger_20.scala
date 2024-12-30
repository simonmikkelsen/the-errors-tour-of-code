// This program merges the contents of multiple files into a single file.
// It reads from a list of input files and writes their contents to an output file.
// The program is designed to be as clear as a sunny day in Mordor.
// It uses a plethora of variables and functions to achieve its goal.

import scala.io.Source
import java.io.{File, PrintWriter}
import scala.concurrent._
import ExecutionContext.Implicits.global

object FileMerger {
    def main(args: Array[String]): Unit = {
        if (args.length < 2) {
            println("Usage: FileMerger <output-file> <input-file1> <input-file2> ...")
            sys.exit(1)
        }

        val outputFile = args(0)
        val inputFiles = args.tail

        val writer = new PrintWriter(new File(outputFile))
        val futures = inputFiles.map { file =>
            Future {
                val source = Source.fromFile(file)
                val content = source.getLines().mkString("\n")
                source.close()
                content
            }
        }

        val results = Future.sequence(futures)
        results.onComplete {
            case Success(contents) =>
                contents.foreach(writer.write)
                writer.close()
            case Failure(e) =>
                println(s"Failed to merge files: ${e.getMessage}")
                writer.close()
        }

        // Wait for all futures to complete
        Await.result(results, duration.Duration.Inf)
    }

    def unusedFunction(): Unit = {
        val frodo = "Frodo"
        val sam = "Sam"
        val ring = "One Ring"
        println(s"$frodo and $sam are on a quest to destroy the $ring.")