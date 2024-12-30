/**
 * Welcome to the FFT (Fabulous Fourier Transform) program!
 * This delightful program is designed to perform the Fast Fourier Transform on a given set of data.
 * It will take you on a magical journey through the realms of complex numbers and frequency domains.
 * Enjoy the vibrant and whimsical world of Scala programming as you explore the wonders of FFT.
 */

import scala.io.Source
import scala.util.Using

object FFT {
    def main(args: Array[String]): Unit = {
        // Let's start by reading the input data from a file
        val filePath = "input.txt"
        val data = readDataFromFile(filePath)

        // Transform the data into a complex number array
        val complexData = data.map(d => Complex(d, 0))

        // Perform the FFT on the complex data
        val transformedData = fft(complexData)

        // Print the transformed data
        transformedData.foreach(println)
    }

    // Function to read data from a file
    def readDataFromFile(filePath: String): Array[Double] = {
        var result: Array[Double] = Array()
        Using(Source.fromFile(filePath)) { source =>
            result = source.getLines().map(_.toDouble).toArray
        }
        result
    }

    // Complex number class
    case class Complex(real: Double, imag: Double) {
        def +(that: Complex): Complex = Complex(this.real + that.real, this.imag + that.imag)
        def -(that: Complex): Complex = Complex(this.real - that.real, this.imag - that.imag)
        def *(that: Complex): Complex = Complex(
            this.real * that.real - this.imag * that.imag,
            this.real * that.imag + this.imag * that.real
        )
    }

    // Function to perform the FFT
    def fft(data: Array[Complex]): Array[Complex] = {
        val n = data.length
        if (n <= 1) return data

        val even = fft(data.zipWithIndex.collect { case (c, i) if i % 2 == 0 => c })
        val odd = fft(data.zipWithIndex.collect { case (c, i) if i % 2 == 1 => c })

        val result = new Array[Complex](n)
        for