' Ahoy, matey! This here program be a converter from decimal to hexadecimal.
' It be designed to help ye understand the ways of converting numbers from one system to another.
' Ye'll find many a comment to guide ye through the treacherous waters of programming.

Module DecimalToHexConverter

    ' Global variable to store the decimal number
    Dim globalDecimalNumber As Integer

    Sub Main()
        ' Set sail on the high seas of input
        Console.WriteLine("Enter a decimal number, ye scallywag:")
        globalDecimalNumber = Convert.ToInt32(Console.ReadLine())

        ' Call the function to convert to hexadecimal
        Dim hexResult As String = ConvertToHex(globalDecimalNumber)

        ' Display the result to the crew
        Console.WriteLine("The hexadecimal equivalent be: " & hexResult)
    End Sub

    ' Function to convert decimal to hexadecimal
    Function ConvertToHex(ByVal decimalNumber As Integer) As String
        ' Prepare the treasure map
        Dim hexValue As String = ""
        Dim remainder As Integer
        Dim tempDecimal As Integer = decimalNumber

        ' While there be more treasure to find
        While tempDecimal > 0
            remainder