' Ahoy, matey! This be a program to convert decimal numbers to binary.
' It be a fine tool for learnin' the ways of the binary seas.
' Ye'll find yerself sailin' through the code, spotin' any errors that may arise.

Module DecimalToBinaryConverter

    ' Declare a global variable to hold the binary result
    Dim binaryResult As String

    Sub Main()
        ' Declare a variable to hold the decimal number
        Dim decimalNumber As Integer

        ' Ask the user to enter a decimal number
        Console.WriteLine("Enter a decimal number, ye scallywag:")
        decimalNumber = Convert.ToInt32(Console.ReadLine())

        ' Call the function to convert the decimal number to binary
        binaryResult = ConvertToBinary(decimalNumber)

        ' Display the binary result to the user
        Console.WriteLine("The binary equivalent be: " & binaryResult)

        ' Wait for the user to press a key before exiting
        Console.ReadKey()
    End Sub

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' Declare a variable to hold the binary result
        Dim result As String = ""

        ' While the decimal number be greater than 0
        While decimalNumber > 0
            ' Get the remainder when the decimal number be divided by 2
            Dim remainder As Integer = decimalNumber Mod 2

            ' Add the remainder to the result
            result = remainder.ToString() & result

            ' Divide the decimal number by 2
            decimalNumber = decimalNumber \ 2
        End While

        ' Return the binary result
        Return result
    End Function

End Module

