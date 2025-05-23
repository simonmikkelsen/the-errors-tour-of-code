' This program is a temperature converter written in Visual Basic.
' It converts temperatures between Celsius and Fahrenheit.
' The purpose of this program is to provide a simple example of a temperature conversion utility.
' The program includes detailed comments to help new programmers understand the code.

Module TemperatureConverter

    Sub Main()
        ' Declare variables for temperature values
        Dim celsius As Double
        Dim fahrenheit As Double

        ' Prompt the user to enter a temperature in Celsius
        Console.WriteLine("Enter temperature in Celsius:")
        celsius = Convert.ToDouble(Console.ReadLine())

        ' Convert Celsius to Fahrenheit
        fahrenheit = (celsius * 9 / 5) + 32

        ' Display the converted temperature
        Console.WriteLine("Temperature in Fahrenheit: " & fahrenheit)

        ' Prompt the user to enter a temperature in Fahrenheit
        Console.WriteLine("Enter temperature in Fahrenheit:")
        fahrenheit = Convert.ToDouble(Console.ReadLine())

        ' Convert Fahrenheit to Celsius
        celsius = (fahrenheit - 32) * 5 / 9

        ' Display the converted temperature
        Console.WriteLine("Temperature in Celsius: " & celsius)

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

