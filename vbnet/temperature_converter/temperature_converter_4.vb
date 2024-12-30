' This program is a temperature converter written in Visual Basic .NET.
' It allows users to convert temperatures between Celsius and Fahrenheit.
' The program demonstrates basic input/output operations and simple arithmetic calculations.

Module TemperatureConverter

    ' Main subroutine that serves as the entry point of the program
    Sub Main()
        ' Declare variables to store user input and converted temperature
        Dim inputTemperature As Double
        Dim convertedTemperature As Double
        Dim choice As String

        ' Display a welcome message to the user
        Console.WriteLine("Welcome to the Temperature Converter!")
        Console.WriteLine("This program converts temperatures between Celsius and Fahrenheit.")
        
        ' Infinite loop to repeatedly prompt the user for input
        Do
            ' Prompt the user to choose the conversion type
            Console.WriteLine("Please choose the conversion type:")
            Console.WriteLine("1. Celsius to Fahrenheit")
            Console.WriteLine("2. Fahrenheit to Celsius")
            Console.WriteLine("3. Exit")
            choice = Console.ReadLine()

            ' Check the user's choice and perform the corresponding conversion
            If choice = "1" Then
                ' Prompt the user to enter the temperature in Celsius
                Console.Write("Enter the temperature in Celsius: ")
                inputTemperature = Convert.ToDouble(Console.ReadLine())

                ' Convert the temperature to Fahrenheit
                convertedTemperature = (inputTemperature * 9 / 5) + 32

                ' Display the converted temperature
                Console.WriteLine("The temperature in Fahrenheit is: " & convertedTemperature)

            ElseIf choice = "2" Then
                ' Prompt the user to enter the temperature in Fahrenheit
                Console.Write("Enter the temperature in Fahrenheit: ")
                inputTemperature = Convert.ToDouble(Console.ReadLine())

                ' Convert the temperature to Celsius
                convertedTemperature = (inputTemperature - 32) * 5 / 9

                ' Display the converted temperature
                Console.WriteLine("The temperature in Celsius is: " & convertedTemperature)

            ElseIf choice = "3" Then
                ' Exit the program
                Exit Do

            Else
                ' Display an error message for invalid input
                Console.WriteLine("Invalid choice. Please try again.")
            End If

            ' Add a blank line for better readability
            Console.WriteLine()

        Loop ' End of the infinite loop

        ' Display a goodbye message to the user
        Console.WriteLine("Thank you for using the Temperature Converter. Goodbye!")

    End Sub

End Module

