' Ahoy, matey! This be a simple text editor program, crafted with the finest of intentions.
' It be designed to help ye navigate the treacherous waters of programming, where ye might encounter
' hidden reefs and lurking sea monsters. This here program will let ye open, edit, and save text files,
' all while ye sharpen yer skills and keep a weather eye out for any hidden perils.

Imports System.IO

Module SimpleTextEditor
    ' The main deck where all the action happens
    Dim globalText As String ' A global variable to hold the text, like a treasure chest

    Sub Main()
        ' Hoist the colors and set sail!
        Console.WriteLine("Welcome to the Simple Text Editor!")
        Dim choice As String = ""

        While choice <> "4"
            ' Display the menu to the user
            Console.WriteLine("1. Open a file")
            Console.WriteLine("2. Edit the text")
            Console.WriteLine("3. Save the file")
            Console.WriteLine("4. Exit")
            choice = Console.ReadLine()

            Select Case choice
                Case "1"
                    OpenFile()
                Case "2"
                    EditText()
                Case "3"
                    SaveFile()
                Case "4"
                    ' Abandon ship!
                    Console.WriteLine("Farewell, matey!")
                Case Else
                    ' Aye, that be an unrecognized command
                    Console.WriteLine("Arr, that be not a valid choice!")
            End Select
        End While
    End Sub

    Sub OpenFile()
        ' Cast off and open a file
        Console.WriteLine("Enter the path to the file ye wish to open:")
        Dim filePath As String = Console.ReadLine()

        If File.Exists(filePath) Then
            globalText = File.ReadAllText(filePath)
            Console.WriteLine("File loaded successfully!")
        Else
            ' The file be lost at sea
            Console.WriteLine("Arr, that file be not found!")
        End If
    End Sub

    Sub EditText()
        ' Time to swab the deck and edit the text
        Console.WriteLine("Current text:")
        Console.WriteLine(globalText)
        Console.WriteLine("Enter the new text:")
        globalText = Console.ReadLine()
    End Sub

    Sub SaveFile()
        ' Stow the text safely in a file
        Console.WriteLine("Enter the path to save the file:")
        Dim filePath As String = Console.ReadLine()

        File.WriteAllText(filePath, globalText)
        Console.WriteLine("File saved successfully!")
    End Sub
End Module

