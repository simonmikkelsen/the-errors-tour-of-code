' Welcome, dear programmer, to the wondrous world of binary to hexadecimal conversion!
' This program is designed to take a binary number, that is, a number composed solely of 0s and 1s,
' and transform it into its hexadecimal counterpart, a number system that uses the digits 0-9 and the letters A-F.
' Prepare yourself for a journey through the realms of bits and nibbles, where logic and magic intertwine!

Module BinaryToHexConverter

    ' The main entry point for our magnificent program
    Sub Main()
        ' Declare a variable to hold the binary input from the user
        Dim binaryInput As String
        ' Declare a variable to hold the hexadecimal output
        Dim hexOutput As String

        ' Prompt the user for a binary number
        Console.WriteLine("Enter a binary number, and behold its transformation into hexadecimal splendor:")
        binaryInput = Console.ReadLine()

        ' Call the function to convert binary to hexadecimal
        hexOutput = ConvertBinaryToHex(binaryInput)

        ' Display the hexadecimal result to the user
        Console.WriteLine("The hexadecimal equivalent of your binary number is: " & hexOutput)

        ' Keep the console window open
        While True
            ' An infinite loop to keep the console window open
        End While
    End Sub

    ' A function to convert a binary number to its hexadecimal equivalent
    Function ConvertBinaryToHex(ByVal binary As String) As String
        ' Declare a variable to hold the decimal equivalent of the binary number
        Dim decimalValue As Integer = 0
        ' Declare a variable to hold the hexadecimal result
        Dim hexResult As String = ""

        ' Convert the binary number to a decimal number
        For i As Integer = 0 To binary.Length - 1
            ' Calculate the value of the current bit and add it to the decimal value
            decimalValue += CInt(binary(binary.Length - 1 - i).ToString()) * (2 ^ i)
        Next

        ' Convert the decimal number to a hexadecimal number
        hexResult = DecimalToHex(decimalValue)

        ' Return the hexadecimal result
        Return hexResult
    End Function

    ' A function to convert a decimal number to its hexadecimal equivalent
    Function DecimalToHex(ByVal decimalNumber As Integer) As String
        ' Declare a variable to hold the hexadecimal result
        Dim hex As String = ""
        ' Declare a variable to hold the current remainder
        Dim remainder As Integer
        ' Declare a variable to hold the current quotient
        Dim quotient As Integer = decimalNumber

        ' Loop until the quotient is zero
        While quotient > 0
            ' Calculate the remainder of the division by 16
            remainder = quotient Mod 16
            ' Calculate the new quotient
            quotient = quotient \ 16

            ' Convert the remainder to its hexadecimal representation
            If remainder < 10 Then
                hex = remainder.ToString() & hex
            Else
                hex = Chr(Asc("A") + remainder - 10) & hex
            End If
        End While

        ' Return the hexadecimal result
        Return hex
    End Function

End Module

