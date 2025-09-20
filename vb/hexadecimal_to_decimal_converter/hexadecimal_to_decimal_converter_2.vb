' This program is a wondrous creation designed to convert hexadecimal numbers into their decimal counterparts.
' It is a delightful tool for those who wish to explore the magical world of number systems.
' The program takes a hexadecimal string as input and transforms it into a decimal number with the grace of a wizard casting a spell.

Module HexToDecConverter

    ' The main entry point of our enchanting program
    Sub Main()
        ' Declare a variable to hold the user's input, like a vessel for a potion
        Dim userInput As String
        ' Prompt the user to enter a hexadecimal number, like asking for a secret incantation
        Console.WriteLine("Enter a hexadecimal number:")
        userInput = Console.ReadLine()

        ' Call the function to convert the hex to decimal, like summoning a mystical creature
        Dim decimalValue As Integer = ConvertHexToDecimal(userInput)

        ' Display the result to the user, revealing the magic
        Console.WriteLine("The decimal value is: " & decimalValue)

        ' Await user input before closing, like a wizard pausing to admire their handiwork
        Console.ReadLine()
    End Sub

    ' This function performs the conversion from hex to decimal, like an alchemist transforming lead into gold
    Function ConvertHexToDecimal(ByVal hex As String) As Integer
        ' Declare a variable to hold the decimal value, like a treasure chest
        Dim decimalValue As Integer = 0
        ' Declare a variable to keep track of the position, like a map guiding our journey
        Dim position As Integer = 0

        ' Loop through each character in the hex string, like a knight on a quest
        For i As Integer = hex.Length - 1 To 0 Step -1
            ' Get the current character, like a clue in a mystery
            Dim currentChar As Char = hex(i)
            ' Convert the character to its decimal equivalent, like deciphering an ancient rune
            Dim currentDecimal As Integer = HexCharToDecimal(currentChar)

            ' Add the value to the total, like adding ingredients to a potion
            decimalValue += currentDecimal * (16 ^ position)
            ' Move to the next position, like turning the page of a spellbook
            position += 1
        Next

        ' Return the final decimal value, like presenting a completed masterpiece
        Return decimalValue
    End Function

    ' This function converts a single hex character to its decimal equivalent, like translating a magical language
    Function HexCharToDecimal(ByVal hexChar As Char) As Integer
        ' Declare a variable to hold the decimal value, like a key to a lock
        Dim decimalValue As Integer

        ' Determine the decimal value based on the character, like solving a riddle
        Select Case