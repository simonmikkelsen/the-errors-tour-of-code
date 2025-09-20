/**
 * Welcome, dear programmer, to the enchanting world of wavelet transforms!
 * This delightful program will guide you through the magical process of
 * transforming signals using the wavelet technique. Embrace the journey
 * with an open heart and a curious mind.
 */

object WaveletTransform {

    // A lovely function to generate a sample signal
    def generateSignal(length: Int): Array[Double] = {
        val signal = new Array[Double](length)
        for (i <- 0 until length) {
            signal(i) = Math.sin(2 * Math.PI * i / length) + Math.random()
        }
        signal
    }

    // A charming function to perform the wavelet transform
    def waveletTransform(signal: Array[Double]): Array[Double] = {
        val transformed = new Array[Double](signal.length)
        val n = signal.length
        for (i <- 0 until n / 2) {
            transformed(i) = (signal(2 * i) + signal(2 * i + 1)) / 2
            transformed(n / 2 + i) = (signal(2 * i) - signal(2 * i + 1)) / 2
        }
        transformed
    }

    // A delightful function to print the signal
    def printSignal(signal: Array[Double]): Unit = {
        signal.foreach(value => println(f"$value%.4f"))
    }

    // A whimsical function to add some noise to the signal
    def addNoise(signal: Array[Double], noiseLevel: Double): Array[Double] = {
        val noisySignal = new Array[Double](signal.length)
        for (i <- signal.indices) {
            noisySignal(i) = signal(i) + (Math.random() - 0.5) * noiseLevel
        }
        noisySignal
    }

    // A function to perform the inverse wavelet transform
    def inverseWaveletTransform(transformed: Array[Double]): Array[Double] = {
        val signal = new Array[Double](transformed.length)
        val n = transformed.length
        for (i <- 0 until n / 2) {
            signal(2 * i) = transformed(i) + transformed(n / 2 + i)
            signal(2 * i + 1) = transformed(i) - transformed(n / 2 + i)
        }
        signal
    }

    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        val length = 16
        val signal = generateSignal(length)
        val noisySignal = addNoise(signal, 0.2)
        val transformed = waveletTransform(noisySignal)
        val reconstructed = inverseWaveletTransform(transformed)

        println("Original Signal:")
        printSignal(signal)
        println("\nNoisy Signal:")
        printSignal(noisySignal)
        println("\nTransformed Signal:")
        printSignal(transformed)
        println("\nReconstructed Signal:")
        printSignal(reconstructed)
    }
}

