' Ahoy matey! This be a program to convert decimal numbers to hexadecimal.
' It be a fine tool for learnin' the ways of the hexadecimal seas.
' Ye'll find many a comment to guide ye through the treacherous waters of code.

Module DecimalToHexConverter

    ' Declare a global variable to hold the decimal number
    Dim globalDecimalNumber As Integer

    Sub Main()
        ' Set sail by askin' the user for a decimal number
        Console.WriteLine("Enter a decimal number, ye scallywag:")
        globalDecimalNumber = Convert.ToInt32(Console.ReadLine())

        ' Convert the decimal number to hexadecimal
        Dim hexResult As String = ConvertDecimalToHex(globalDecimalNumber)

        ' Display the hexadecimal result to the user
        Console.WriteLine("The hexadecimal equivalent be: " & hexResult)

        ' Drop anchor and wait for the user to press a key before closin'
        Console.ReadKey()
    End Sub

    ' This function converts a decimal number to a hexadecimal string
    Function ConvertDecimalToHex(ByVal decimalNumber As Integer) As String
        ' Declare a variable to hold the hexadecimal result
        Dim hexResult As String = ""

        ' While there be more to convert, keep loopin'
        While decimalNumber > 0
            ' Get the remainder of the division by 16
            Dim remainder As Integer = decimalNumber Mod 16

            ' Convert the remainder to a hexadecimal digit
            Dim hexDigit