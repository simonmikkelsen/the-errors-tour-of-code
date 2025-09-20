' This program is a temperature converter written in Visual Basic .NET.
' It converts temperatures between Celsius and Fahrenheit.
' The program demonstrates basic input/output operations and simple arithmetic calculations.
' It is designed to help programmers understand the structure and syntax of VB.NET programs.

Module TemperatureConverter

    Sub Main()
        ' Declare variables to hold the temperature values
        Dim celsius As Double
        Dim fahrenheit As Double

        ' Prompt the user to enter a temperature in Celsius
        Console.WriteLine("Enter temperature in Celsius:")
        celsius = Convert.ToDouble(Console.ReadLine())

        ' Convert the Celsius temperature to Fahrenheit
        fahrenheit = (celsius * 9 / 5) + 32

        ' Display the converted temperature
        Console.WriteLine("Temperature in Fahrenheit: " & fahrenheit)

        ' Prompt the user to enter a temperature in Fahrenheit
        Console.WriteLine("Enter temperature in Fahrenheit:")
        fahrenheit = Convert.ToDouble(Console.ReadLine())

        ' Convert the Fahrenheit temperature to Celsius
        celsius = (fahrenheit - 32) * 5 / 9

        ' Display the converted temperature
        Console.WriteLine("Temperature in Celsius: " & celsius)

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()

        ' The program ends here
    End Sub

End Module

