' This program, called List Merger, is designed to merge two lists of strings into one.
' It uses regular expressions to filter and process the strings in the lists.
' The program demonstrates the use of regular expressions in Visual Basic and provides
' a practical example of merging lists with specific criteria.

Imports System.Text.RegularExpressions

Module ListMerger

    Sub Main()
        ' Define two lists of strings
        Dim list1 As New List(Of String) From {"apple", "banana", "cherry"}
        Dim list2 As New List(Of String) From {"date", "elderberry", "fig"}

        ' Merge the lists
        Dim mergedList As New List(Of String)
        mergedList.AddRange(list1)
        mergedList.AddRange(list2)

        ' Define a regular expression pattern to filter the merged list
        Dim pattern As String = "^[a-z]+$"

        ' Create a new list to store the filtered results
        Dim filteredList As New List(Of String)

        ' Use the regular expression to filter the merged list
        For Each item As String In mergedList
            If Regex.IsMatch(item, pattern) Then
                filteredList.Add(item)
            End If
        Next

        ' Output the filtered list
        Console.WriteLine("Filtered List:")
        For Each item As String In filteredList
            Console.WriteLine(item)
        Next

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

