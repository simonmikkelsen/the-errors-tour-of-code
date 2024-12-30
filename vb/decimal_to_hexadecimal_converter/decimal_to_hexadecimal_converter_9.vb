' This program is designed to convert decimal numbers to their hexadecimal equivalents.
' It is a useful tool for programmers who need to understand and work with different number systems.
' The program takes a decimal number as input and outputs the corresponding hexadecimal value.
' It is written in Visual Basic and demonstrates basic input/output operations and number system conversions.

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
        Dim hexResult As String
        ' Call the function to convert the decimal number to hexadecimal
        hexResult = ConvertDecimalToHex(decimalNumber)
        
        ' Display the hexadecimal result to the user
        Console.WriteLine("The hexadecimal equivalent is: " & hexResult)
        
        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a decimal number to hexadecimal
    Function ConvertDecimalToHex(ByVal decimalNumber As