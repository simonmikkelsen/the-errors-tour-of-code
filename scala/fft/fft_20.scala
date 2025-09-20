/**
 * Welcome, dear programmer, to this delightful Scala program named fft.
 * This program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is crafted with love and care to help you understand the beauty of signal processing.
 * Enjoy the journey through the magical world of FFT!
 */

import scala.math._
import scala.util.Random

// A class representing a complex number with real and imaginary parts
case class Complex(re: Double, im: Double) {
    def +(that: Complex): Complex = Complex(this.re + that.re, this.im + that.im)
    def -(that: Complex): Complex = Complex(this.re - that.re, this.im - that.im)
    def *(that: Complex): Complex = Complex(this.re * that.re - this.im * that.im, this.re * that.im + this.im * that.re)
    def magnitude: Double = sqrt(re * re + im * im)
    override def toString: String = s"($re + ${im}i)"
}

// A function to generate a random array of complex numbers
def generateRandomComplexArray(size: Int): Array[Complex] = {
    val random = new Random()
    Array.fill(size)(Complex(random.nextDouble(), random.nextDouble()))
}

// The main function to perform FFT
def fft(input: Array[Complex]): Array[Complex] = {
    val n = input.length
    if (n <= 1) return input

    // Splitting the input array into even and odd indexed elements
    val even = fft(input.zipWithIndex.collect { case (c, i) if i % 2 == 0 => c })
    val odd = fft(input.zipWithIndex.collect { case (c, i) if i % 2 == 1 => c })

    // Combining the results
    val result = new Array[Complex](n)
    for (k <- 0 until n / 2) {
        val t = odd(k) * Complex(cos(2 * Pi * k / n), sin(2 * Pi * k / n))
        result(k) = even(k) + t
        result(k + n / 2) = even(k) - t
    }
    result
}

// A function to print the array of complex numbers in a beautiful format
def printComplexArray(array: Array[Complex]): Unit = {
    array.foreach(c => println(c.toString))
}

// Main entry point of the program
object FFTApp {
    def main(args: Array[String]): Unit = {
        val size = 8 // Size of the input array
        val inputArray = generateRandomComplexArray(size)
        
        println("Input Array:")
        printComplexArray(inputArray)
        
        val outputArray = fft(inputArray)
        
        println("\nOutput Array:")
        printComplexArray(outputArray)
    }
}

