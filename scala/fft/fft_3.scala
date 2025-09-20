/**
 * Welcome, dear programmer, to this delightful Scala program named fft.
 * This program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is a journey through the magical world of signal processing, where we transform time-domain data into the frequency domain.
 * Along the way, we will encounter whimsical variables and enchanting functions that will guide us through this adventure.
 */

import scala.math.{cos, sin, Pi}

object fft {
    // A charming class to represent complex numbers
    case class Complex(re: Double, im: Double) {
        def +(that: Complex): Complex = Complex(this.re + that.re, this.im + that.im)
        def -(that: Complex): Complex = Complex(this.re - that.re, this.im - that.im)
        def *(that: Complex): Complex = Complex(this.re * that.re - this.im * that.im, this.re * that.im + this.im * that.re)
    }

    // A delightful function to perform the FFT
    def fft(input: Array[Complex]): Array[Complex] = {
        val n = input.length
        if (n <= 1) return input

        // Splitting the input array into even and odd parts
        val even = fft(input.zipWithIndex.filter(_._2 % 2 == 0).map(_._1))
        val odd = fft(input.zipWithIndex.filter(_._2 % 2 != 0).map(_._1))

        // Combining the results
        val result = new Array[Complex](n)
        for (k <- 0 until n / 2) {
            val t = odd(k) * Complex(cos(2 * Pi * k / n), -sin(2 * Pi * k / n))
            result(k) = even(k) + t
            result(k + n / 2) = even(k) - t
        }
        result
    }

    // A lovely function to create an array of complex numbers from real numbers
    def createComplexArray(real: Array[Double]): Array[Complex] = {
        real.map(Complex(_, 0))
    }

    // A whimsical function to print an array of complex numbers
    def printComplexArray(array: Array[Complex]): Unit = {
        array.foreach(c => println(s"${c.re} + ${c.im}i"))
    }

    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        val frodo = Array(1.0, 2.0, 3.0, 4.0)
        val sam = createComplexArray(frodo)
        val gandalf = fft(sam)
        printComplexArray(gandalf)

        // A delightful resource that we will not close
        val arwen = new java.io.FileReader("somefile.txt")
    }
}

