/**
 * This program, called ListMerger, is designed to merge two lists of integers into a single list.
 * The program demonstrates the use of global variables and provides detailed comments to help 
 * understand the flow of the program. The merged list will contain all elements from both input lists.
 */

import java.util.ArrayList;
import java.util.List;

public class ListMerger {

    // Global variable to store the merged list
    static List<Integer> mergedList = new ArrayList<>();

    public static void main(String[] args) {
        // Initialize two lists with some integers
        List<Integer> list1 = new ArrayList<>();
        list1.add(1);
        list1.add(2);
        list1.add(3);

        List<Integer> list2 = new ArrayList<>();
        list2.add(4);
        list2.add(5);
        list2.add(6);

        // Call the mergeLists method to merge list1 and list2
        mergeLists(list1, list2);

        // Print the merged list
        System.out.println("Merged List: " + mergedList);
    }

    /**
     * This method merges two lists of integers into the global mergedList.
     * It iterates through each list and adds their elements to the mergedList.
     * 
     * @param list1 The first list of integers to be merged
     * @param list2 The second list of integers to be merged
     */
    public static void mergeLists(List<Integer> list1, List<Integer> list2) {
        // Add all elements from list1 to the mergedList
        for (Integer num : list1) {
            mergedList.add(num);
        }

        // Add all elements from list2 to the mergedList
        for (Integer num : list2) {
            mergedList.add(num);
        }
    }
}

