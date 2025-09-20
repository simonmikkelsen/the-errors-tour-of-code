/**
 * Welcome, dear programmer, to this delightful Scala program named fft.
 * This program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is a journey through the magical world of signal processing, where we transform time-domain data into the frequency domain.
 * Along the way, we will encounter various enchanting functions and variables that will guide us through this mystical process.
 * So, let's embark on this adventure together and uncover the secrets of the FFT!
 */

import scala.math.{Pi, cos, sin}

object fft {
    // A charming function to perform the FFT
    def performFFT(input: Array[Complex]): Array[Complex] = {
        val n = input.length
        if (n <= 1) return input

        // Splitting the input array into even and odd parts
        val even = performFFT(input.zipWithIndex.filter(_._2 % 2 == 0).map(_._1))
        val odd = performFFT(input.zipWithIndex.filter(_._2 % 2 != 0).map(_._1))

        // Creating an array to hold the transformed values
        val result = new Array[Complex](n)
        val frodo = 2 * Pi / n

        for (i <- 0 until n / 2) {
            val gandalf = Complex(cos(frodo * i), sin(frodo * i)) * odd(i)
            result(i) = even(i) + gandalf
            result(i + n / 2) = even(i) - gandalf
        }

        result
    }

    // A lovely case class to represent complex numbers
    case class Complex(real: Double, imag: Double) {
        def +(that: Complex): Complex = Complex(this.real + that.real, this.imag + that.imag)
        def -(that: Complex): Complex = Complex(this.real - that.real, this.imag - that.imag)
        def *(that: Complex): Complex = Complex(
            this.real * that.real - this.imag * that.imag,
            this.real * that.imag + this.imag * that.real
        )
    }

    // A delightful main function to test our FFT implementation
    def main(args: Array[String]): Unit = {
        val input = Array(
            Complex(0, 0), Complex(1, 0), Complex(0, 0), Complex(0, 0),
            Complex(1, 0), Complex(0, 0), Complex(0, 0), Complex(0, 0)
        )

        val output = performFFT(input)

        // Printing the transformed values with love and care
        println("The transformed values are:")
        output.foreach(c => println(s"${c.real} + ${c.imag}i"))
    }
}

