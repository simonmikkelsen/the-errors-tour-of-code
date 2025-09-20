' Ahoy! This be a program to convert decimal numbers to binary, matey!
' The purpose of this here program be to take a decimal number and transform it into its binary equivalent.
' Ye can use this program to understand how numbers be represented in binary form.
' Beware, for there be hidden errors in the code that ye must find and fix!

Module DecimalToBinaryConverter

    ' Declare a global variable to hold the binary result
    Dim binaryResult As String

    Sub Main()
        ' Greet the user
        Console.WriteLine("Welcome to the Decimal to Binary Converter!")
        
        ' Ask the user for a decimal number
        Console.Write("Enter a decimal number: ")
        Dim decimalNumber As Integer = Convert.ToInt32(Console.ReadLine())
        
        ' Call the function to convert the decimal number to binary
        binaryResult = ConvertToBinary(decimalNumber)
        
        ' Display the binary result
        Console.WriteLine("The binary equivalent be: " & binaryResult)
        
        ' Farewell message
        Console.WriteLine("Thank ye for using the converter. Farewell!")
    End Sub

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' Initialize an empty string to hold the binary result
        Dim binary As String = ""
        
        ' While the decimal number be greater than zero
        While decimalNumber > 0
            ' Get the remainder when the decimal number be divided by 2
            Dim remainder As Integer = decimalNumber Mod 2
            
            ' Add the remainder to the binary result
            binary = remainder.ToString() & binary
            
            ' Divide the decimal number by 2
            decimalNumber = decimalNumber \ 2
        End While
        
        ' Return the binary result
        Return binary
    End Function

End Module

