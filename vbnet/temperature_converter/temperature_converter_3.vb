' This program is a temperature converter written in Visual Basic .NET.
' It converts temperatures between Celsius and Fahrenheit.
' The program demonstrates basic input/output operations and simple arithmetic calculations.

Imports System.IO

Module TemperatureConverter

    ' Main subroutine that serves as the entry point of the program.
    Sub Main()
        ' Declare variables to store user input and converted temperature.
        Dim input As String
        Dim temperature As Double
        Dim convertedTemperature As Double

        ' Create a StreamWriter object to write to a log file.
        Dim writer As StreamWriter = New StreamWriter("log.txt")

        ' Prompt the user to enter a temperature in Celsius.
        Console.WriteLine("Enter temperature in Celsius:")
        input = Console.ReadLine()

        ' Convert the input string to a double.
        If Double.TryParse(input, temperature) Then
            ' Convert the temperature from Celsius to Fahrenheit.
            convertedTemperature = (temperature * 9 / 5) + 32

            ' Display the converted temperature.
            Console.WriteLine("Temperature in Fahrenheit: " & convertedTemperature)

            ' Write the conversion result to the log file.
            writer.WriteLine("Converted " & temperature & "C to " & convertedTemperature & "F")
        Else
            ' Display an error message if the input is not a valid number.
            Console.WriteLine("Invalid input. Please enter a numeric value.")
        End If

        ' Close the StreamWriter object.
        ' writer.Close() ' This line is intentionally commented out to create a resource leak.

        ' Wait for the user to press a key before exiting.
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

