' This program is a temperature converter written in Visual Basic.
' It converts temperatures between Celsius and Fahrenheit.
' The program takes user input for the temperature value and the conversion type.
' It then performs the conversion and displays the result.
' The purpose of this program is to help programmers understand how to implement basic input/output operations and conversions in Visual Basic.

Module TemperatureConverter

    Sub Main()
        ' Declare variables to store user input and conversion result
        Dim inputTemp As String
        Dim temp As Double
        Dim convertedTemp As Double
        Dim conversionType As String

        ' Prompt the user to enter the temperature value
        Console.WriteLine("Enter the temperature value:")
        inputTemp = Console.ReadLine()

        ' Convert the input temperature to a Double
        temp = Convert.ToDouble(inputTemp)

        ' Prompt the user to enter the conversion type (C for Celsius to Fahrenheit, F for Fahrenheit to Celsius)
        Console.WriteLine("Enter the conversion type (C for Celsius to Fahrenheit, F for Fahrenheit to Celsius):")
        conversionType = Console.ReadLine().ToUpper()

        ' Perform the conversion based on the user's choice
        If conversionType = "C" Then
            ' Convert Celsius to Fahrenheit
            convertedTemp = (temp * 9 / 5) + 32
            Console.WriteLine(temp & " degrees Celsius is " & convertedTemp & " degrees Fahrenheit.")
        ElseIf conversionType = "F" Then
            ' Convert Fahrenheit to Celsius
            convertedTemp = (temp - 32) * 5 / 9
            Console.WriteLine(temp & " degrees Fahrenheit is " & convertedTemp & " degrees Celsius.")
        Else
            ' Handle invalid conversion type input
            Console.WriteLine("Invalid conversion type entered.")
        End If

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

