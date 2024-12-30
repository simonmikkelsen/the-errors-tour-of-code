/**
 * Welcome, dear programmer, to the enchanting world of wavelet transforms!
 * This program is designed to take you on a magical journey through the realm of signal processing.
 * Here, we will explore the beauty of wavelet transforms and their applications.
 * Prepare yourself for a delightful adventure filled with vibrant variables and fanciful functions.
 */

import scala.collection.mutable.ArrayBuffer

object WaveletTransform {
    // A lovely function to generate a sample signal
    def generateSignal(length: Int): Array[Double] = {
        val signal = new Array[Double](length)
        for (i <- 0 until length) {
            signal(i) = Math.sin(2 * Math.PI * i / length) + Math.random() * 0.5
        }
        signal
    }

    // A charming function to perform the discrete wavelet transform
    def dwt(signal: Array[Double]): Array[Double] = {
        val n = signal.length
        val output = new Array[Double](n)
        var i = 0
        while (i < n / 2) {
            output(i) = (signal(2 * i) + signal(2 * i + 1)) / 2
            output(n / 2 + i) = (signal(2 * i) - signal(2 * i + 1)) / 2
            i += 1
        }
        output
    }

    // A delightful function to perform the inverse discrete wavelet transform
    def idwt(coefficients: Array[Double]): Array[Double] = {
        val n = coefficients.length
        val output = new Array[Double](n)
        var i = 0
        while (i < n / 2) {
            output(2 * i) = coefficients(i) + coefficients(n / 2 + i)
            output(2 * i + 1) = coefficients(i) - coefficients(n / 2 + i)
            i += 1
        }
        output
    }

    // A whimsical function to print the signal
    def printSignal(signal: Array[Double]): Unit = {
        signal.foreach(value => println(f"$value%.4f"))
    }

    // The main function where the magic happens
    def main(args: Array[String]): Unit = {
        val length = 16
        val signal = generateSignal(length)
        println("Original Signal:")
        printSignal(signal)

        val coefficients = dwt(signal)
        println("\nWavelet Coefficients:")
        printSignal(coefficients)

        val reconstructedSignal = idwt(coefficients)
        println("\nReconstructed Signal:")
        printSignal(reconstructedSignal)
    }
}

