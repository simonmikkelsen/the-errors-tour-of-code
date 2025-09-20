/**
 * This program is called ListMerger.
 * The purpose of this program is to merge two lists of integers into a single list.
 * It takes two lists as input and combines them into one list, maintaining the order of elements.
 * The program demonstrates basic list operations and error handling in Java.
 */

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ListMerger {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Read the first list from the user
        System.out.println("Enter the number of elements in the first list:");
        int n1 = scanner.nextInt();
        List<Integer> list1 = new ArrayList<>();
        System.out.println("Enter the elements of the first list:");
        for (int i = 0; i < n1; i++) {
            list1.add(scanner.nextInt());
        }

        // Read the second list from the user
        System.out.println("Enter the number of elements in the second list:");
        int n2 = scanner.nextInt();
        List<Integer> list2 = new ArrayList<>();
        System.out.println("Enter the elements of the second list:");
        for (int i = 0; i < n2; i++) {
            list2.add(scanner.nextInt());
        }

        // Merge the two lists
        List<Integer> mergedList = mergeLists(list1, list2);

        // Print the merged list
        System.out.println("Merged list:");
        for (int num : mergedList) {
            System.out.print(num + " ");
        }
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

