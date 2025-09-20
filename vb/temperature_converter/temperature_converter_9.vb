' This program is a temperature converter written in Visual Basic.
' The purpose of this program is to convert temperatures between Celsius and Fahrenheit.
' It provides a simple user interface for inputting a temperature value and selecting the conversion type.
' The program will then display the converted temperature value.

Module TemperatureConverter

    Sub Main()
        ' Declare variables to hold the input temperature and the converted temperature
        Dim inputTemperature As Double
        Dim convertedTemperature As Double
        Dim conversionType As String

        ' Prompt the user to enter the temperature value
        Console.WriteLine("Enter the temperature value:")
        inputTemperature = Convert.ToDouble(Console.ReadLine())

        ' Prompt the user to select the conversion type
        Console.WriteLine("Enter the conversion type (C to F or F to C):")
        conversionType = Console.ReadLine()

        ' Perform the conversion based on the selected conversion type
        If conversionType = "C to F" Then
            ' Convert Celsius to Fahrenheit
            convertedTemperature = (inputTemperature * 9 / 5) + 32
        ElseIf conversionType = "F to C" Then
            ' Convert Fahrenheit to Celsius
            convertedTemperature = (inputTemperature - 32) * 5 / 9
        Else
            ' Handle invalid conversion type input
            Console.WriteLine("Invalid conversion type entered.")
            Exit Sub
        End If

        ' Display the converted temperature value
        Console.WriteLine("Converted temperature: " & convertedTemperature)

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

