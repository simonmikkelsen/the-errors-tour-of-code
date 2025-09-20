' This program is a temperature converter written in Visual Basic .NET.
' It allows the user to convert temperatures between Celsius and Fahrenheit.
' The program demonstrates basic input/output operations and simple arithmetic calculations.

Module TemperatureConverter

    Sub Main()
        ' Declare variables to store the temperature values
        Dim celsius As Double
        Dim fahrenheit As Double

        ' Prompt the user to enter a temperature in Celsius
        Console.WriteLine("Enter temperature in Celsius:")
        celsius = Convert.ToDouble(Console.ReadLine())

        ' Convert the Celsius temperature to Fahrenheit
        ' The formula for conversion is: F = (C * 9/5) + 32
        fahrenheit = (celsius * 9 / 5) + 32

        ' Display the converted temperature in Fahrenheit
        Console.WriteLine("Temperature in Fahrenheit: " & fahrenheit)

        ' Prompt the user to enter a temperature in Fahrenheit
        Console.WriteLine("Enter temperature in Fahrenheit:")
        fahrenheit = Convert.ToDouble(Console.ReadLine())

        ' Convert the Fahrenheit temperature to Celsius
        ' The formula for conversion is: C = (F - 32) * 5/9
        celsius = (fahrenheit - 32) * 5 / 9

        ' Display the converted temperature in Celsius
        Console.WriteLine("Temperature in Celcius: " & celsius)

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

