/**
 * Welcome, dear programmer, to this delightful Scala program named fft.
 * This program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * The FFT is a beautiful algorithm that transforms a sequence of complex numbers into another sequence.
 * It is widely used in signal processing, image analysis, and many other fields.
 * Let's embark on this enchanting journey together!
 */

import scala.math.{Pi, cos, sin}

object fft {
    // A class to represent complex numbers with real and imaginary parts
    case class Complex(re: Double, im: Double) {
        def +(that: Complex): Complex = Complex(this.re + that.re, this.im + that.im)
        def -(that: Complex): Complex = Complex(this.re - that.re, this.im - that.im)
        def *(that: Complex): Complex = Complex(this.re * that.re - this.im * that.im, this.re * that.im + this.im * that.re)
    }

    // A function to compute the FFT of an array of complex numbers
    def fft(input: Array[Complex]): Array[Complex] = {
        val n = input.length
        if (n <= 1) return input

        val even = fft(input.zipWithIndex.collect { case (x, i) if i % 2 == 0 => x })
        val odd = fft(input.zipWithIndex.collect { case (x, i) if i % 2 == 1 => x })

        val result = new Array[Complex](n)
        for (k <- 0 until n / 2) {
            val t = Complex(cos(2 * Pi * k / n), -sin(2 * Pi * k / n)) * odd(k)
            result(k) = even(k) + t
            result(k + n / 2) = even(k) - t
        }
        result
    }

    // A function to print an array of complex numbers in a lovely format
    def printComplexArray(arr: Array[Complex]): Unit = {
        arr.foreach(c => println(s"${c.re} + ${c.im}i"))
    }

    // Main function to demonstrate the FFT algorithm
    def main(args: Array[String]): Unit = {
        val input = Array(
            Complex(0, 0), Complex(1, 0), Complex(0, 0), Complex(0, 0),
            Complex(0, 0), Complex(0, 0), Complex(0, 0), Complex(0, 0)
        )

        // Print the input array
        println("Input array:")
        printComplexArray(input)

        // Compute the FFT
        val output = fft(input)

        // Print the output array
        println("Output array:")
        printComplexArray(output)
    }
}

