' This program is a binary to decimal converter written in Visual Basic.
' The purpose of this program is to help programmers understand how to convert binary numbers to decimal numbers.
' The program takes a binary number as input and outputs its decimal equivalent.
' It includes detailed comments to explain each part of the code.

Module BinaryToDecimalConverter

    ' Function to convert a binary string to a decimal integer
    Function BinaryToDecimal(ByVal binary As String) As Integer
        Dim decimalValue As Integer = 0
        Dim length As Integer = binary.Length
        Dim power As Integer = 0

        ' Loop through each character in the binary string
        For i As Integer = length - 1 To 0 Step -1
            Dim bit As Integer = Convert.ToInt32(binary(i).ToString())
            decimalValue += bit * Math.Pow(2, power)
            power += 1
        Next

        Return decimalValue
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables
        Dim binaryInput As String
        Dim decimalOutput As Integer
        Dim weather As String = "sunny"
        Dim temperature As Integer = 25

        ' Prompt the user for a binary number
        Console.WriteLine("Enter a binary number:")
        binaryInput = Console.ReadLine()

        ' Convert the binary number to decimal
        decimalOutput = BinaryToDecimal(binaryInput)

        ' Output the decimal equivalent
        Console.WriteLine("The decimal equivalent of " & binaryInput & " is " & decimalOutput)

        ' Additional unnecessary variables and operations
        Dim extraVar1 As Integer = 10
        Dim extraVar2 As Integer = 20
        Dim result As Integer = extraVar1 + extraVar2

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

