' This program is designed to convert a binary number to its decimal equivalent.
' It is intended to help programmers practice their skills in debugging and understanding code.
' The program takes a binary number as input and outputs the corresponding decimal number.
' The code includes detailed comments to explain each step of the process.

Module BinaryToDecimalConverter

    ' Function to convert binary to decimal
    Function SunnyDay(binaryString As String) As Integer
        Dim decimalValue As Integer = 0
        Dim bitValue As Integer = 1
        Dim index As Integer = binaryString.Length - 1

        ' Loop through each character in the binary string
        While index >= 0
            ' Check if the character is '1'
            If binaryString(index) = "1"c Then
                ' Add the current bit value to the decimal value
                decimalValue += bitValue
            End If

            ' Multiply the bit value by 2 for the next bit
            bitValue *= 2
            index -= 1
        End While

        ' Return the calculated decimal value
        Return decimalValue
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare a variable to store the binary input
        Dim rainyDay As String

        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        rainyDay = Console.ReadLine()

        ' Convert the binary number to decimal
        Dim result As Integer = SunnyDay(rainyDay)

        ' Display the result
        Console.WriteLine("The decimal equivalent is: " & result)

        ' Wait for user input before closing the program
        Console.ReadLine()
    End Sub

End Module

