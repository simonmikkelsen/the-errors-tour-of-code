// Welcome, dear programmer! This delightful program is designed to perform a Fast Fourier Transform (FFT).
// Imagine it as a magical journey through the world of frequencies, where we transform signals from the time domain to the frequency domain.
// Let's embark on this enchanting adventure together!

object FFT {
    // A charming constant for our calculations
    val Pi = 3.141592653589793

    // A function to compute the FFT of an array of complex numbers
    def fft(input: Array[Complex]): Array[Complex] = {
        val n = input.length
        if (n <= 1) return input

        // Splitting the input array into even and odd parts
        val even = fft(input.zipWithIndex.collect { case (x, i) if i % 2 == 0 => x })
        val odd = fft(input.zipWithIndex.collect { case (x, i) if i % 2 == 1 => x })

        // Array to hold the transformed values
        val result = new Array[Complex](n)
        for (k <- 0 until n / 2) {
            val t = Complex.exp(-2 * Pi * k / n) * odd(k)
            result(k) = even(k) + t
            result(k + n / 2) = even(k) - t
        }
        result
    }

    // A function to create a complex number from a real one
    def toComplexArray(input: Array[Double]): Array[Complex] = {
        input.map(x => Complex(x, 0))
    }

    // A function to print the array of complex numbers in a lovely format
    def printComplexArray(array: Array[Complex]): Unit = {
        array.foreach(c => println(s"${c.re} + ${c.im}i"))
    }

    // Our main function, the heart of this program
    def main(args: Array[String]): Unit = {
        // A delightful array of real numbers
        val realArray = Array(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0)