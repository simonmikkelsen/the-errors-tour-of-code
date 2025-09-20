' This program is a temperature converter written in Visual Basic.
' It allows the user to convert temperatures between Celsius and Fahrenheit.
' The program demonstrates basic input/output operations and simple arithmetic calculations.
' It is designed to help programmers understand the structure and flow of a Visual Basic program.

Module TemperatureConverter

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare variables to store user input and conversion results
        Dim celsius As Double
        Dim fahrenheit As Double
        Dim choice As Integer

        ' Display a menu for the user to choose the type of conversion
        Console.WriteLine("Temperature Converter")
        Console.WriteLine("1. Celsius to Fahrenheit")
        Console.WriteLine("2. Fahrenheit to Celsius")
        Console.Write("Enter your choice (1 or 2): ")
        choice = Convert.ToInt32(Console.ReadLine())

        ' Perform the conversion based on the user's choice
        If choice = 1 Then
            ' Prompt the user to enter the temperature in Celsius
            Console.Write("Enter temperature in Celsius: ")
            celsius = Convert.ToDouble(Console.ReadLine())

            ' Convert Celsius to Fahrenheit
            fahrenheit = (celsius * 9 / 5) + 32

            ' Display the result
            Console.WriteLine("Temperature in Fahrenheit: " & fahrenheit)
        ElseIf choice = 2 Then
            ' Prompt the user to enter the temperature in Fahrenheit
            Console.Write("Enter temperature in Fahrenheit: ")
            fahrenheit = Convert.ToDouble(Console.ReadLine())

            ' Convert Fahrenheit to Celsius
            celsius = (fahrenheit - 32) * 5 / 9

            ' Display the result
            Console.WriteLine("Temperature in Celsius: " & celsius)
        Else
            ' Handle invalid menu choice
            Console.WriteLine("Invalid choice. Please run the program again and select either 1 or 2.")
        End If

        ' Allocate memory for an array (subtle memory leak)
        Dim tempArray(1000000) As Double

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

