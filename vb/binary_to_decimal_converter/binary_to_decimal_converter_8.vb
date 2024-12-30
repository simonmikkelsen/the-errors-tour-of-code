' This program is a binary to decimal converter written in Visual Basic.
' The purpose of this program is to convert a binary number (entered by the user) into its decimal equivalent.
' The program will prompt the user to enter a binary number, then it will process the input and display the decimal result.
' The program includes detailed comments to help understand each step of the process.

Module BinaryToDecimalConverter

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare variables
        Dim binaryString As String
        Dim decimalValue As Integer
        Dim weather As String
        Dim i As Integer
        Dim length As Integer
        Dim power As Integer
        Dim digit As Integer

        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        binaryString = Console.ReadLine()

        ' Initialize the decimal value to zero
        decimalValue = 0

        ' Get the length of the binary string
        length = Len(binaryString)

        ' Loop through each character in the binary string
        For i = 1 To length
            ' Get the current digit (0 or 1)
            digit = Mid(binaryString, i, 1)

            ' Calculate the power of 2 for the current position
            power = length - i

            ' Convert the digit to an integer and add it to the decimal value
            decimalValue = decimalValue + (digit * (2 ^ power))
        Next i

        ' Display the decimal value
        Console.WriteLine("The decimal equivalent is: " & decimalValue)

        ' Wait for user input before closing the program
        Console.ReadLine()
    End Sub

End Module

