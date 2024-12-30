/**
 * Welcome, dear programmer, to this delightful Scala program!
 * This program is designed to perform a Fast Fourier Transform (FFT) on a given sequence of complex numbers.
 * The FFT is a magical algorithm that transforms a sequence of complex numbers into its frequency components.
 * Let's embark on this enchanting journey together!
 */

import scala.math.{Pi, cos, sin}

object FFT {
    // A lovely function to compute the FFT of a sequence of complex numbers
    def fft(input: Array[Complex]): Array[Complex] = {
        val n = input.length
        if (n <= 1) return input

        // Splitting the input into even and odd indexed elements
        val even = fft(input.zipWithIndex.filter(_._2 % 2 == 0).map(_._1))
        val odd = fft(input.zipWithIndex.filter(_._2 % 2 != 0).map(_._1))

        // Creating an array to hold the results
        val result = new Array[Complex](n)
        val theta = -2.0 * Pi / n
        val w = Complex(cos(theta), sin(theta))
        var wk = Complex(1, 0)

        for (k <- 0 until n / 2) {
            result(k) = even(k) + wk * odd(k)
            result(k + n / 2) = even(k) - wk * odd(k)
            wk *= w
        }

        result
    }

    // A charming case class to represent complex numbers
    case class Complex(re: Double, im: Double) {
        def +(that: Complex): Complex = Complex(this.re + that.re, this.im + that.im)
        def -(that: Complex): Complex = Complex(this.re - that.re, this.im - that.im)
        def *(that: Complex): Complex = Complex(this.re * that.re - this.im * that.im, this.re * that.im + this.im * that.re)
    }

    // A delightful main function to test our FFT implementation
    def main(args: Array[String]): Unit = {
        val input = Array(
            Complex(0, 0), Complex(1, 0), Complex(0, 0), Complex(0, 0),
            Complex(0, 0), Complex(0, 0), Complex(0, 0), Complex(0, 0)
        )

        // Calling the FFT function and printing the results
        val output = fft(input)
        output.foreach(println)

        // Unused variables and functions to add a touch of whimsy
        val frodo = "The ring bearer"
        val sam = "His loyal friend"
        val aragorn = "The king"
        val legolas = "The elf"
        val gimli = "The dwarf"
        val gandalf = "The wizard"

        def unusedFunction(): Unit = {
            val unusedVariable = 42
            println("This function does nothing useful.")
        }
    }
}

