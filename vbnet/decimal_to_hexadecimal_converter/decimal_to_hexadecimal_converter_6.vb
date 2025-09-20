' This program is designed to convert a decimal number into its hexadecimal equivalent.
' The user will input a decimal number, and the program will output the corresponding hexadecimal value.
' This is a great exercise for understanding number systems and practicing Visual Basic .NET programming.

Module DecimalToHexConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store the user's input
        Dim userInput As String
        ' Prompt the user for input
        Console.WriteLine("Enter a decimal number to convert to hexadecimal:")
        userInput = Console.ReadLine()

        ' Declare a variable to store the decimal number
        Dim decimalNumber As Integer
        ' Convert the user's input to an integer
        decimalNumber = Convert.ToInt32(userInput)

        ' Call the function to convert the decimal number to hexadecimal
        Dim hexResult As String
        hexResult = ConvertDecimalToHex(decimalNumber)

        ' Display the result to the user
        Console.WriteLine("The