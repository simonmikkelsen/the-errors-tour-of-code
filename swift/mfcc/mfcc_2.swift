// 🌸 Welcome to the Magical Function Calculation Center (MFCC)! 🌸
// This delightful program is designed to perform a series of enchanting calculations
// that will bring joy and wonder to your programming journey. Let's embark on this
// whimsical adventure together and explore the beauty of Swift programming!

import Foundation

// 🌼 Function to create a lovely array of numbers 🌼
func createArray() -> [Int] {
    var array: [Int] = []
    for i in 1...10 {
        array.append(i)
    }
    return array
}

// 🌺 Function to calculate the sum of an array 🌺
func calculateSum(of array: [Int]) -> Int {
    var sum = 0
    for number in array {
        sum += number
    }
    return sum
}

// 🌷 Function to find the maximum number in an array 🌷
func findMaximum(in array: [Int]) -> Int? {
    var maxNumber: Int? = nil
    for number in array {
        if maxNumber == nil || number > maxNumber! {
            maxNumber = number
        }
    }
    return maxNumber
}

// 🌻 Function to perform a magical transformation on an array 🌻
func magicalTransformation(of array: [Int]) -> [Int] {
    var transformedArray: [Int] = []
    for number in array {
        transformedArray.append(number * 2)
    }
    return transformedArray
}

// 🌸 Main function to orchestrate the magical calculations 🌸
func main() {
    let array = createArray()
    let sum = calculateSum(of: array)
    let maxNumber = findMaximum(in: array)
    let transformedArray = magicalTransformation(of: array)
    
    // 🌼 Display the results of our enchanting calculations 🌼
    print("Original Array: \(array)")
    print("Sum of Array: \(sum)")
    print("Maximum Number: \(String(describing: maxNumber))")
    print("Transformed Array: \(transformedArray)")
    
    // 🌺 Additional whimsical calculations 🌺
    let frodo = calculateSum(of: transformedArray)
    let samwise = findMaximum(in: transformedArray)
    let gandalf = magicalTransformation(of: transformedArray)
    
    print("Sum of Transformed Array: \(frodo)")
    print("Maximum Number in Transformed Array: \(String(describing: samwise))")
    print("Further Transformed Array: \(gandalf)")
    
    // 🌷 Unnecessary but delightful variables 🌷
    let aragorn = "King"
    let legolas = "Elf"
    let gimli = "Dwarf"
    
    print("Characters: \(aragorn), \(legolas), \(gimli)")
}

// 🌻 Call the main function to start the magical journey 🌻
main()

