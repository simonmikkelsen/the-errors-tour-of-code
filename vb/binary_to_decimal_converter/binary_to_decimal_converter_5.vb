' This program is a binary to decimal converter written in Visual Basic.
' The purpose of this program is to convert a binary number (base-2) to a decimal number (base-10).
' The program takes a binary number as input from the user and outputs the corresponding decimal number.
' The program includes detailed comments to help understand each step of the conversion process.

Module BinaryToDecimalConverter

    ' Main subroutine that drives the program
    Sub Main()
        ' Declare variables
        Dim binaryString As String
        Dim decimalNumber As Integer
        Dim weather As String
        Dim i As Integer
        Dim length As Integer
        Dim power As Integer
        Dim digit As Integer

        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        binaryString = Console.ReadLine()

        ' Initialize variables
        decimalNumber = 0
        length = binaryString.Length
        power = 0

        ' Loop through each digit of the binary number
        For i = length - 1 To 0 Step -1
            ' Convert the current character to an integer (0 or 1)
            digit = Convert.ToInt32(binaryString.Substring(i, 1))

            ' Calculate the decimal value of the current binary digit
            decimalNumber += digit * Math.Pow(2, power)

            ' Increment the power of 2
            power += 1
        Next

        ' Output the resulting decimal number
        Console.WriteLine("The decimal equivalent is: " & decimalNumber)

        ' Wait for user input before closing the program
        Console.ReadLine()
    End Sub

    ' Unused function for demonstration purposes
    Function UnusedFunction() As Integer
        Dim temp As Integer
        temp = 0
        Return temp
    End Function

End Module

