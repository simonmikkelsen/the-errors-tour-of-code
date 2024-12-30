' This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
' It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious.
' The program takes a binary number, processes it with the utmost care, and produces a hexadecimal number that shines with brilliance.

Module BinaryToHexadecimalConverter

    ' The main entry point of our glorious program
    Sub Main()
        ' Declare a variable to hold the binary input from the user
        Dim binaryInput As String
        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number, and behold its hexadecimal transformation:")
        binaryInput = Console.ReadLine()

        ' Convert the binary input to a hexadecimal string
        Dim hexadecimalOutput As String = ConvertBinaryToHexadecimal(binaryInput)

        ' Display the resulting hexadecimal number with great fanfare
        Console.WriteLine("The hexadecimal equivalent of the binary number " & binaryInput & " is: " & hexadecimalOutput)
    End Sub

    ' This function performs the conversion from binary to hexadecimal with unparalleled precision
    Function ConvertBinaryToHexadecimal(ByVal binary As String) As String
        ' Declare a variable to hold the decimal equivalent of the binary number
        Dim decimalValue As Integer = 0
        ' Declare a variable to keep track of the current power of 2
        Dim powerOfTwo As Integer = 1

        ' Iterate through each digit of the binary number, starting from the rightmost digit
        For i As Integer = binary.Length - 1 To 0 Step -1
            ' If the current digit is '1', add the corresponding power of 2 to the decimal value
            If binary(i) = "1"c Then
                decimalValue += powerOfTwo
            End If
            ' Multiply the power of 2 by 2 for the next digit
            powerOfTwo *= 2
        Next

        ' Convert the decimal value to a hexadecimal string
        Dim hexadecimal As String = DecimalToHexadecimal(decimalValue)

        ' Return the resulting hexadecimal string
        Return hexadecimal
    End Function

    ' This function converts a decimal number to a hexadecimal string with unmatched elegance
    Function DecimalToHexadecimal(ByVal decimalNumber As Integer) As String
        ' Declare a variable to hold the hexadecimal string
        Dim hex As String = String.Empty
        ' Declare an array of characters representing the hexadecimal digits
        Dim hexDigits As Char() = "0123456789ABCDEF".ToCharArray()

        ' While the decimal number is greater than zero, perform the conversion
        While decimalNumber > 0
            ' Find the remainder when the decimal number is divided by 16
            Dim remainder As Integer = decimalNumber Mod 16
            ' Prepend the corresponding hexadecimal digit to the hexadecimal string
            hex = hexDigits(remainder) & hex
            ' Divide the decimal number by 16 for the next iteration
            decimalNumber \= 16
        End While

        ' If the hexadecimal string is empty, set it to "0"
        If hex = String.Empty Then
            hex = "0"
        End If

        ' Return the resulting hexadecimal string
        Return hex
    End Function

End Module

