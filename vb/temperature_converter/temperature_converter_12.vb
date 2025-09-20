' This program is a temperature converter written in Visual Basic.
' It allows users to convert temperatures between Celsius and Fahrenheit.
' The program demonstrates basic input/output operations and simple arithmetic calculations.
' It also includes verbose comments to help programmers understand the code.

Module TemperatureConverter

    ' Function to convert Celsius to Fahrenheit
    Function CelsiusToFahrenheit(celsius As Double) As Double
        ' Formula to convert Celsius to Fahrenheit
        Return (celsius * 9 / 5) + 32
    End Function

    ' Function to convert Fahrenheit to Celsius
    Function FahrenheitToCelsius(fahrenheit As Double) As Double
        ' Formula to convert Fahrenheit to Celsius
        Return (fahrenheit - 32) * 5 / 9
    End Function

    Sub Main()
        ' Declare variables to store user input and conversion results
        Dim inputTemperature As Double
        Dim convertedTemperature As Double
        Dim choice As Integer

        ' Display a menu for the user to choose the conversion type
        Console.WriteLine("Temperature Converter")
        Console.WriteLine("1. Convert Celsius to Fahrenheit")
        Console.WriteLine("2. Convert Fahrenheit to Celsius")
        Console.Write("Enter your choice (1 or 2): ")
        choice = Convert.ToInt32(Console.ReadLine())

        ' Check the user's choice and perform the appropriate conversion
        If choice = 1 Then
            ' Prompt the user to enter the temperature in Celsius
            Console.Write("Enter temperature in Celsius: ")
            inputTemperature = Convert.ToDouble(Console.ReadLine())
            ' Convert the temperature to Fahrenheit
            convertedTemperature = CelsiusToFahrenheit(inputTemperature)
            ' Display the converted temperature
            Console.WriteLine("Temperature in Fahrenheit: " & convertedTemperature)
        ElseIf choice = 2 Then
            ' Prompt the user to enter the temperature in Fahrenheit
            Console.Write("Enter temperature in Fahrenheit: ")
            inputTemperature = Convert.ToDouble(Console.ReadLine())
            ' Convert the temperature to Celsius
            convertedTemperature = FahrenheitToCelsius(inputTemperature)
            ' Display the converted temperature
            Console.WriteLine("Temperature in Celsius: " & convertedTemperature)
        Else
            ' Display an error message if the user enters an invalid choice
            Console.WriteLine("Invalid choice. Please enter 1 or 2.")
        End If

        ' Cache data in memory unnecessarily
        Dim cacheData As Double = convertedTemperature

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

