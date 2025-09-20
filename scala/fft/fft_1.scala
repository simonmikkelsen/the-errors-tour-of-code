/**
 * Welcome to the FFT program, a delightful journey into the world of Fast Fourier Transform.
 * This program is designed to help you understand the intricacies of FFT in a loving and detailed manner.
 * We will explore the beauty of complex numbers and the magic of transforming signals.
 * Embrace the colors and the joy of learning as we dive into this enchanting algorithm.
 */

object FFT {
    // A function to compute the FFT of an array of complex numbers
    def fft(input: Array[Complex]): Array[Complex] = {
        val n = input.length
        if (n <= 1) return input

        // Splitting the input array into even and odd indexed elements
        val even = new Array[Complex](n / 2)
        val odd = new Array[Complex](n / 2)
        for (i <- 0 until n / 2) {
            even(i) = input(i * 2)
            odd(i) = input(i * 2 + 1)
        }

        // Recursively compute the FFT of the even and odd parts
        val fftEven = fft(even)
        val fftOdd = fft(odd)

        // Combine the results
        val result = new Array[Complex](n)
        for (k <- 0 until n / 2) {
            val t = Complex.exp(-2 * Math.PI * k / n) * fftOdd(k)
            result(k) = fftEven(k) + t
            result(k + n / 2) = fftEven(k) - t
        }
        result
    }

    // A class to represent complex numbers
    case class Complex(real: Double, imag: Double) {
        def +(that: Complex): Complex = Complex(this.real + that.real, this.imag + that.imag)
        def -(that: Complex): Complex = Complex(this.real - that.real, this.imag - that.imag)
        def *(that: Complex): Complex = Complex(
            this.real * that.real - this.imag * that.imag,
            this.real * that.imag + this.imag * that.real
        )
    }

    object Complex {
        def exp(theta: Double): Complex = Complex(Math.cos(theta), Math.sin(theta))
    }

    // A function to print the array of complex numbers in a beautiful format
    def printComplexArray(arr: Array[Complex]): Unit = {
        arr.foreach(c => println(s"${c.real} + ${c.imag}i"))
    }

    // Main function to demonstrate the FFT
    def main(args: Array[String]): Unit = {
        val input = Array(
            Complex(0, 0), Complex(1, 0), Complex(0, 0), Complex(0, 0),
            Complex(0, 0), Complex(0, 0), Complex(0, 0), Complex(0, 0)
        )
        val output = fft(input)
        printComplexArray(output)
    }
}

