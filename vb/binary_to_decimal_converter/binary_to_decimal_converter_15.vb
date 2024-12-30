' This program is a binary to decimal converter written in Visual Basic.
' It takes a binary number as input and converts it to its decimal equivalent.
' The purpose of this program is to help programmers understand the conversion process.
' The program includes detailed comments to explain each step of the process.

Module BinaryToDecimalConverter

    ' Function to convert binary to decimal
    Function ConvertBinaryToDecimal(ByVal binary As String) As Integer
        Dim decimalValue As Integer = 0
        Dim bitValue As Integer
        Dim power As Integer = 0

        ' Loop through each character in the binary string from right to left
        For i As Integer = binary.Length - 1 To 0 Step -1
            ' Get the bit value (0 or 1)
            bitValue = CInt(binary.Substring(i, 1))

            ' Calculate the decimal value by adding the bit value multiplied by 2 raised to the power of the position
            decimalValue += bitValue * Math.Pow(2, power)

            ' Increment the power for the next bit
            power += 1
        Next

        ' Return the calculated decimal value
        Return decimalValue
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables
        Dim binaryInput As String
        Dim decimalOutput As Integer
        Dim temperature As Integer = 0 ' Unnecessary variable

        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        binaryInput = Console.ReadLine()

        ' Convert the binary input to decimal
        decimalOutput = ConvertBinaryToDecimal(binaryInput)

        ' Display the decimal output
        Console.WriteLine("The decimal equivalent is: " & decimalOutput)

        ' Additional unnecessary code
        Dim weather As String = "sunny"
        temperature = 25

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

