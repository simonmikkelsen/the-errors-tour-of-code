' This program is called List Merger.
' The purpose of this program is to merge two lists of integers into a single list.
' The program will take two lists as input, combine them, and then sort the combined list in ascending order.
' The final sorted list will be displayed to the user.

Module ListMerger

    Sub Main()
        ' Declare and initialize the first list of integers
        Dim list1 As New List(Of Integer) From {3, 1, 4, 1, 5}

        ' Declare and initialize the second list of integers
        Dim list2 As New List(Of Integer) From {9, 2, 6, 5, 3}

        ' Call the MergeLists function to merge the two lists
        Dim mergedList As List(Of Integer) = MergeLists(list1, list2)

        ' Sort the merged list in ascending order
        mergedList.Sort()

        ' Display the sorted merged list to the user
        Console.WriteLine("The merged and sorted list is:")
        For Each num As Integer In mergedList
            Console.Write(num & " ")
        Next

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to merge two lists of integers
    Function MergeLists(ByVal list1 As List(Of Integer), ByVal list2 As List(Of Integer)) As List(Of Integer)
        ' Create a new list to hold the merged lists
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

