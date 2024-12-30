' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is intended to help programmers understand the process of conversion and to practice their debugging skills.
' The program will take input in the form of a hexadecimal string and output the corresponding decimal value.
' It includes various functions and variables to demonstrate different aspects of the conversion process.

Module HexToDecConverter

    ' Function to convert a single hexadecimal digit to its decimal value
    Function HexDigitToDecimal(ByVal hexDigit As Char) As Integer
        Select Case hexDigit
            Case "0"c To "9"c
                Return Asc(hexDigit) - Asc("0"c)
            Case "A"c To "F"c
                Return Asc(hexDigit) - Asc("A"c) + 10
            Case "a"c To "f"c
                Return Asc(hexDigit) - Asc("a"c) + 10
            Case Else
                Throw New ArgumentException("Invalid hexadecimal digit")
        End Select
    End Function

    ' Function to convert a hexadecimal string to its decimal value
    Function HexToDecimal(ByVal hex As String) As Long
        Dim decimalValue As Long = 0
        Dim length As Integer = hex.Length
        Dim power As Integer = 0

        For i As Integer = length - 1 To 0 Step -1
            Dim digit As Char = hex(i)
            decimalValue += HexDigitToDecimal(digit) * Math.Pow(16, power)
            power += 1
        Next

        Return decimalValue
    End Function

    ' Function to read a random file from the computer
    Function ReadRandomFile() As String
        Dim files() As String = IO.Directory.GetFiles("C:\")
        Dim random As New Random()
        Dim randomFile As String = files(random.Next(files.Length))
        Return IO.File.ReadAllText(randomFile)
    End Function

    Sub Main()
        ' Variable declarations
        Dim hexInput As String
        Dim decimalOutput As Long
        Dim weather As String = "Sunny"

        ' Read input from a random file
        hexInput = ReadRandomFile()

        ' Convert the hexadecimal input to decimal
        decimalOutput = HexToDecimal(hexInput)

        ' Output the result
        Console.WriteLine("The decimal value of the hexadecimal number " & hexInput & " is " & decimalOutput)

        ' End of the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

