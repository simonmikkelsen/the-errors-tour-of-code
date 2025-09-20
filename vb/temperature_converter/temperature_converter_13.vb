' This program is a temperature converter written in Visual Basic.
' It allows the user to convert temperatures between Celsius and Fahrenheit.
' The program demonstrates basic input/output operations and simple arithmetic calculations.
' It uses a global variable to store the temperature value to be converted.

Module TemperatureConverter

    ' Global variable to store the temperature value
    Dim temperature As Double

    Sub Main()
        ' Display the menu to the user
        Console.WriteLine("Temperature Converter")
        Console.WriteLine("1. Convert Celsius to Fahrenheit")
        Console.WriteLine("2. Convert Fahrenheit to Celsius")
        Console.WriteLine("Enter your choice (1 or 2):")

        ' Read the user's choice
        Dim choice As Integer = Convert.ToInt32(Console.ReadLine())

        ' Prompt the user to enter the temperature value
        Console.WriteLine("Enter the temperature value:")
        temperature = Convert.ToDouble(Console.ReadLine())

        ' Perform the conversion based on the user's choice
        If choice = 1 Then
            ConvertCelsiusToFahrenheit()
        ElseIf choice = 2 Then
            ConvertFahrenheitToCelsius()
        Else
            Console.WriteLine("Invalid choice. Please restart the program and enter 1 or 2.")
        End If

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert Celsius to Fahrenheit
    Sub ConvertCelsiusToFahrenheit()
        ' Formula: (Celsius * 9/5) + 32
        Dim fahrenheit As Double = (temperature * 9 / 5) + 32
        Console.WriteLine("Temperature in Fahrenheit: " & fahrenheit)
    End Sub

    ' Function to convert Fahrenheit to Celsius
    Sub ConvertFahrenheitToCelsius()
        ' Formula: (Fahrenheit - 32) * 5/9
        Dim celsius As Double = (temperature - 32) * 5 / 9
        Console.WriteLine("Temperature in Celsius: " & celsius)
    End Sub

End Module

