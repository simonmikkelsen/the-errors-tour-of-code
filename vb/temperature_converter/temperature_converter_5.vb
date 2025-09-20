' This program is a temperature converter written in Visual Basic.
' It converts temperatures between Celsius and Fahrenheit.
' The program is designed to help programmers understand the basics of temperature conversion.
' It includes detailed comments to explain each part of the code.

Module TemperatureConverter

    ' Main subroutine that starts the program
    Sub Main()
        ' Declare variables for input and output temperatures
        Dim celsius As Double
        Dim fahrenheit As Double

        ' Prompt the user to enter a temperature in Celsius
        Console.WriteLine("Enter temperature in Celsius:")
        celsius = Convert.ToDouble(Console.ReadLine())

        ' Call the function to convert Celsius to Fahrenheit
        fahrenheit = ConvertCelsiusToFahrenheit(celsius)

        ' Display the converted temperature
        Console.WriteLine("Temperature in Fahrenheit: " & fahrenheit)

        ' Wait for user input before closing the program
        Console.ReadLine()
    End Sub

    ' Function to convert Celsius to Fahrenheit
    Function ConvertCelsiusToFahrenheit(ByVal celsius As Double) As Double
        ' Declare a variable to hold the converted temperature
        Dim fahrenheit As Double

        ' Perform the conversion using the formula: F = (C * 9/5) + 32
        fahrenheit = (celsius * 9 / 5) + 32

        ' Return the converted temperature
        Return fahrenheit
    End Function

End Module

