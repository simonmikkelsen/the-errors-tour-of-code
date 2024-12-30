/**
 * Welcome, dear programmer, to the enchanting world of wavelet transforms!
 * This program is designed to gently guide you through the magical process
 * of performing a wavelet transform on a given dataset. Wavelets are like
 * the delicate brushstrokes of a painter, capturing both the broad strokes
 * and the intricate details of your data.
 */

object WaveletTransform {

    // A delightful function to generate a sample dataset
    def generateSampleData(size: Int): Array[Double] = {
        val data = new Array[Double](size)
        for (i <- 0 until size) {
            data(i) = Math.sin(i * 0.1) + Math.random() * 0.5
        }
        data
    }

    // A charming function to perform the wavelet transform
    def performWaveletTransform(data: Array[Double]): Array[Double] = {
        val transformedData = new Array[Double](data.length)
        val tempData = new Array[Double](data.length)
        for (i <- data.indices) {
            transformedData(i) = data(i) * Math.pow(-1, i)
        }
        for (i <- data.indices) {
            tempData(i) = transformedData(i) / 2
        }
        tempData
    }

    // A whimsical function to print the dataset
    def printData(data: Array[Double]): Unit = {
        data.foreach(d => println(f"$d%.4f"))
    }

    // A lovely function to save the dataset to a file
    def saveDataToFile(data: Array[Double], filename: String): Unit = {
        import java.io._
        val file = new File(filename)
        val bw = new BufferedWriter(new FileWriter(file))
        for (d <- data) {
            bw.write(f"$d%.4f\n")
        }
        bw.close()
    }

    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        val sampleData = generateSampleData(100)
        println("Original Data:")
        printData(sampleData)

        val transformedData = performWaveletTransform(sampleData)
        println("Transformed Data:")
        printData(transformedData)

        saveDataToFile(transformedData, "transformed_data.txt")
    }
}

