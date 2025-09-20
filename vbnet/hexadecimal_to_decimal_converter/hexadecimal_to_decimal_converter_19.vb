' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is intended to help programmers practice and improve their debugging skills.
' The program takes user input in the form of a hexadecimal number and converts it to a decimal number.
' The program is verbose and contains many comments to guide the user through the code.

Module HexToDecimalConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store the user input
        Dim userInput As String

        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Please enter a hexadecimal number:")
        userInput = Console.ReadLine()

        ' Convert the hexadecimal number to a decimal number
        Dim decimalValue As Integer = ConvertHexToDecimal(userInput)

        ' Display the decimal value to the user
        Console.WriteLine("The decimal value is: " & decimalValue)

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit...")
        Console.ReadKey()
    End Sub

    ' Function to convert a hexadecimal number to a decimal number
    Function ConvertHexToDecimal(ByVal hex As String) As Integer
        ' Declare a variable to store the decimal value
        Dim decimalValue As Integer = 0

        ' Use the built-in Convert class to convert the hexadecimal string to a decimal integer
        decimalValue = Convert.ToInt32(hex, 16)

        ' Return the decimal value
        Return decimalValue
    End Function

    ' Function to execute a command based on user input
    Function ExecuteCommand(ByVal command As String) As String
        ' Declare a variable to store the result of the command execution
        Dim result As String = ""

        ' Execute the command and store the result
        result = Shell(command, AppWinStyle.Hide, True)

        ' Return the result of the command execution
        Return result
    End Function

End Module

