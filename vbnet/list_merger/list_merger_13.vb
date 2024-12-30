' This program is called List Merger. It is designed to merge two lists of integers into a single list.
' The program demonstrates the use of global variables and provides detailed comments for educational purposes.

Module ListMerger

    ' Global variables to hold the lists to be merged
    Dim list1 As New List(Of Integer)
    Dim list2 As New List(Of Integer)
    Dim mergedList As New List(Of Integer)

    Sub Main()
        ' Initialize the first list with some integers
        list1.Add(1)
        list1.Add(3)
        list1.Add(5)

        ' Initialize the second list with some integers
        list2.Add(2)
        list2.Add(4)
        list2.Add(6)

        ' Call the function to merge the lists
        MergeLists()

        ' Display the merged list
        Console.WriteLine("Merged List:")
        For Each num In mergedList
            Console.WriteLine(num)
        Next

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to merge two lists of integers into a single list
    Sub MergeLists()
        ' Add all elements from the first list to the merged list
        For Each num In list1
            mergedList.Add(num)
        Next

        ' Add all elements from the second list to the merged list
        For Each num In list2
            mergedList.Add(num)
        Next
    End Sub

End Module

