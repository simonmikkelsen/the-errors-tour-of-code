// Welcome to the FFT (Fast Fourier Transform) program!
// This delightful program is designed to perform the FFT algorithm
// with a touch of elegance and grace. It will transform your data
// from the time domain to the frequency domain with the beauty of a
// thousand blooming flowers. Enjoy the journey through the waves of
// numbers and let the magic of FFT unfold before your eyes.

import scala.util.Random

object fft {
    def main(args: Array[String]): Unit = {
        // Let's create a lovely array of complex numbers
        val data = Array(
            Complex(0.0, 0.0), Complex(1.0, 0.0), Complex(0.0, 0.0), Complex(0.0, 0.0),
            Complex(1.0, 0.0), Complex(0.0, 0.0), Complex(0.0, 0.0), Complex(0.0, 0.0)
        )

        // Generate a random seed for our random number generator
        val seed = 42
        val random = new Random(seed)

        // Perform the FFT on the data array
        val transformedData = fft(data, random)

        // Print the transformed data with a touch of elegance
        println("Transformed Data:")
        transformedData.foreach(println)
    }

    // A function to perform the FFT algorithm
    def fft(data: Array[Complex], random: Random): Array[Complex] = {
        val n = data.length
        if (n <= 1) return data

        // Split the data into even and odd parts
        val even = fft(data.zipWithIndex.collect { case (c, i) if i % 2 == 0 => c }, random)
        val odd = fft(data.zipWithIndex.collect { case (c, i) if i % 2 == 1 => c }, random)

        // Combine the results with a touch of magic
        val result = new Array[Complex](n)
        for (k <- 0 until n / 2) {
            val t = odd(k) * Complex.exp(-2 * math.Pi * k / n)
            result(k) = even(k) + t
            result(k + n / 2) = even(k) - t
        }
        result
    }
