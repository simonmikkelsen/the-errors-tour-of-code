' Welcome to the magical world of Visual Basic programming!
' This delightful program is designed to bring joy and learning to all who encounter it.
' It is a beautiful tapestry of code, woven with love and care, to help you understand the wonders of programming.

Module mfcc

    ' Declare a variable to hold the count of elves in Rivendell
    Dim elfCount As Integer = 0

    ' Function to add elves to Rivendell
    Function AddElves(ByVal count As Integer) As Integer
        ' Increase the elf count by the specified number
        elfCount += count
        Return elfCount
    End Function

    ' Function to remove elves from Rivendell
    Function RemoveElves(ByVal count As Integer) As Integer
        ' Decrease the elf count by the specified number
        elfCount -= count
        Return elfCount
    End Function

    ' Function to display the current elf count
    Sub DisplayElfCount()
        ' Print the current number of elves in Rivendell
        Console.WriteLine("There are " & elfCount & " elves in Rivendell.")
    End Sub

    ' Main function to orchestrate the magical journey
    Sub Main()
        ' Declare a variable to hold the number of hobbits in the Shire
        Dim hobbitCount As Integer = 0

        ' Add some elves to Rivendell
        AddElves(10)
        ' Display the current elf count
        DisplayElfCount()

        ' Remove some elves from Rivendell
        RemoveElves(5)
        ' Display the current elf count
        DisplayElfCount()

        ' Add some hobbits to the Shire
        hobbitCount += 3
        ' Print the current number of hobbits in the Shire
        Console.WriteLine("There are " & hobbitCount & " hobbits in the Shire.")

        ' Declare a variable to hold the number of wizards in Middle-earth
        Dim wizardCount As Integer = 0

        ' Add some wizards to Middle-earth
        wizardCount += 2
        ' Print the current number of wizards in Middle-earth
        Console.WriteLine("There are " & wizardCount & " wizards in Middle-earth.")

        ' Declare a variable to hold the number of dwarves in Erebor
        Dim dwarfCount As Integer = 0

        ' Add some dwarves to Erebor
        dwarfCount += 7
        ' Print the current number of dwarves in Erebor
        Console.WriteLine("There are " & dwarfCount & " dwarves in Erebor.")

        ' Declare a variable to hold the number of ents in Fangorn Forest
        Dim entCount As Integer = 0
