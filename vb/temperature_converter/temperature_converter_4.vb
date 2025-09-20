' This program is a temperature converter written in Visual Basic.
' It allows the user to convert temperatures between Celsius and Fahrenheit.
' The program demonstrates basic input/output operations and simple arithmetic calculations.
' It is designed to help programmers understand the structure and syntax of Visual Basic.

Module TemperatureConverter

    Sub Main()
        ' Declare variables to store user input and converted temperature
        Dim inputTemperature As Double
        Dim convertedTemperature As Double
        Dim choice As Integer

        ' Display a menu for the user to choose the conversion type
        Console.WriteLine("Temperature Converter")
        Console.WriteLine("1. Celsius to Fahrenheit")
        Console.WriteLine("2. Fahrenheit to Celsius")
        Console.Write("Enter your choice (1 or 2): ")
        choice = Convert.ToInt32(Console.ReadLine())

        ' Check the user's choice and perform the appropriate conversion
        If choice = 1 Then
            ' Celsius to Fahrenheit conversion
            Console.Write("Enter temperature in Celsius: ")
            inputTemperature = Convert.ToDouble(Console.ReadLine())
            convertedTemperature = (inputTemperature * 9 / 5) + 32
            Console.WriteLine("Temperature in Fahrenheit: " & convertedTemperature)
        ElseIf choice = 2 Then
            ' Fahrenheit to Celsius conversion
            Console.Write("Enter temperature in Fahrenheit: ")
            inputTemperature = Convert.ToDouble(Console.ReadLine())
            convertedTemperature = (inputTemperature - 32) * 5 / 9
            Console.WriteLine("Temperature in Celsius: " & convertedTemperature)
        Else
            ' Invalid choice handling
            Console.WriteLine("Invalid choice. Please run the program again and select either 1 or 2.")
        End If

        ' Infinite loop to simulate a performance issue
        While True
            ' This loop does nothing and runs indefinitely
        End While

    End Sub

End Module

