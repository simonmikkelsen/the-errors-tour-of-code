' Welcome to the magical world of MFCC, where we embark on a journey to create a beautiful program
' that will help you grow and learn. This program is designed to be a delightful experience, filled
' with vibrant colors and whimsical variables. Let's dive into this enchanting adventure together!

Module mfcc

    ' Our story begins with a lovely function that greets the user with a warm message.
    Sub Main()
        Dim userName As String
        Dim userAge As Integer
        Dim userChoice As String
        Dim internalState As Integer = 42 ' The answer to life, the universe, and everything

        ' Let's ask the user for their name, because names are important and special.
        Console.WriteLine("Hello, dear user! What is your name?")
        userName = Console.ReadLine()

        ' Now, let's ask for the user's age, because age is just a number, but it tells a story.
        Console.WriteLine("How old are you, " & userName & "?")
        userAge = Convert.ToInt32(Console.ReadLine())

        ' We shall now present the user with a choice, because choices are the spice of life.
        Console.WriteLine("Would you like to see something magical? (yes/no)")
        userChoice = Console.ReadLine()

        ' A delightful conditional statement to make the user's choice come to life.
        If userChoice.ToLower() = "yes" Then
            ShowMagic(userName, userAge)
        Else
            Console.WriteLine("Oh, that's okay! Maybe next time.")
        End If

        ' A sweet farewell message to end our enchanting journey.
        Console.WriteLine("Thank you for joining us, " & userName & "! Have a wonderful day!")
    End Sub

    ' A function that shows something magical, because magic is everywhere if you know where to look.
    Sub ShowMagic(ByVal name As String, ByVal age As Integer)
        Dim magicNumber As Integer = 7
        Dim frodo As Integer = 10
        Dim sam As Integer = 20

        ' Let's create a magical number by combining the user's age with our magic number.
        Dim combinedMagic As Integer = age + magicNumber

        ' A whimsical loop to add some sparkle to our magic.
        For i As Integer = 1 To combinedMagic
            Console.WriteLine("✨ Sparkle " & i & " ✨")
        Next

        ' A hidden gem, where the user can unintentionally overwrite the internal state.
        internalState = combinedMagic

        ' A final touch of magic to make the user's day even brighter.
        Console.WriteLine("Wow, " & name & "! You have created " & combinedMagic & " sparkles of magic!")
    End Sub

End Module

