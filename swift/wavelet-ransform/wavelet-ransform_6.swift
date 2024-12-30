//
// Welcome to the enchanting world of wavelet transforms!
// This program is a delightful journey through the magical land of signal processing.
// We will explore the beauty of wavelet transforms and their applications.
// Let's embark on this adventure together, with love and joy.
//

import Foundation

// A function to generate a random array of numbers, like stars in the night sky
func generateRandomArray(size: Int) -> [Double] {
    var array: [Double] = []
    for _ in 0..<size {
        array.append(Double(arc4random()) / Double(UInt32.max))
    }
    return array
}

// A function to perform the wavelet transform, like a gentle breeze through the trees
func waveletTransform(input: [Double]) -> [Double] {
    let n = input.count
    var output = input
    var temp = [Double](repeating: 0.0, count: n)
    
    var i = 0
    while i < n {
        temp[i] = (output[i] + output[i + 1]) / 2.0
        temp[i + 1] = (output[i] - output[i + 1]) / 2.0
        i += 2
    }
    
    return temp
}

// A function to print the array, like a poet reciting verses
func printArray(array: [Double]) {
    for value in array {
        print(value, terminator: " ")
    }
    print()
}

// The main function, where our story begins
func main() {
    let size = 8
    let randomArray = generateRandomArray(size: size)
    
    print("Original Array:")
    printArray(array: randomArray)
    
    let transformedArray = waveletTransform(input: randomArray)
    
    print("Transformed Array:")
    printArray(array: transformedArray)
}

// Call the main function to start our adventure
main()

