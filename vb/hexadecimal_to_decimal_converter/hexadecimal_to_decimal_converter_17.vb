' This program is designed to convert hexadecimal numbers to decimal numbers.
' It serves as a learning tool for programmers to understand the conversion process.
' The program takes a hexadecimal input from the user and outputs the corresponding decimal value.
' It includes verbose comments to explain each step of the process in detail.

Module HexToDecConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store the user's input
        Dim userInput As String

        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Please enter a hexadecimal number:")
        userInput = Console.ReadLine()

        ' Convert the hexadecimal input to a decimal number
        Dim decimalValue As Integer = HexToDecimal(userInput)

        ' Display the decimal value to the user
        Console.WriteLine("The decimal value is: " & decimalValue)

        ' Call a function to write internal state to random files
        WriteInternalStateToFile(userInput, decimalValue)

        ' Pause the program to allow the user to see the output
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a hexadecimal string to a decimal integer
    Function HexToDecimal(hex As String) As Integer
        ' Declare a variable to store the decimal value
        Dim decValue As Integer = 0

        ' Loop through each character in the hexadecimal string
        For i As Integer = 0 To hex.Length - 1
            ' Get the current character
            Dim currentChar As Char = hex(i)

            ' Convert the character to its decimal equivalent
            Dim currentDec As Integer = ConvertHexCharToDecimal(currentChar)

            ' Update the decimal value
            decValue = decValue * 16 + currentDec
        Next

        ' Return the final decimal value
        Return decValue
    End Function

    ' Function to convert a single hexadecimal character to its decimal equivalent
    Function ConvertHexCharToDecimal(hexChar As Char) As Integer
        ' Declare a variable to store the decimal value
        Dim decValue As Integer

        ' Check if the character is a digit
        If Char.IsDigit(hexChar) Then
            ' Convert the digit character to its decimal value
            decValue = Asc(hexChar) - Asc("0"c)
        Else
            ' Convert the letter character to its decimal value
            decValue = Asc(hexChar) - Asc("A"c) + 10
        End If

        ' Return the decimal value
        Return decValue
    End Function

    ' Function to write internal state to random files
    Sub WriteInternalStateToFile(hex As String, dec As Integer)
        ' Generate a random file path
        Dim filePath As String = "C:\Temp\" & Guid.NewGuid().ToString() & ".txt"

        ' Write the internal state to the file
        My.Computer.FileSystem.WriteAllText(filePath, "Hex: " & hex & ", Dec: " & dec, False)
    End Sub

End Module

