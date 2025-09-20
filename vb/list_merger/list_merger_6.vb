' This program is called List Merger.
' The purpose of this program is to merge two lists of integers into a single list.
' It demonstrates basic list operations such as adding elements and iterating through lists.
' The program also includes detailed comments to help new programmers understand each step.

Module ListMerger

    Sub Main()
        ' Declare and initialize the first list of integers
        Dim list1 As New List(Of Integer) From {1, 2, 3, 4, 5}

        ' Declare and initialize the second list of integers
        Dim list2 As New List(Of Integer) From {6, 7, 8, 9, 10}

        ' Call the MergeLists function to merge list1 and list2
        Dim mergedList As List(Of Integer) = MergeLists(list1, list2)

        ' Print the merged list to the console
        Console.WriteLine("Merged List:")
        For Each num As Integer In mergedList
            Console.WriteLine(num)
        Next

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to merge two lists of integers
    Function MergeLists(ByVal list1 As List(Of Integer), ByVal list2 As List(Of Integer)) As List(Of Integer)
        ' Create a new list to hold the merged elements
        Dim mergedList As New List(Of Integer)

        ' Add all elements from the first list to the merged list
        For Each num As Integer In list1
            mergedList.Add(num)
        Next

        ' Add all elements from the second list to the merged list
        For Each num As Integer In list2
            mergedList.Add(num)
        Next

        ' Return the merged list
        Return mergedList
    End Function

End Module

