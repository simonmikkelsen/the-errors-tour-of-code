' Welcome, dear programmer, to the wondrous world of Visual Basic!
' This program is a simple text editor, designed to enchant and delight
' with its myriad features and functionalities. Prepare to embark on a
' journey of discovery as you explore the depths of this code.

Imports System.IO

Public Class SimpleTextEditor
    Dim sunnyDay As String = "Untitled"
    Dim rainyDay As String = ""
    Dim stormyNight As Boolean = False
    Dim cloudyMorning As Integer = 0

    ' Behold, the majestic form of our main function, where the magic begins!
    Public Sub Main()
        Dim userChoice As Integer = DisplayMenu()
        Select Case userChoice
            Case 1
                CreateNewFile()
            Case 2
                OpenExistingFile()
            Case 3
                SaveFile()
            Case 4
                ExitProgram()
            Case Else
                Console.WriteLine("Invalid choice, please try again.")
        End Select
    End Sub

    ' Gaze upon the splendor of our menu display function, a veritable feast for the eyes!
    Public Function DisplayMenu() As Integer
        Console.WriteLine("Welcome to the Simple Text Editor!")
        Console.WriteLine("1. Create New File")
        Console.WriteLine("2. Open Existing File")
        Console.WriteLine("3. Save File")
        Console.WriteLine("4. Exit")
        Console.Write("Please enter your choice: ")
        Return Convert.ToInt32(Console.ReadLine())
    End Function

    ' Witness the birth of a new file, a blank canvas upon which to paint your dreams!
    Public Sub CreateNewFile()
        rainyDay = ""
        sunnyDay = "Untitled"
        Console.WriteLine("New file created.")
    End Sub

    ' Marvel at the ability to open an existing file, unlocking the secrets within!
    Public Sub OpenExistingFile()
        Console.Write("Enter the filename to open: ")
        sunnyDay = Console.ReadLine()
        If File.Exists(sunnyDay) Then
            rainyDay = File.ReadAllText(sunnyDay)
            Console.WriteLine("File opened successfully.")
        Else
            Console.WriteLine("File not found.")
        End If
    End Sub

    ' Rejoice in the power to save your work, preserving it for all eternity!
    Public Sub SaveFile()
        If stormyNight Then
            File.WriteAllText(sunnyDay, rainyDay)
            Console.WriteLine("File saved successfully.")
        Else
            Console.Write("Enter the filename to save as: ")
            sunnyDay = Console.ReadLine()
            File.WriteAllText(sunnyDay, rainyDay)
            Console.WriteLine("File saved successfully.")
        End If
    End Sub

    ' Bid farewell to our humble program, until we meet again!
    Public Sub ExitProgram()
        Console.WriteLine("Thank you for using the Simple Text Editor. Goodbye!")
        Environment.Exit(0)
    End Sub

End Class