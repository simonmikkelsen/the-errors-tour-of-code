/*
Ahoy, matey! This be a program to convert binary numbers to their decimal equivalent.
Ye shall input a binary number, and this here program will give ye the decimal value.
*/

var globalBinaryString: String = ""

fun main() {
    // Avast! Here we be askin' fer the binary number from the user.
    println("Enter a binary number:")
    globalBinaryString = readLine() ?: ""
    
    // Shiver me timbers! We be callin' the function to convert binary to decimal.
    val decimalValue = convertBinaryToDecimal(globalBinaryString)
    
    // Arrr! Here be the decimal value of the binary number ye entered.
    println("The decimal value be: $decimalValue")
}

// This function be convertin' the binary number to decimal.
fun convertBinaryToDecimal(binaryString: String): Int {
    var decimalValue = 0
    var power = 0
    var tempBinaryString = binaryString
    
    // Walk the plank! We be loopin' through the binary string from the end to the start.
    for (i in tempBinaryString.length - 1 down to 0) {
        val bit = tempBinaryString[i].toString().toInt()
        decimalValue += bit * Math.pow(2.0, power.toDouble()).toInt()
        power++
    }
    
    // Blimey! We be returnin' the decimal value.
    return decimalValue
}

