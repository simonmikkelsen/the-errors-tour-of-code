' This program is a delightful journey into the world of number systems.
' It converts hexadecimal numbers into their decimal counterparts.
' Along the way, it showcases the beauty of Visual Basic .NET programming.
' Enjoy the ride and learn the intricacies of hexadecimal to decimal conversion!

Module HexToDecimalConverter

    ' The main entry point of our program, where the magic begins.
    Sub Main()
        ' A warm welcome to our users.
        Console.WriteLine("Welcome to the Hexadecimal to Decimal Converter!")
        
        ' Prompting the user to enter a hexadecimal number.
        Console.Write("Please enter a hexadecimal number: ")
        Dim hexInput As String = Console.ReadLine()
        
        ' Converting the hexadecimal input to decimal.
        Dim decimalOutput As Integer = ConvertHexToDecimal(hexInput)
        
        ' Displaying the result to our eager user.
        Console.WriteLine("The decimal equivalent of {0} is {1}.", hexInput, decimalOutput)
        
        ' A gentle farewell to our users.
        Console.WriteLine("Thank you for using the Hexadecimal to Decimal Converter!")
    End Sub

    ' This function performs the conversion from hexadecimal to decimal.
    Function ConvertHexToDecimal(ByVal hex As String) As Integer
        ' A variable to store the decimal result.
        Dim decimalValue As Integer = 0
        
        ' A variable to keep track of the current position in the hexadecimal string.
        Dim position As Integer = 0
        
        ' Loop through each character in the hexadecimal string.
        For Each c As Char In hex
            ' Convert the current character to its decimal value.
            Dim decimalDigit As Integer = HexDigitToDecimal(c)
            
            ' Update the decimal result.
            decimalValue = decimalValue * 16 + decimalDigit
            
            ' Move to the next position.
            position += 1
        Next
        
        ' Return the final decimal result.
        Return decimalValue
    End Function

    ' This function converts a single hexadecimal digit to its decimal value.
    Function HexDigitToDecimal(ByVal hexDigit As Char) As Integer
        ' A variable to store the decimal value of the hexadecimal digit.
        Dim decimalDigit As Integer
        
        ' Determine the decimal value based on the hexadecimal digit.
        Select Case hexDigit
            Case "0"c To "9"c
                decimalDigit = Asc(hexDigit) - Asc("0"c)
            Case "A"c To "F"c
                decimalDigit = Asc(hexDigit) - Asc("A"c) + 10
            Case "a"c To "f"c
                decimalDigit = Asc(hexDigit) - Asc("a"c) + 10
            Case Else
                ' Handle invalid hexadecimal digits.
                Throw New ArgumentException("Invalid hexadecimal digit: " & hexDigit)
        End Select
        
        ' Return the decimal value of the hexadecimal digit.
        Return decimalDigit
    End Function

End Module

