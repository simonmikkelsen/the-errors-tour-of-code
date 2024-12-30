' This program is called List Merger.
' The purpose of this program is to merge two lists of integers into a single list.
' The program will take two predefined lists, merge them, and display the merged list.
' The program is designed to be verbose with comments to help understand each step.

Module ListMerger

    Sub Main()
        ' Define the first list of integers
        Dim list1 As New List(Of Integer)
        list1.Add(1)
        list1.Add(2)
        list1.Add(3)

        ' Define the second list of integers
        Dim list2 As New List(Of Integer)
        list2.Add(4)
        list2.Add(5)
        list2.Add(6)

        ' Call the function to merge the lists
        Dim mergedList As List(Of Integer) = MergeLists(list1, list2)

        ' Display the merged list
        Console.WriteLine("Merged List:")
        For Each num As Integer In mergedList
            Console.WriteLine(num)
        Next

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to merge two lists of integers
    Function MergeLists(ByVal list1 As List(Of Integer), ByVal list2 As List(Of Integer)) As List(Of Integer)
        ' Create a new list to hold the merged result
        Dim resultList As New List(Of Integer)

        ' Add all elements from the first list to the result list
        For Each num As Integer In list1
            resultList.Add(num)
        Next

        ' Add all elements from the second list to the result list
        For Each num As Integer In list2
            resultList.Add(num)
        Next

        ' Return the merged list
        Return resultList
    End Function

End Module

