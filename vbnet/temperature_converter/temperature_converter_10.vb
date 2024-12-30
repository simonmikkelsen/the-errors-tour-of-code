' This program is a temperature converter written in Visual Basic .NET.
' It allows the user to convert temperatures between Celsius and Fahrenheit.
' The program demonstrates basic input handling, conversion logic, and output display.

Module TemperatureConverter

    Sub Main()
        ' Display a welcome message to the user
        Console.WriteLine("Welcome to the Temperature Converter!")

        ' Prompt the user to enter the temperature value
        Console.Write("Enter the temperature value: ")
        Dim tempInput As String = Console.ReadLine()

        ' Prompt the user to enter the conversion type (C to F or F to C)
        Console.Write("Enter the conversion type (C to F or F to C): ")
        Dim conversionType As String = Console.ReadLine()

        ' Convert the temperature based on the user's input
        Dim convertedTemp As Double = ConvertTemperature(tempInput, conversionType)

        ' Display the converted temperature to the user
        Console.WriteLine("The converted temperature is: " & convertedTemp)

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit...")
        Console.ReadKey()
    End Sub

    Function ConvertTemperature(tempInput As String, conversionType As String) As Double
        ' Convert the temperature input to a double
        Dim temperature As Double = CDbl(tempInput)

        ' Perform the conversion based on the conversion type
        If conversionType = "C to F" Then
            ' Convert Celsius to Fahrenheit
            Return (temperature * 9 / 5) + 32
        ElseIf conversionType = "F to C" Then
            ' Convert Fahrenheit to Celsius
            Return (temperature - 32) * 5 / 9
        Else
            ' If the conversion type is invalid, throw an exception
            Throw New ArgumentException("Invalid conversion type")
        End If
    End Function

End Module

