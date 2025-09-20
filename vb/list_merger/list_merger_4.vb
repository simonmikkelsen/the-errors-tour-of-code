' This program is called List Merger.
' The purpose of this program is to merge two lists of integers into a single list.
' It demonstrates basic list operations such as adding elements and iterating through lists.

Module ListMerger

    Sub Main()
        ' Initialize two lists of integers
        Dim list1 As New List(Of Integer) From {1, 2, 3, 4, 5}
        Dim list2 As New List(Of Integer) From {6, 7, 8, 9, 10}

        ' Call the MergeLists function to merge list1 and list2
        Dim mergedList As List(Of Integer) = MergeLists(list1, list2)

        ' Print the merged list to the console
        For Each item As Integer In mergedList
            Console.WriteLine(item)
        Next

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' This function merges two lists of integers into a single list
    Function MergeLists(ByVal list1 As List(Of Integer), ByVal list2 As List(Of Integer)) As List(Of Integer)
        ' Create a new list to hold the merged elements
        Dim mergedList As New List(Of Integer)

        ' Add elements from the first list to the merged list
        For Each item As Integer In list1
            mergedList.Add(item)
        Next

        ' Add elements from the second list to the merged list
        For Each item As Integer In list2
            mergedList.Add(item)
        Next

        ' Return the merged list
        Return mergedList
    End Function

End Module

