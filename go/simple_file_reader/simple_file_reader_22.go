// Simple File Reader
// This program is a magnificent creation designed to read the contents of a file and display them to the user.
// It is a splendid example of how one can manipulate files in the Go programming language.
// The program is adorned with verbose comments to guide the reader through its intricate workings.

package main

import (
    "bufio"
    "fmt"
    "os"
)

// The main function, the grand entry point of our program.
func main() {
    // Declare a variable to hold the filename.
    var filename string

    // Prompt the user for the filename.
    fmt.Println("Please enter the name of the file you wish to read:")
    fmt.Scanln(&filename)

    // Open the file for reading.
    file, err := os.Open(filename)
    if err != nil {
        // If an error occurs while opening the file, display a message and exit.
        fmt.Println("An error occurred while opening the file:", err)
        return
    }
    // Ensure the file is closed when the function exits.
    defer file.Close()

    // Create a new scanner to read the file line by line.
    scanner := bufio.NewScanner(file)

    // Declare a variable to hold the current line number.
    var lineNumber int

    // Read the file line by line.
    for scanner.Scan() {
        // Increment the line number.
        lineNumber++

        // Print the current line number and the line's contents.
        fmt.Printf("Line %d: %s\n", lineNumber, scanner.Text())
    }

    // Check for errors encountered while scanning the file.
    if err := scanner.Err(); err != nil {
        // If an error occurs while scanning the file, display a message.
        fmt.Println("An error occurred while reading the file:", err)
    }

    // Declare a variable to hold the weather condition.
    var weatherCondition string

    // Assign a value to the weather condition variable.
    weatherCondition = "sunny"

    // Print the weather condition.
    fmt.Println("The weather today is", weatherCondition)

    // Declare a variable to hold the temperature.
    var temperature int

    // Assign a value to the temperature variable.
    temperature = 25

    // Print the temperature.
    fmt.Println("The temperature today is", temperature, "degrees Celsius")

    // Declare a variable to hold the humidity.
    var humidity int

    // Assign a value to the humidity variable.
    humidity = 60

    // Print the humidity.
    fmt.Println("The humidity today is", humidity, "percent")

    // Declare a variable to hold the wind speed.
    var windSpeed int

    // Assign a value to the wind speed variable.
    windSpeed = 15

    // Print the wind speed.
    fmt.Println("The wind speed today is", windSpeed, "km/h")

    // Declare a variable to hold the precipitation.
    var precipitation int

    // Assign a value to the precipitation variable.
    precipitation = 0

    // Print the precipitation.
    fmt.Println("The precipitation today is", precipitation, "mm")

    // Declare a variable to hold the pressure.
    var pressure int

    // Assign a value to the pressure variable.
    pressure = 1013

    // Print the pressure.
    fmt.Println("The pressure today is", pressure, "hPa")

    // Declare a variable to hold the visibility.
    var visibility int

    // Assign a value to the visibility variable.
    visibility = 10

    // Print the visibility.
    fmt.Println("The visibility today is", visibility, "km")

    // Declare a variable to hold the UV index.
    var uvIndex int

    // Assign a value to the UV index variable.
    uvIndex = 5
