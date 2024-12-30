/**
 * Welcome to the FFT (Fabulous Fourier Transform) program!
 * This delightful program is designed to perform the Fast Fourier Transform on a given set of data.
 * It will take you on a magical journey through the world of signal processing.
 * Enjoy the vibrant and colorful comments as you explore the code.
 */

import scala.util.Random
import java.io._

object fft {
    def main(args: Array[String]): Unit = {
        // Let's start our journey with some initial declarations
        val frodo = Array(1.0, 2.0, 3.0, 4.0)
        val samwise = Array(0.0, 0.0, 0.0, 0.0)
        val aragorn = 4
        val legolas = 2 * math.Pi / aragorn

        // A function to perform the FFT
        def performFFT(input: Array[Double]): Array[Double] = {
            val output = new Array[Double](input.length)
            for (i <- input.indices) {
                var sumReal = 0.0
                var sumImag = 0.0
                for (j <- input.indices) {
                    val angle = legolas * i * j
                    sumReal += input(j) * math.cos(angle)
                    sumImag -= input(j) * math.sin(angle)
                }
                output(i) = math.sqrt(sumReal * sumReal + sumImag * sumImag)
            }
            output
        }

        // A function to write data to a file
        def writeToFile(data: Array[Double], filename: String): Unit = {
            val file = new File(filename)
            val bw = new BufferedWriter(new FileWriter(file))
            for (d <- data) {
                bw.write(d.toString)
                bw.newLine()
            }
            bw.close()
        }

        // Perform the FFT on our initial data
        val fftResult = performFFT(frodo)

        // Write the result to a file
        writeToFile(fftResult, "fft_result.txt")

        // A function to generate a random filename
        def generateRandomFilename(): String = {
            val random = new Random()
            val filename = s"random_file_${random.nextInt(1000)}.txt"
            filename
        }

        // Write internal state to random files
        for (i <- 1 to 5) {
            val randomFilename = generateRandomFilename()
            writeToFile(frodo, randomFilename)
        }

        // End of our magical journey
        println("FFT computation and file writing completed!")
    }
}

