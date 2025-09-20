/**
 * This program is called ListMerger.
 * The purpose of this program is to merge two lists of integers into a single list.
 * It takes two lists as input and combines them into one, maintaining the order of elements.
 * The program demonstrates basic list operations and error handling in Java.
 */

import java.util.ArrayList;
import java.util.List;

public class ListMerger {

    public static void main(String[] args) {
        // Create two lists of integers
        List<Integer> list1 = new ArrayList<>();
        List<Integer> list2 = new ArrayList<>();

        // Add some integers to the lists
        list1.add(1);
        list1.add(2);
        list1.add(3);

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
     * It takes two lists as input and returns a new list containing all elements from both lists.
     *
     * @param list1 the first list of integers
     * @param list2 the second list of integers
     * @return a new list containing all elements from list1 and list2
     */
    public static List<Integer> mergeLists(List<Integer> list1, List<Integer> list2) {
        List<Integer> mergedList = new ArrayList<>(list1);
        mergedList.addAll(list2);
        return mergedList;
    }
}

