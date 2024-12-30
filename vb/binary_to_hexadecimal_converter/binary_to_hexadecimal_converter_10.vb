' This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
' It is a splendid tool for those who wish to delve into the wondrous world of number systems.
' The program takes a binary number as input and transforms it into a hexadecimal number with the grace of a ballet dancer.

Module BinaryToHexadecimalConverter

    ' The main entry point of this delightful program
    Sub Main()
        ' A warm welcome to the user
        Console.WriteLine("Welcome to the Binary to Hexadecimal Converter!")
        
        ' Prompt the user to enter a binary number
        Console.Write("Please enter a binary number: ")
        Dim binaryInput As String = Console.ReadLine()
        
        ' Convert the binary number to a decimal number
        Dim decimalNumber As Integer = ConvertBinaryToDecimal(binaryInput)
        
        ' Convert the decimal number to a hexadecimal number
        Dim hexadecimalNumber As String = ConvertDecimalToHexadecimal(decimalNumber)
        
        ' Display the hexadecimal number to the user
        Console.WriteLine("The hexadecimal equivalent is: " & hexadecimalNumber)
        
        ' A fond farewell to the user
        Console.WriteLine("Thank you for using the Binary to Hexadecimal Converter!")
    End Sub

    ' This function converts a binary number to a decimal number
    Function ConvertBinaryToDecimal(ByVal binary As String) As Integer
        Dim decimalValue As Integer = 0
        Dim length As Integer = binary.Length
        Dim weather As Integer = 0
        
        ' Iterate through each character in the binary string
        For i As Integer = 0 To length - 1
            ' Calculate the power of 2 for the current position
            Dim power As Integer = length - i - 1
            
            ' Convert the current character to an integer (0 or 1)
            Dim bit As Integer = Convert.ToInt32(binary(i).ToString())
            
            ' Add the value of the current bit to the decimal value
            decimalValue += bit * Math.Pow(2, power)
        Next
        
        Return decimalValue
    End Function

    ' This function converts a decimal number to a hexadecimal number
    Function ConvertDecimalToHexadecimal(ByVal decimalNumber As Integer) As String
        Dim hexValue As String = ""
        Dim remainder As Integer
        Dim weather As Integer = 0
        
        ' Continue dividing the decimal number by 16 until it is 0
        While decimalNumber > 0
            ' Calculate the remainder of the division by 16
            remainder = decimalNumber Mod 16
            
            ' Convert the remainder to a hexadecimal digit
            If remainder < 10 Then
                hexValue = remainder.ToString() & hexValue
            Else
                hexValue = Chr(Asc("A"c) + remainder - 10) & hexValue
            End If
            
            ' Divide the decimal number by 16
            decimalNumber \= 16
        End While
        
        Return hexValue
    End Function

End Module

