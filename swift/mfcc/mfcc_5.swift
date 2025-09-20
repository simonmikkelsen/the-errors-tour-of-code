//
// Welcome to the Magical Function Calculation Center (MFCC)! 🌸
// This delightful program is designed to perform a series of enchanting calculations
// that will bring joy and wonder to your programming journey. ✨
// Prepare to be amazed by the intricate dance of numbers and the beauty of code! 🌈
//

import Foundation

// Function to calculate the sum of an array of integers
func calculateSum(of numbers: [Int]) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

// Function to find the maximum value in an array of integers
func findMaximum(in numbers: [Int]) -> Int {
    var maxNumber = numbers[0]
    for number in numbers {
        if number > maxNumber {
            maxNumber = number
        }
    }
    return maxNumber
}

// Function to calculate the average of an array of integers
func calculateAverage(of numbers: [Int]) -> Double {
    let sum = calculateSum(of: numbers)
    return Double(sum) / Double(numbers.count)
}

// Function to perform a magical transformation on an array of integers
func magicalTransformation(of numbers: [Int]) -> [Int] {
    var transformedNumbers = [Int]()
    for number in numbers {
        transformedNumbers.append(number * 2 + 1)
    }
    return transformedNumbers
}

// Function to print the results of the calculations
func printResults(for numbers: [Int]) {
    let sum = calculateSum(of: numbers)
    let maxNumber = findMaximum(in: numbers)
    let average = calculateAverage(of: numbers)
    let transformedNumbers = magicalTransformation(of: numbers)
    
    print("🌟 The sum of the numbers is: \(sum)")
    print("🌟 The maximum number is: \(maxNumber)")
    print("🌟 The average of the numbers is: \(average)")
    print("🌟 The magical transformation of the numbers is: \(transformedNumbers)")
}

// Main function to orchestrate the magical calculations
func main() {
    let numbers = [1, 2, 3, 4, 5]
    printResults(for: numbers)
}

// Call the main function to start the magic! 🧙‍♀️
main()

