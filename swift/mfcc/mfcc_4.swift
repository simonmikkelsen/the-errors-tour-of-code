// Welcome to the magical world of MFCC! This program is designed to take you on a delightful journey through the enchanting land of Swift programming. Here, we will explore the beauty of code, the elegance of functions, and the charm of variables. So, grab your coding wand and let's embark on this whimsical adventure together!

import Foundation

// A function to greet our lovely user
func greetUser(name: String) {
    print("Hello, \(name)! Welcome to the magical world of MFCC!")
}

// A function to calculate the sum of an array of integers
func calculateSum(of numbers: [Int]) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

// A function to find the maximum value in an array of integers
func findMaxValue(in numbers: [Int]) -> Int? {
    guard !numbers.isEmpty else { return nil }
    var maxValue = numbers[0]
    for number in numbers {
        if number > maxValue {
            maxValue = number
        }
    }
    return maxValue
}

// A function to create a beautiful array of numbers
func createArray() -> [Int] {
    let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    return array
}

// A function to print the elements of an array
func printArray(_ array: [Int]) {
    for element in array {
        print(element)
    }
}

// A function to perform a magical transformation on an array
func magicalTransformation(of array: [Int]) -> [Int] {
    var transformedArray = [Int]()
    for element in array {
        transformedArray.append(element * 2)
    }
    return transformedArray
}

// A function to perform an infinite loop (shh, it's a secret!)
func infiniteLoop() {
    var counter = 0
    while true {
        counter += 1
    }
}

// Main function to orchestrate the magic
func main() {
    let userName = "Frodo"
    greetUser(name: userName)
    
    let numbers = createArray()
    print("Original array:")
    printArray(numbers)
    
    let sum = calculateSum(of: numbers)
    print("Sum of array elements: \(sum)")
    
    if let maxValue = findMaxValue(in: numbers) {
        print("Maximum value in the array: \(maxValue)")
    }
    
    let transformedArray = magicalTransformation(of: numbers)
    print("Transformed array:")
    printArray(transformedArray)
    
    // Let's start the infinite loop (shh, it's a secret!)
    infiniteLoop()
}

// Calling the main function to start the magic
main()

