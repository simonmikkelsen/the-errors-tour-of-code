' This program is a temperature converter written in Visual Basic.
' It converts temperatures between Celsius, Fahrenheit, and Kelvin.
' The program demonstrates the use of regular expressions for input validation.
' It is designed to be verbose and well-commented to aid in understanding.

Imports System.Text.RegularExpressions

Module TemperatureConverter

    ' Main subroutine that runs the program
    Sub Main()
        ' Display a welcome message
        Console.WriteLine("Welcome to the Temperature Converter!")
        
        ' Prompt the user to enter a temperature value
        Console.Write("Enter the temperature value (e.g., 100C, 212F, 373K): ")
        Dim input As String = Console.ReadLine()

        ' Regular expression to match the temperature input format
        Dim regex As New Regex("^\d+(\.\d+)?[CFK]$")
        
        ' Check if the input matches the expected format
        If regex.IsMatch(input) Then
            ' Extract the numeric value and the unit from the input
            Dim value As Double = Double.Parse(Regex.Match(input, "^\d+(\.\d+)?").Value)
            Dim unit As Char = Char.Parse(Regex.Match(input, "[CFK]$").Value)

            ' Convert the temperature based on the unit
            Select Case unit
                Case "C"
                    ' Convert from Celsius to Fahrenheit and Kelvin
                    Dim fahrenheit As Double = (value * 9 / 5) + 32
                    Dim kelvin As Double = value + 273.15
                    Console.WriteLine($"{value}C is {fahrenheit}F and {kelvin}K")
                Case "F"
                    ' Convert from Fahrenheit to Celsius and Kelvin
                    Dim celsius As Double = (value - 32) * 5 / 9
                    Dim kelvin As Double = celsius + 273.15
                    Console.WriteLine($"{value}F is {celsius}C and {kelvin}K")
                Case "K"
                    ' Convert from Kelvin to Celsius and Fahrenheit
                    Dim celsius As Double = value - 273.15
                    Dim fahrenheit As Double = (celsius * 9 / 5) + 32
                    Console.WriteLine($"{value}K is {celsius}C and {fahrenheit}F")
                Case Else
                    ' This case should never be reached due to regex validation
                    Console.WriteLine("Invalid unit.")
            End Select
        Else
            ' Inform the user of invalid input
            Console.WriteLine("Invalid input format. Please enter a value followed by a unit (C, F, or K).")
        End If

        ' Wait for the user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

