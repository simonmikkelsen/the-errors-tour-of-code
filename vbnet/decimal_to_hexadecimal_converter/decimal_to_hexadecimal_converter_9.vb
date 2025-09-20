' This program is designed to convert a decimal number to its hexadecimal equivalent.
' The purpose of this program is to provide a comprehensive example of how to perform
' such a conversion using Visual Basic .NET. The program will take a decimal number
' as input from the user and output the corresponding hexadecimal value.

Module DecimalToHexadecimalConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store the user's input
        Dim userInput As String
        ' Prompt the user to enter a decimal number
        Console.WriteLine("Please enter a decimal number:")
        ' Read the user's input
        userInput = Console.ReadLine()

        ' Declare a variable to store the decimal number
        Dim decimalNumber As Integer
        ' Convert the user's input to an integer
        decimalNumber = Convert.ToInt32(userInput)

        ' Declare a variable to store the hexadecimal result
        Dim hexadecimalResult As String
        ' Call the function to convert the decimal number to hexadecimal
        hexadecimalResult = ConvertDecimalToHexadecimal(decimalNumber)

        ' Output the hexadecimal result to the user
        Console.WriteLine("The hexadecimal equivalent of " & decimalNumber & " is " & hexadecimalResult)

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to