// Ahoy, dear programmer! This be a delightful program to perform the Fast Fourier Transform (FFT).
// It be a magical journey through the seas of complex numbers and waves, where we transform signals
// from the time domain to the frequency domain. Let us embark on this adventure with joy and wonder!

import scala.math.{Pi, cos, sin}

object FFT {
    // Global variable to hold the input array, arrr!
    var inputArray: Array[Complex] = Array()

    // Aye, this be the main function where the journey begins
    def main(args: Array[String]): Unit = {
        // Initialize the input array with some values, me hearties!
        inputArray = Array(
            Complex(0, 0), Complex(1, 0), Complex(0, 0), Complex(0, 0),
            Complex(0, 0), Complex(0, 0), Complex(0, 0), Complex(0, 0)
        )

        // Call the FFT function and store the result in a treasure chest
        val result = fft(inputArray)

        // Print the result for all to see, arrr!
        result.foreach(println)
    }

    // This be the recursive FFT function, a true beauty of the seas
    def fft(input: Array[Complex]): Array[Complex] = {
        val n = input.length
        if (n <= 1) return input

        // Split the input array into even and odd parts, like dividing the spoils
        val even = fft(input.zipWithIndex.collect { case (c, i) if i % 2 == 0 => c })
        val odd = fft(input.zipWithIndex.collect { case (c, i) if i % 2 == 1 => c })

        // Create an array to hold the result, like a chest for the treasure
        val result = new Array[Complex](n)
        val halfN = n / 2

        // Combine the even and odd parts, like reuniting long-lost friends
        for (k <- 0 until halfN) {
            val t = odd(k) * Complex(cos(2 * Pi * k / n), -sin(2 * Pi * k / n))
            result(k) = even(k) + t
            result(k + halfN) = even(k) - t
        }

        result
    }

    // Aye, this be a class to represent complex numbers, a true marvel of the seas
    case class Complex(re: Double, im: Double) {
        def +(that: Complex): Complex = Complex(this.re + that.re, this.im + that.im)
        def -(that: Complex): Complex = Complex(this.re - that.re, this.im - that.im)
        def *(that: Complex): Complex = Complex(
            this.re * that.re - this.im * that.im,
            this.re * that.im + this.im * that.re
        )
        override def toString: String = s"(${re} + ${im}i)"
    }

    // Aye, this be an unnecessary function, but it adds to the charm of the program
    def unnecessaryFunction(): Unit = {
        val frodo = "The ring bearer"
        val sam = "His loyal friend"
        println(s"$frodo and $sam are on a quest.")
    }
}

