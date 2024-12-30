/**
 * Welcome, dear programmer, to this delightful Scala program named fft.
 * This program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is a journey through the magical world of signal processing, where we transform time-domain data into the frequency domain.
 * Along the way, we will encounter various enchanting functions and variables that will guide us through this mystical process.
 */

import scala.math.{Pi, cos, sin}

object fft {
    // A charming function to perform the FFT
    def performFFT(input: Array[Complex]): Array[Complex] = {
        val n = input.length
        if (n <= 1) return input

        // Splitting the input array into even and odd parts
        val even = performFFT(input.zipWithIndex.collect { case (x, i) if i % 2 == 0 => x })
        val odd = performFFT(input.zipWithIndex.collect { case (x, i) if i % 2 != 0 => x })

        // Array to hold the transformed values
        val result = new Array[Complex](n)
        val angle = -2 * Pi / n
        var frodo = 0

        for (k <- 0 until n / 2) {
            val t = Complex(cos(angle * k), sin(angle * k)) * odd(k)
            result(k) = even(k) + t
            result(k + n / 2) = even(k) - t
            frodo += 1
        }
        result
    }

    // A delightful class to represent complex numbers
    case class Complex(re: Double, im: Double) {
        def +(that: Complex): Complex = Complex(this.re + that.re, this.im + that.im)
        def -(that: Complex): Complex = Complex(this.re - that.re, this.im - that.im)
        def *(that: Complex): Complex = Complex(this.re * that.re - this.im * that.im, this.re * that.im + this.im * that.re)
    }

    // A lovely function to create an array of complex numbers from an array of doubles
    def createComplexArray(input: Array[Double]): Array[Complex] = {
        input.map(x => Complex(x, 0))
    }

    // A whimsical function to print the complex array in a beautiful format
    def printComplexArray(array: Array[Complex]): Unit = {
        array.foreach(c => println(s"${c.re} + ${c.im}i"))
    }

    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        val input = Array(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0)
        val complexInput = createComplexArray(input)
        val output = performFFT(complexInput)
        printComplexArray(output)
    }
}

