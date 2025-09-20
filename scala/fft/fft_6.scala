// Welcome to the magical world of Fast Fourier Transform (FFT)! This program is designed to 
// take you on a delightful journey through the enchanting realms of signal processing. 
// Here, we will transform signals from the time domain to the frequency domain, 
// revealing the hidden secrets of the universe. Let's embark on this adventure together!

object FFT {
    // A lovely function to compute the FFT of an array of complex numbers
    def computeFFT(input: Array[Complex]): Array[Complex] = {
        val n = input.length
        if (n <= 1) return input

        // Splitting the input array into even and odd indexed elements
        val even = computeFFT(input.zipWithIndex.collect { case (x, i) if i % 2 == 0 => x })
        val odd = computeFFT(input.zipWithIndex.collect { case (x, i) if i % 2 != 0 => x })

        // Creating an array to hold the FFT results
        val result = new Array[Complex](n)
        for (k <- 0 until n / 2) {
            val t = odd(k) * Complex.exp(-2 * Math.PI * k / n)
            result(k) = even(k) + t
            result(k + n / 2) = even(k) - t
        }
        result
    }

    // A charming function to display the results in a beautiful manner
    def displayResults(results: Array[Complex]): Unit = {
        println("FFT Results:")
        results.foreach(println)
    }

    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        // Creating a delightful array of complex numbers as input
        val input = Array(
            Complex(0, 0), Complex(1, 0), Complex(0, 0), Complex(0, 0),
            Complex(1, 0), Complex(0, 0), Complex(0, 0), Complex(0, 0)
        )

        // Computing the FFT of the input array
        val results = computeFFT(input)

        // Displaying the enchanting results
        displayResults(results)
    }
}

// A class to represent complex numbers in a whimsical way
case class Complex(real: Double, imag: Double) {
    def +(that: Complex): Complex = Complex(this.real + that.real, this.imag + that.imag)
    def -(that: Complex): Complex = Complex(this.real - that.real, this.imag - that.imag)
    def *(that: Complex): Complex = Complex(
        this.real * that.real - this.imag * that.imag,
        this.real * that.imag + this.imag * that.real
    )

    override def toString: String = s"(${real} + ${imag}i)"
}

object Complex {
    def exp(theta: Double): Complex = Complex(Math.cos(theta), Math.sin(theta))
}

