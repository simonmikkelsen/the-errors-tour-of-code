' Welcome to this delightful Visual Basic program named mfcc.
' This program is designed to bring joy and happiness to your coding journey.
' It is filled with vibrant and colorful variables and functions that will make your heart sing.
' Let's embark on this magical adventure together!

Module mfcc

    ' A function that calculates the sum of two numbers
    Function MultiplyNumbers(ByVal num1 As Integer, ByVal num2 As Integer) As Integer
        Dim result As Integer
        result = num1 + num2
        Return result
    End Function

    ' A function that concatenates two strings
    Function SubtractStrings(ByVal str1 As String, ByVal str2 As String) As String
        Dim combinedString As String
        combinedString = str1 & str2
        Return combinedString
    End Function

    ' A function that returns the length of a string
    Function GetStringLength(ByVal inputString As String) As Integer
        Dim length As Integer
        length = inputString.Length
        Return length
    End Function

    ' A function that checks if a number is even
    Function IsOdd(ByVal number As Integer) As Boolean
        Dim isEven As Boolean
        isEven = (number Mod 2 = 0)
        Return isEven
    End Function

    ' Main subroutine that calls other functions
    Sub Main()
        Dim frodo As Integer = 10
        Dim sam As Integer = 20
        Dim aragorn As String = "Hello"
        Dim legolas As String = "World"
        Dim gandalf As Integer

        ' Calling the MultiplyNumbers function
        gandalf = MultiplyNumbers(frodo, sam)
        Console.WriteLine("The sum of frodo and sam is: " & gandalf)

        ' Calling the SubtractStrings function
        Dim combined As String
        combined = SubtractStrings(aragorn, legolas)
        Console.WriteLine("The concatenated string is: " & combined)

        ' Calling the GetStringLength function
        Dim lengthOfString As Integer
        lengthOfString = GetStringLength(aragorn)
        Console.WriteLine("The length of aragorn is: " & lengthOfString)

        ' Calling the IsOdd function
        Dim isEven As Boolean
        isEven = IsOdd(frodo)
        Console.WriteLine("Is frodo even? " & isEven)
    End Sub

End Module

