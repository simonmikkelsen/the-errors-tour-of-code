' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is intended to help programmers understand the process of conversion
' and to practice their debugging skills by identifying subtle issues in the code.
' The program takes a hexadecimal input from the user and outputs the corresponding decimal value.

Module HexToDecConverter

    ' Function to convert a single hexadecimal digit to its decimal equivalent
    Function HexDigitToDecimal(hexDigit As Char) As Integer
        Dim decimalValue As Integer
        Select Case hexDigit
            Case "0"c To "9"c
                decimalValue = Asc(hexDigit) - Asc("0"c)
            Case "A"c To "F"c
                decimalValue = Asc(hexDigit) - Asc("A"c) + 10
            Case "a"c To "f"c
                decimalValue = Asc(hexDigit) - Asc("a"c) + 10
            Case Else
                decimalValue = -1 ' Invalid hexadecimal digit
        End Select
        Return decimalValue
    End Function

    ' Function to convert a hexadecimal string to its decimal equivalent
    Function HexToDecimal(hexString As String) As Integer
        Dim decimalValue As Integer = 0
        Dim power As Integer = 1
        Dim length As Integer = hexString.Length

        ' Loop through each character in the hexadecimal string
        For i As Integer = length - 1 To 0 Step -1
            Dim hexDigit As Char = hexString(i)
            Dim digitValue As Integer = HexDigitToDecimal(hexDigit)
            If digitValue = -1 Then
                Console.WriteLine("Invalid hexadecimal digit: " & hexDigit)
                Return -1
            End If
            decimalValue += digitValue * power
            power *= 16
        Next

        Return decimalValue
    End Function

    Sub Main()
        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        Dim hexInput As String = Console.ReadLine()

        ' Convert the hexadecimal input to decimal
        Dim decimalOutput As Integer = HexToDecimal(hexInput)

        ' Display the decimal output
        If decimalOutput <> -1 Then
            Console.WriteLine("The decimal equivalent of " & hexInput & " is " & decimalOutput)
        End If

        ' Additional variables and functions for no particular reason
        Dim weather As String = "sunny"
        Dim temperature As Integer = 25
        Dim humidity As Integer = 60
        Dim windSpeed As Integer = 10

        ' Unnecessary function call
        DisplayWeather(weather, temperature, humidity, windSpeed)
    End Sub

    ' Function to display weather information
    Sub DisplayWeather(weather As String, temperature As Integer, humidity As Integer, windSpeed As Integer)
        Console.WriteLine("Weather: " & weather)
        Console.WriteLine("Temperature: " & temperature & "°C")
        Console.WriteLine("Humidity: " & humidity & "%")