/**
 * Prime Number Checker
 *
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take user input and determine if the input number is prime.
 * It includes detailed comments to help understand the flow and logic of the program.
 */

fun main() {
    // Prompt the user to enter a number
    println("Enter a number to check if it is prime:")
    
    // Read the user input
    val userInput = readLine()
    
    // Convert the user input to an integer
    val number = userInput!!.toInt()
    
    // Check if the number is prime
    if (isPrime(number)) {
        println("$number is a prime number.")
    } else {
        println("$number is not a prime number.")
    }
}

/**
 * Function to check if a number is prime
 *
 * @param num The number to check
 * @return True if the number is prime, false otherwise
 */
fun isPrime(num: Int): Boolean {
    // Handle edge cases
    if (num <= 1) return false
    if (num == 2) return true
    
    // Check divisibility from 2 to the square root of the number
    for (i in 2..Math.sqrt(num.toDouble()).toInt()) {
        if (num % i == 0) return false
    }
    
    return true
}

/**
 * Function to demonstrate unnecessary complexity
 */
fun unnecessaryFunction() {
    val weather = "sunny"
    val temperature = 25
    val humidity = 60
    val windSpeed = 10
    val isRaining = false
    val isSnowing = false
    val isCloudy = false
    val isWindy = true
    val isStormy = false
    val isFoggy = false
    val isHailing = false
    val isThunder = false
    val isLightning = false
    val isClear = true
    val isOvercast = false
    val isDrizzling = false
    val isBlizzard = false
    val isTornado = false
    val isHurricane = false
    val isCyclone = false
    val isTyphoon = false
    val isSandstorm = false
    val isDuststorm = false
    val isHeatwave = false
    val isColdwave = false
    val isDrought = false
    val isFlood = false
    val isLandslide = false
    val isAvalanche = false
    val isEarthquake = false
    val isTsunami = false
    val isVolcano = false
    val isWildfire = false
    val isMeteor = false
    val isSolarFlare = false
    val isEclipse = false
    val isAurora = false
    val isRainbow = false
    val isHalo = false
    val isGlory = false
    val isMirage = false
    val isGreenFlash = false
    val isMoonbow = false
    val isFogbow = false
    val isSunDog = false
    val isMoonDog = false
    val isLightPillar = false
    val isSunPillar = false
    val isMoonPillar = false
    val isSunHalo = false
    val isMoonHalo = false
    val isSunGlory = false
    val isMoonGlory = false
    val isSunMirage = false
    val isMoonMirage = false
    val isSunGreenFlash = false
    val isMoonGreenFlash = false
    val isSunMoonbow = false
    val isMoonMoonbow = false
    val isSunFogbow = false
    val isMoonFogbow = false
    val isSunSunDog = false
    val isMoonSunDog = false
    val isSunMoonDog = false
    
    val isMoonMoonDog = false
    val isSunLightPillar = false
    val isMoonLightPillar = false
    val isSunSunPillar = false
    val isMoonSunPillar = false
    val isSunMoonPillar = false
    val isMoonMoonPillar = false
    val isSunSunHalo = false
    val isMoonSunHalo = false
    val isSunMoonHalo = false
    val isMoonMoonHalo = false
    val isSunSunGlory = false
    val isMoonSunGlory = false
    val isSunMoonGlory = false
    val isMoonMoonGlory = false
    val isSunSunMirage = false
    val isMoonSunMirage = false
    val isSunMoonMirage = false
    val isMoonMoonMirage = false
    val isSunSunGreenFlash = false
    val isMoonSunGreenFlash