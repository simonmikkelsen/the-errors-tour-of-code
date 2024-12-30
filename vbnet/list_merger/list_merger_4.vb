' This program is called List Merger.
' The purpose of this program is to merge two lists of integers into a single list.
' The program will take two lists as input, merge them, and then display the merged list.
' The program is designed to be very verbose with comments to help programmers understand each step.

Module ListMerger

    Sub Main()
        ' Declare and initialize the first list of integers
        Dim list1 As New List(Of Integer) From {1, 2, 3, 4, 5}
        
        ' Declare and initialize the second list of integers
        Dim list2 As New List(Of Integer) From {6, 7, 8, 9, 10}
        
        ' Call the MergeLists function to merge the two lists
        Dim mergedList As List(Of Integer) = MergeLists(list1, list2)
        
        ' Display the merged list
        Console.WriteLine("Merged List:")
        For Each item In mergedList
            Console.WriteLine(item)
        Next
        
        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' This function takes two lists of integers as input and returns a merged list
    Function MergeLists(ByVal list1 As List(Of Integer), ByVal list2 As List(Of Integer)) As List(Of Integer)
        ' Declare a new list to hold the merged result
        Dim resultList As New List(Of Integer)
        
        ' Add all elements from the first list to the result list
        For Each item In list1
            resultList.Add(item)
        Next
        
        ' Add all elements from the second list to the result list
        For Each item In list2
            resultList.Add(item)
        Next
        
        ' Return the merged list
        Return resultList
    End Function

End Module

