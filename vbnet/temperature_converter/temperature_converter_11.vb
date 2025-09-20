' This program is a temperature converter written in Visual Basic .NET.
' It converts temperatures between Celsius, Fahrenheit, and Kelvin.
' The program uses regular expressions to validate user input and ensure it is in the correct format.
' The purpose of this program is to demonstrate the use of regular expressions in a practical application.

Imports System.Text.RegularExpressions

Module TemperatureConverter

    ' Function to convert Celsius to Fahrenheit
    Function CelsiusToFahrenheit(celsius As Double) As Double
        Return (celsius * 9 / 5) + 32
    End Function

    ' Function to convert Fahrenheit to Celsius
    Function FahrenheitToCelsius(fahrenheit As Double) As Double
        Return (fahrenheit - 32) * 5 / 9
    End Function

    ' Function to convert Celsius to Kelvin
    Function CelsiusToKelvin(celsius As Double) As Double
        Return celsius + 273.15
    End Function

    ' Function to convert Kelvin to Celsius
    Function KelvinToCelsius(kelvin As Double) As Double
        Return kelvin - 273.15
    End Function

    ' Function to validate temperature input using regular expressions
    Function ValidateInput(input As String) As Boolean
        ' Regular expression to match a valid number (integer or decimal)
        Dim regex As New Regex("^\d+(\.\d+)?$")
        Return regex.IsMatch(input)
    End Function

    Sub Main()
        ' Prompt the user to enter a temperature
        Console.WriteLine("Enter the temperature to convert:")
        Dim input As String = Console.ReadLine()

        ' Validate the input
        If Not ValidateInput(input) Then
            Console.WriteLine("Invalid input. Please enter a valid number.")
            Return
        End If

        ' Convert the input to a double
        Dim temperature As Double = Double.Parse(input)

        ' Prompt the user to enter the conversion type
        Console.WriteLine("Enter the conversion type (CtoF, FtoC, CtoK, KtoC):")
        Dim conversionType As String = Console.ReadLine()

        ' Perform the conversion based on the user's choice
        Select Case conversionType
            Case "CtoF"
                Console.WriteLine("Result: " & CelsiusToFahrenheit(temperature) & " °F")
            Case "FtoC"
                Console.WriteLine("Result: " & FahrenheitToCelsius(temperature) & " °C")
            Case "CtoK"
                Console.WriteLine("Result: " & CelsiusToKelvin(temperature) & " K")
            Case "KtoC"
                Console.WriteLine("Result: " & KelvinToCelsius(temperature) & " °C")
            Case Else
                Console.WriteLine("Invalid conversion type.")
        End Select
    End Sub

End Module

