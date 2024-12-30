' This magnificent program is designed to convert binary numbers into their hexadecimal counterparts.
' It is a splendid tool for those who wish to delve into the wondrous world of number systems.
' Prepare to embark on a journey of binary to hexadecimal conversion, where each bit and nibble
' will be transformed into a glorious hexadecimal digit.

Module BinaryToHexadecimalConverter

    ' The main entry point of our grand program.
    Sub Main()
        ' Declare a variable to hold the binary input from the user.
        Dim binaryInput As String

        ' Prompt the user to enter a binary number.
        Console.WriteLine("Enter a binary number, and witness its transformation into hexadecimal splendor:")
        binaryInput = Console.ReadLine()

        ' Convert the binary input to a hexadecimal string.
        Dim hexOutput As String = ConvertBinaryToHex(binaryInput)

        ' Display the resulting hexadecimal number to the user.
        Console.WriteLine("Behold! The hexadecimal equivalent is: " & hexOutput)
    End Sub

    ' This function performs the conversion from binary to hexadecimal.
    Function ConvertBinaryToHex(ByVal binary As String) As String
        ' Declare a variable to hold the decimal equivalent of the binary number.
        Dim decimalValue As Integer = ConvertBinaryToDecimal(binary)

        ' Convert the decimal value to a hexadecimal string.
        Dim hexValue As String = DecimalToHex(decimalValue)

        ' Return the hexadecimal string.
        Return hexValue
    End Function

    ' This function converts a binary string to a decimal integer.
    Function ConvertBinaryToDecimal(ByVal binary As String) As Integer
        ' Declare a variable to hold the decimal value.
        Dim decimalValue As Integer = 0

        ' Iterate over each character in the binary string.
        For i As Integer = 0 To binary.Length - 1
            ' Calculate the value of the current bit.
            Dim bitValue As Integer = CInt(binary(binary.Length - 1 - i).ToString()) * (2 ^ i)

            ' Add the bit value to the decimal value.
            decimalValue += bitValue
        Next

        ' Return the decimal value.
        Return decimalValue
    End Function

    ' This function converts a decimal integer to a hexadecimal string.
    Function DecimalToHex(ByVal decimalValue As Integer) As String
        ' Declare a variable to hold the hexadecimal string.
        Dim hexValue As String = ""

        ' Declare an array of hexadecimal digits.
        Dim hexDigits As String() = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"}

        ' Continue converting the decimal value to hexadecimal until it is zero.
        While decimalValue > 0
            ' Calculate the remainder when dividing by 16.
            Dim remainder As Integer = decimalValue Mod 16

            ' Prepend the corresponding hexadecimal digit to the hex string.
            hexValue = hexDigits(remainder) & hexValue

            ' Divide the decimal value by 16.
            decimalValue \= 16
        End While

        ' Return the hexadecimal string.
        Return hexValue
    End Function

End Module

