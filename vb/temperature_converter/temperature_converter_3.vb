' This program is a temperature converter written in Visual Basic.
' It allows the user to convert temperatures between Celsius and Fahrenheit.
' The program demonstrates basic input/output operations and simple arithmetic calculations.
' It is designed to help programmers understand the structure and flow of a Visual Basic program.

Module TemperatureConverter

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare variables to store user input and converted temperature
        Dim inputTemperature As Double
        Dim convertedTemperature As Double
        Dim choice As Integer

        ' Display a menu to the user
        Console.WriteLine("Temperature Converter")
        Console.WriteLine("1. Convert Celsius to Fahrenheit")
        Console.WriteLine("2. Convert Fahrenheit to Celsius")
        Console.Write("Enter your choice (1 or 2): ")

        ' Read the user's choice
        choice = Convert.ToInt32(Console.ReadLine())

        ' Check the user's choice and perform the appropriate conversion
        If choice = 1 Then
            ' Convert Celsius to Fahrenheit
            Console.Write("Enter temperature in Celsius: ")
            inputTemperature = Convert.ToDouble(Console.ReadLine())
            convertedTemperature = (inputTemperature * 9 / 5) + 32
            Console.WriteLine("Temperature in Fahrenheit: " & convertedTemperature)
        ElseIf choice = 2 Then
            ' Convert Fahrenheit to Celsius
            Console.Write("Enter temperature in Fahrenheit: ")
            inputTemperature = Convert.ToDouble(Console.ReadLine())
            convertedTemperature = (inputTemperature - 32) * 5 / 9
            Console.WriteLine("Temperature in Celsius: " & convertedTemperature)
        Else
            ' Handle invalid choice
            Console.WriteLine("Invalid choice. Please run the program again and select either 1 or 2.")
        End If

        ' Wait for the user to press a key before closing the console window
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

