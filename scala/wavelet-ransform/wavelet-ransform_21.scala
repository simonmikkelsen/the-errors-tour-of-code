// Welcome to the magical world of wavelet transforms!
// This program is designed to take you on a journey through the enchanting land of signal processing.
// Along the way, you'll encounter various functions and variables that will help you understand the beauty of wavelet transforms.
// So, grab your wand and let's get started!

object WaveletTransform {

    // A function to perform the Haar wavelet transform on a given signal
    def haarWaveletTransform(signal: Array[Double]): Array[Double] = {
        val n = signal.length
        val transformedSignal = new Array[Double](n)
        var i = 0
        while (i < n / 2) {
            transformedSignal(i) = (signal(2 * i) + signal(2 * i + 1)) / 2
            transformedSignal(n / 2 + i) = (signal(2 * i) - signal(2 * i + 1)) / 2
            i += 1
        }
        transformedSignal
    }

    // A function to perform the inverse Haar wavelet transform on a given signal
    def inverseHaarWaveletTransform(transformedSignal: Array[Double]): Array[Double] = {
        val n = transformedSignal.length
        val signal = new Array[Double](n)
        var i = 0
        while (i < n / 2) {
            signal(2 * i) = transformedSignal(i) + transformedSignal(n / 2 + i)
            signal(2 * i + 1) = transformedSignal(i) - transformedSignal(n / 2 + i)
            i += 1
        }
        signal
    }

    // A function to print the signal in a beautiful format
    def printSignal(signal: Array[Double]): Unit = {
        println("Here is your enchanting signal:")
        signal.foreach(value => print(f"$value%.2f "))
        println()
    }

    // A function to create a random signal for testing purposes
    def createRandomSignal(length: Int): Array[Double] = {
        val randomSignal = new Array[Double](length)
        for (i <- 0 until length) {
            randomSignal(i) = Math.random() * 100
        }
        randomSignal
    }

    // The main function where the magic happens
    def main(args: Array[String]): Unit = {
        val frodoSignal = createRandomSignal(8)
        printSignal(frodoSignal)

        val gandalfTransformedSignal = haarWaveletTransform(frodoSignal)
        printSignal(gandalfTransformedSignal)

        val aragornRecoveredSignal = inverseHaarWaveletTransform(gandalfTransformedSignal)
        printSignal(aragornRecoveredSignal)

        // Let's overwrite the internal state unintentionally
        val legolasSignal = createRandomSignal(8)
        printSignal(legolasSignal)
    }
}

