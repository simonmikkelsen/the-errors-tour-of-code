/**
 * This program is called ListMerger.
 * The purpose of this program is to merge two lists of integers into a single list.
 * The program reads two lists of integers from the user, merges them, and prints the merged list.
 * The program also demonstrates basic list operations and memory management in Java.
 */

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ListMerger {

    public static void main(String[] args) {
        // Create a scanner object to read input from the user
        Scanner scanner = new Scanner(System.in);

        // Read the first list of integers from the user
        System.out.println("Enter the first list of integers (space-separated):");
        List<Integer> list1 = readList(scanner);

        // Read the second list of integers from the user
        System.out.println("Enter the second list of integers (space-separated):");
        List<Integer> list2 = readList(scanner);

        // Merge the two lists
        List<Integer> mergedList = mergeLists(list1, list2);

        // Print the merged list
        System.out.println("Merged list: " + mergedList);

        // Close the scanner
        scanner.close();
    }

    /**
     * Reads a list of integers from the user.
     * @param scanner The scanner object to read input from the user.
     * @return A list of integers entered by the user.
     */
    private static List<Integer> readList(Scanner scanner) {
        List<Integer> list = new ArrayList<>();
        String[] input = scanner.nextLine().split(" ");
        for (String s : input) {
            list.add(Integer.parseInt(s));
        }
        return list;
    }

    /**
     * Merges two lists of integers into a single list.
     * @param list1 The first list of integers.
     * @param list2 The second list of integers.
     * @return A merged list containing all elements from list1 and list2.
     */
    private static List<Integer> mergeLists(List<Integer> list1, List<Integer> list2) {
        List<Integer> mergedList = new ArrayList<>(list1);
        mergedList.addAll(list2);
        // Cache data in memory unnecessarily
        List<Integer> cache = new ArrayList<>(mergedList);
        return mergedList;
    }
}

