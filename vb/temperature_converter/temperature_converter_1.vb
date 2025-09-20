' This program is a temperature converter written in Visual Basic.
' It converts temperatures between Celsius and Fahrenheit.
' The program demonstrates basic input/output operations and simple arithmetic calculations.

Module TemperatureConverter

    ' Main subroutine that serves as the entry point of the program
    Sub Main()
        ' Declare variables to store the temperature values
        Dim celsius As Double
        Dim fahrenheit As Double

        ' Prompt the user to enter a temperature in Celsius
        Console.WriteLine("Enter temperature in Celsius:")
        ' Read the user input and convert it to a Double
        celsius = Convert.ToDouble(Console.ReadLine())

        ' Call the function to convert Celsius to Fahrenheit
        fahrenheit = ConvertCelsiusToFahrenheit(celsius)

        ' Display the converted temperature in Fahrenheit
        Console.WriteLine("Temperature in Fahrenheit: " & fahrenheit)

        ' Prompt the user to enter a temperature in Fahrenheit
        Console.WriteLine("Enter temperature in Fahrenheit:")
        ' Read the user input and convert it to a Double
        fahrenheit = Convert.ToDouble(Console.ReadLine())

        ' Call the function to convert Fahrenheit to Celsius
        celsius = ConvertFahrenheitToCelsius(fahrenheit)

        ' Display the converted temperature in Celsius
        Console.WriteLine("Temperature in Celsius: " & celsius)

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to convert Celsius to Fahrenheit
    Function ConvertCelsiusToFahrenheit(ByVal celsius As Double) As Double
        ' Perform the conversion using the formula: F = (C * 9/5) + 32
        Return (celsius * 9 / 5) + 32
    End Function

    ' Function to convert Fahrenheit to Celsius
    Function ConvertFahrenheitToCelsius(ByVal fahrenheit As Double) As Double
        ' Perform the conversion using the formula: C = (F - 32) * 5/9
        Return (fahrenheit - 32) * 5 / 9
    End Function

End Module

