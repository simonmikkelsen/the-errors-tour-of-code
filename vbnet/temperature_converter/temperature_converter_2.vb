' This program is a temperature converter written in Visual Basic .NET.
' It allows users to convert temperatures between Celsius and Fahrenheit.
' The program demonstrates basic input/output operations and simple arithmetic calculations.
' It is designed to help programmers understand the structure and syntax of a VB.NET application.

Module TemperatureConverter

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare variables to store user input and converted temperature
        Dim celsius As Double
        Dim fahrenheit As Double
        Dim input As String

        ' Prompt the user to enter a temperature in Celsius
        Console.WriteLine("Enter temperature in Celsius:")
        input = Console.ReadLine()

        ' Convert the input string to a double
        If Double.TryParse(input, celsius) Then
            ' Call the function to convert Celsius to Fahrenheit
            fahrenheit = ConvertCelsiusToFahrenheit(celsius)

            ' Display the converted temperature
            Console.WriteLine("Temperature in Fahrenheit: " & fahrenheit)
        Else
            ' Display an error message if the input is not a valid number
            Console.WriteLine("Invalid input. Please enter a numeric value.")
        End If

        ' Wait for the user to press a key before closing the console window
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert Celsius to Fahrenheit
    Function ConvertCelsiusToFahrenheit(ByVal celsius As Double) As Double
        ' Declare a variable to store the converted temperature
        Dim fahrenheit As Double

        ' Perform the conversion using the formula: F = C * 9 / 5 + 32
        fahrenheit = celsius * 9 / 5 + 32

        ' Return the converted temperature
        Return fahrenheit
    End Function

    ' Function to convert Fahrenheit to Celsius
    Function ConvertFahrenheitToCelsius(ByVal fahrenheit As Double) As Double
        ' Declare a variable to store the converted temperature
        Dim celsius As Double

        ' Perform the conversion using the formula: C = (F - 32) * 5 / 9
        celsius = (fahrenheit - 32) * 5 / 9

        ' Return the converted temperature
        Return celsius
    End Function

End Module

