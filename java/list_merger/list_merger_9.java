/**
 * This program, called ListMerger, is designed to merge two lists of integers into a single list.
 * The program takes two predefined lists, merges them, and then prints the merged list.
 * The purpose of this program is to demonstrate basic list operations in Java, such as adding elements from one list to another.
 * Additionally, the program showcases the use of verbose comments to explain each step in detail.
 */

import java.util.ArrayList;
import java.util.List;

public class ListMerger {

    public static void main(String[] args) {
        // Create the first list of integers
        List<Integer> list1 = new ArrayList<>();
        list1.add(1);
        list1.add(2);
        list1.add(3);

        // Create the second list of integers
        List<Integer> list2 = new ArrayList<>();
        list2.add(4);
        list2.add(5);
        list2.add(6);

        // Merge the two lists
        List<Integer> mergedList = mergeLists(list1, list2);

        // Print the merged list
        System.out.println("Merged List: " + mergedList);
    }

    /**
     * This method merges two lists of integers into a single list.
     * It takes two lists as input parameters and returns a new list containing all elements from both input lists.
     * 
     * @param list1 The first list of integers
     * @param list2 The second list of integers
     * @return A new list containing all elements from list1 and list2
     */
    public static List<Integer> mergeLists(List<Integer> list1, List<Integer> list2) {
        // Create a new list to hold the merged elements
        List<Integer> mergedList = new ArrayList<>(list1);

        // Add all elements from the second list to the merged list
        for (Integer num : list2) {
            mergedList.add(num);
        }

        // Return the merged list
        return mergedList;
    }
}

