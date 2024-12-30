' Welcome to the magical world of Visual Basic .NET programming!
' This delightful program is designed to showcase the beauty of regular expressions.
' It will take you on a journey through the enchanted forest of string manipulation.
' Along the way, you will encounter various whimsical functions and variables.
' Enjoy the vibrant colors and playful names inspired by the enchanting tales of Middle-earth.

Imports System.Text.RegularExpressions

Module mfcc

    ' The main entry point of our lovely program
    Sub Main()
        ' Let's declare some variables to hold our precious strings
        Dim frodo As String = "The quick brown fox jumps over the lazy dog."
        Dim samwise As String = "A wizard is never late, nor is he early, he arrives precisely when he means to."
        Dim aragorn As String = "Not all those who wander are lost."

        ' Now, let's create some regular expressions to match our strings
        Dim regex1 As New Regex("quick\s+brown\s+fox")
        Dim regex2 As New Regex("wizard\s+is\s+never\s+late")
        Dim regex3 As New Regex("those\s+who\s+wander")

        ' Let's see if our strings match the regular expressions
        Dim match1 As Match = regex1.Match(frodo)
        Dim match2 As Match = regex2.Match(samwise)
        Dim match3 As Match = regex3.Match(aragorn)

        ' Print the results of our magical matches
        Console.WriteLine("Match 1: " & match1.Value)
        Console.WriteLine("Match 2: " & match2.Value)
        Console.WriteLine("Match 3: " & match3.Value)

        ' Let's add some more variables for fun
        Dim legolas As String = "Even the smallest person can change the course of the future."
        Dim gimli As String = "Faithless is he that says farewell when the road darkens."
        Dim gandalf As String = "All we have to decide is what to do with the time that is given us."

        ' And some more regular expressions
        Dim regex4 As New Regex("smallest\s+person")
        Dim regex5 As New Regex("says\s+farewell")
        Dim regex6 As New Regex("time\s+that\s+is\s+given")

        ' Let's see if our new strings match the new regular expressions
        Dim match4 As Match = regex4.Match(legolas)
        Dim match5 As Match = regex5.Match(gimli)
        Dim match6 As Match = regex6.Match(gandalf)

        ' Print the results of our new magical matches
        Console.WriteLine("Match 4: " & match4.Value)
        Console.WriteLine("Match 5: " & match5.Value)
        Console.WriteLine("Match 6: " & match6.Value)

        ' Let's add some unnecessary variables and functions for extra fun
        Dim bilbo As String = "There and back again."
        Dim thorin As String = "If more of us valued food and cheer and song above hoarded gold, it would be a merrier world."

        ' A function that does nothing useful
        Function UselessFunction(ByVal input As String) As String
            Return input & " is useless."
        End Function

        ' Call the useless function
        Console.WriteLine(UselessFunction(bilbo))
        Console.WriteLine(UselessFunction(thorin))
    End Sub

End Module

