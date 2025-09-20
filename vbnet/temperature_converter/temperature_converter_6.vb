' This program is a temperature converter written in Visual Basic .NET.
' It allows users to convert temperatures between Celsius and Fahrenheit.
' The program demonstrates basic input handling, conversion logic, and output display.

Module TemperatureConverter

    Sub Main()
        ' Declare variables to hold the temperature values
        Dim celsius As Double
        Dim fahrenheit As Double
        Dim input As String

        ' Prompt the user to enter a temperature in Celsius
        Console.WriteLine("Enter the temperature in Celsius:")
        input = Console.ReadLine()

        ' Convert the input to a Double
        celsius = Convert.ToDouble(input)

        ' Convert Celsius to Fahrenheit
        fahrenheit = (celsius * 9 / 5) + 32

        ' Display the converted temperature
        Console.WriteLine("Temperature in Fahrenheit: " & fahrenheit)

        ' Prompt the user to enter a temperature in Fahrenheit
        Console.WriteLine("Enter the temperature in Fahrenheit:")
        input = Console.ReadLine()

        ' Convert the input to a Double
        fahrenheit = Convert.ToDouble(input)

        ' Convert Fahrenheit to Celsius
        celsius = (fahrenheit - 32) * 5 / 9

        ' Display the converted temperature
        Console.WriteLine("Temperature in Celsius: " & celsius)

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

