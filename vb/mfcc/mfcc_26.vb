' Welcome to the magical world of programming! This delightful program is designed to bring joy and learning to all who encounter it. 
' It will take you on a whimsical journey through the land of code, where you will discover the wonders of random number generation.

Module mfcc

    ' Declare a variable to hold the random number generator
    Dim rng As New Random()

    ' Function to generate a random number between 1 and 100
    Function GenerateRandomNumber() As Integer
        ' Declare a variable to hold the random number
        Dim randomNumber As Integer

        ' Generate the random number
        randomNumber = rng.Next(1, 101)

        ' Return the random number
        Return randomNumber
    End Function

    ' Function to display a random number
    Sub DisplayRandomNumber()
        ' Declare a variable to hold the random number
        Dim randomNumber As Integer

        ' Generate the random number
        randomNumber = GenerateRandomNumber()

        ' Display the random number
        Console.WriteLine("Your magical random number is: " & randomNumber)
    End Sub

    ' Main function to run the program
    Sub Main()
        ' Declare a variable to hold the user's choice
        Dim userChoice As String

        ' Greet the user
        Console.WriteLine("Welcome, dear programmer! Are you ready to embark on a journey of randomness? (yes/no)")

        ' Get the user's choice
        userChoice = Console.ReadLine()

        ' Check the user's choice
        If userChoice.ToLower() = "yes" Then
            ' Display a random number
            DisplayRandomNumber()
        Else
            ' Bid farewell to the user
            Console.WriteLine("Farewell, dear programmer! Until we meet again.")
        End If
    End Sub

End Module

