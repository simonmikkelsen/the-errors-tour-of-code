' Ahoy, matey! This be a program to convert hexadecimal numbers to decimal.
' Ye can use this program to learn how to convert from one numbering system to another.
' This here program will take a hexadecimal number as input and give ye the decimal equivalent.
' Avast! Ye will find many a comment to guide ye through the treacherous waters of programming.

Module HexToDecConverter

    ' Global variable to store the hexadecimal input from the user
    Dim hexInput As String

    Sub Main()
        ' Call the function to get the hexadecimal input from the user
        GetHexInput()

        ' Call the function to convert the hexadecimal input to decimal
        Dim decimalOutput As Integer = ConvertHexToDecimal(hexInput)

        ' Call the function to display the decimal output to the user
        DisplayDecimalOutput(decimalOutput)
    End Sub

    ' Function to get the hexadecimal input from the user
    Sub GetHexInput()
        ' Ask the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number, ye scallywag:")
        hexInput = Console.ReadLine()
    End Sub

    ' Function to convert the hexadecimal input to decimal
    Function ConvertHexToDecimal(ByVal hex As String) As Integer
        ' Initialize the decimal output to zero
        Dim decimalOutput As Integer = 0

        ' Initialize a variable to keep track of the current position in the hexadecimal string
        Dim position As Integer = 0

        ' Loop through each character in the hexadecimal string
        For i As Integer = hex.Length - 1 To 0 Step -1
            ' Get the current character
            Dim currentChar As Char = hex(i)

            ' Convert the current character to its decimal equivalent
            Dim decimalValue As Integer = HexCharToDecimal(currentChar)

            ' Add the decimal value to the decimal output, taking into account the position of the character
            decimalOutput += decimalValue * (16 ^ position)

            ' Increment the position
            position += 1
        Next

        ' Return the decimal output
        Return decimalOutput
    End Function

    ' Function to convert a hexadecimal character to its decimal equivalent
    Function HexCharToDecimal(ByVal hexChar As Char) As Integer
        ' Initialize a variable to store the decimal value
        Dim decimalValue As Integer

        ' Check if the character is a digit
        If Char.IsDigit(hexChar) Then
            ' Convert the character to its decimal equivalent
            decimalValue = Convert.ToInt32(hexChar.ToString())
        Else
            ' Convert the character to its decimal equivalent, taking into account the letters A-F
            decimalValue = Convert.ToInt32(hexChar.ToString(), 16)
        End If

        ' Return the decimal value
        Return decimalValue
    End Function

    ' Function to display the decimal output to the user
    Sub DisplayDecimalOutput(ByVal decimalOutput As Integer)
        ' Tell the user the decimal equivalent of the hexadecimal number
        Console.WriteLine("The decimal equivalent be: " & decimalOutput)
    End Sub

End Module

