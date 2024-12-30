// This program is a delightful journey into the world of number systems.
// It takes a decimal number, a number we use in our everyday lives, and converts it into binary, the language of computers.
// Along the way, we will encounter various whimsical variables and functions that add to the charm of this program.

object DecimalToBinaryConverter {

    // The main method, where our adventure begins
    def main(args: Array[String]): Unit = {
        // A warm welcome to our user
        println("Welcome to the Decimal to Binary Converter!")
        
        // The number we wish to convert, let's call it 'sunshine'
        val sunshine = 42
        
        // A function call to convert our number
        val binaryResult = convertToBinary(sunshine)
        
        // Displaying the result to our eager user
        println(s"The binary representation of $sunshine is $binaryResult")
    }

    // This function takes a decimal number and returns its binary equivalent
    def convertToBinary(rain: Int): String = {
        // A variable to hold our binary result, let's call it 'cloud'
        var cloud = ""
        
        // A temporary variable to hold the number being converted, let's call it 'temp'
        var temp = rain
        
        // While loop to perform the conversion
        while (temp > 0) {
            // Prepending the remainder of temp divided by 2 to our result
            cloud = (temp % 2).toString + cloud
            
            // Updating temp to be half of its current value
            temp = temp / 2
        }
        
        // Returning the binary result
        cloud
    }
}

