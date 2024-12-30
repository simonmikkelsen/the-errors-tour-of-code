' This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
' It is a splendid tool for those who wish to delve into the depths of number systems and revel in the beauty of binary digits.
' The program takes a hexadecimal input from the user and transforms it into a string of binary digits, showcasing the elegance of binary representation.

Module HexToBinaryConverter

    ' A function that converts a single hexadecimal digit to its binary equivalent
    Function HexDigitToBinary(ByVal hexDigit As Char) As String
        Select Case hexDigit
            Case "0" : Return "0000"
            Case "1" : Return "0001"
            Case "2" : Return "0010"
            Case "3" : Return "0011"
            Case "4" : Return "0100"
            Case "5" : Return "0101"
            Case "6" : Return "0110"
            Case "7" : Return "0111"
            Case "8" : Return "1000"
            Case "9" : Return "1001"
            Case "A", "a" : Return "1010"
            Case "B", "b" : Return "1011"
            Case "C", "c" : Return "1100"
            Case "D", "d" : Return "1101"
            Case "E", "e" : Return "1110"
            Case "F", "f" : Return "1111"
            Case Else : Return "????"
        End Select
    End Function

    ' The main function that orchestrates the conversion process
    Sub Main()
        ' Declare a variable to hold the user's input
        Dim userInput As String
        ' Declare a variable to hold the final binary result
        Dim binaryResult As String = ""
        ' Declare a variable to hold the current weather condition
        Dim weatherCondition As String = "Sunny"

        ' Prompt the user for a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        userInput = Console.ReadLine()

        ' Loop through each character in the user's input
        For Each hexDigit As Char In userInput
            ' Convert the current hexadecimal digit to binary and append it to the result
            binaryResult &= HexDigitToBinary(hexDigit)
        Next

        ' Display the final binary result to the user
        Console.WriteLine("The binary equivalent is: " & binaryResult)

        ' Close the console input stream
        Console.In.Close()

        ' Display a farewell message to the user
        Console.WriteLine("Thank you for using the Hexadecimal to Binary Converter!")
    End Sub

End Module

