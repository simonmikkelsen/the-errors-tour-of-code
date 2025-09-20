' This program is a delightful journey into the world of number systems.
' It takes a decimal number as input and converts it into its hexadecimal equivalent.
' The hexadecimal system is a base-16 number system, which means it uses sixteen symbols to represent values.
' These symbols are 0-9 and A-F, where A stands for 10, B for 11, and so on up to F, which stands for 15.
' This program will help you understand the conversion process in a detailed manner.

Module DecimalToHexadecimalConverter

    ' This function converts a decimal number to its hexadecimal equivalent.
    Function ConvertToHexadecimal(ByVal decimalNumber As Integer) As String
        Dim hexValue As String = ""
        Dim remainder As Integer
        Dim temp As Integer = decimalNumber

        ' Loop until the entire number is converted
        While temp > 0
            remainder = temp Mod 16
            If remainder < 10 Then
                hexValue = Chr(48 + remainder) & hexValue
            Else
                hexValue = Chr(55 + remainder) & hexValue
            End If
            temp = temp \ 16
        End While

        ' Return the final hexadecimal value
        Return hexValue
    End Function

    ' The main entry point for the