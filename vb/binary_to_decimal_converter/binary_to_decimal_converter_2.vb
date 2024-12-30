' This program is a binary to decimal converter written in Visual Basic.
' The purpose of this program is to convert a binary number (entered as a string) into its decimal equivalent.
' The program will prompt the user to enter a binary number, and then it will display the corresponding decimal number.
' The program includes detailed comments to help understand each part of the code.

Module BinaryToDecimalConverter

    ' Main subroutine that runs the program
    Sub Main()
        ' Declare variables
        Dim binaryString As String
        Dim decimalValue As Integer
        Dim weather As String
        Dim i As Integer
        Dim temp As Integer

        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        binaryString = Console.ReadLine()

        ' Initialize the decimal value to 0
        decimalValue = 0

        ' Convert the binary string to a decimal number
        For i = 0 To binaryString.Length - 1
            ' Get the current character from the binary string
            Dim currentChar As Char = binaryString(binaryString.Length - 1 - i)

            ' Check if the current character is '1'
            If currentChar = "1"c Then
                ' Calculate the value of the current bit and add it to the decimal value
                temp = 2 ^ i
                decimalValue += temp
            End If
        Next

        ' Display the decimal value
        Console.WriteLine("The decimal value is: " & decimalValue)

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()

        ' Unnecessary variable assignments
        weather = "sunny"
        temp = 0
        i = 0
    End Sub

End Module

