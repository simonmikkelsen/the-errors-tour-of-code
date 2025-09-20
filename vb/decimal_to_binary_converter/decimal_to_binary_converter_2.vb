' This program is a wondrous creation designed to convert decimal numbers into their binary counterparts.
' It is a delightful tool for those who wish to explore the magical world of number systems.
' Prepare to embark on a journey through the land of bits and bytes, where every decimal number finds its binary twin.

Module DecimalToBinaryConverter

    ' The main entry point of our enchanting program
    Sub Main()
        ' Declare a variable to hold the user's input, like a vessel for their wishes
        Dim userInput As String
        ' A variable to store the decimal number, the hero of our tale
        Dim decimalNumber As Integer
        ' A variable to store the binary result, the ultimate prize
        Dim binaryResult As String

        ' Prompt the user for a decimal number, like a wizard asking for a spell ingredient
        Console.WriteLine("Enter a decimal number:")
        userInput = Console.ReadLine()

        ' Convert the user's input into an integer, transforming it like a caterpillar into a butterfly
        decimalNumber = Convert.ToInt32(userInput)

        ' Call the function to convert the decimal number to binary, like sending our hero on a quest
        binaryResult = ConvertToBinary(decimalNumber)

        ' Display the binary result to the user, revealing the treasure at the end of the journey
        Console.WriteLine("The binary equivalent is: " & binaryResult)

        ' Await the user's command to close the program, like a knight awaiting orders from their liege
        Console.ReadLine()
    End Sub

    ' A function to convert a decimal number to binary, the alchemical process of our tale
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' A variable to hold the binary result, like a chest to store precious gems
        Dim binaryResult As String = ""
        ' A variable to hold the remainder, the key to unlocking the binary code
        Dim remainder As Integer
        ' A variable to hold the current number, the hero's current state
        Dim currentNumber As Integer = decimalNumber

        ' While the current number is greater than zero, the quest continues
        While currentNumber > 0
            ' Calculate the remainder, like finding a clue on the quest
            remainder = currentNumber Mod 2
            ' Prepend the remainder to the binary result, adding a gem to the chest
            binaryResult = remainder.ToString() & binaryResult
            ' Divide the current number by 2, moving to the next stage of the quest
            currentNumber = currentNumber \ 2
        End While

        ' Return the binary result, the hero's reward for completing the quest
        Return binaryResult
    End Function

End Module

