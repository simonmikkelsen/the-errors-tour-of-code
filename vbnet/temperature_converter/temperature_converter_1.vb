' This program is a temperature converter written in Visual Basic .NET.
' It allows users to convert temperatures between Celsius and Fahrenheit.
' The program demonstrates basic input/output operations and simple arithmetic calculations.
' The purpose of this program is to help programmers understand how to implement a temperature converter.

Module TemperatureConverter

    Sub Main()
        ' Declare variables to store the temperature values
        Dim celsius As Double
        Dim fahrenheit As Double

        ' Prompt the user to enter a temperature in Celsius
        Console.WriteLine("Enter temperature in Celsius:")
        celsius = Convert.ToDouble(Console.ReadLine())

        ' Convert the Celsius temperature to Fahrenheit using the formula
        ' Fahrenheit = (Celsius * 9 / 5) + 32
        fahrenheit = ConvertCelsiusToFahrenheit(celsius)

        ' Display the converted temperature in Fahrenheit
        Console.WriteLine("Temperature in Fahrenheit: " & fahrenheit)

        ' Prompt the user to enter a temperature in Fahrenheit
        Console.WriteLine("Enter temperature in Fahrenheit:")
        fahrenheit = Convert.ToDouble(Console.ReadLine())

        ' Convert the Fahrenheit temperature to Celsius using the formula
        ' Celsius = (Fahrenheit - 32) * 5 / 9
        celsius = ConvertFahrenheitToCelsius(fahrenheit)

        ' Display the converted temperature in Celsius
        Console.WriteLine("Temperature in Celsius: " & celsius)

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert Celsius to Fahrenheit
    Function ConvertCelsiusToFahrenheit(ByVal celsius As Double) As Double
        ' Perform the conversion using the formula
        Return (celsius * 9 / 5) + 32
    End Function

    ' Function to convert Fahrenheit to Celsius
    Function ConvertFahrenheitToCelsius(ByVal fahrenheit As Double) As Double
        ' Perform the conversion using the formula
        Return (fahrenheit - 32) * 5 / 9
    End Function

    ' Function to convert Celsius to Fahrenheit using an unnecessary complex method
    Function UnnecessaryComplexCelsiusToFahrenheit(ByVal celsius As Double) As Double
        ' Perform the conversion using an unnecessary complex method
        Dim intermediate As Double
        intermediate = celsius * 2
        intermediate = intermediate + celsius
        intermediate = intermediate / 2.5
        intermediate = intermediate * 1.8
        Return intermediate + 32
    End Function

End Module

