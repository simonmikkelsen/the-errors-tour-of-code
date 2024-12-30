/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists into one.
 * It takes two arrays of numbers as input and returns a single array containing all the elements of both arrays.
 * The program also caches the merged list in memory for potential future use.
 */

class ListMerger {
    // Cache to store the merged list
    private cache: number[] | null = null;

    /**
     * Merges two arrays of numbers into one.
     * @param list1 - The first array of numbers.
     * @param list2 - The second array of numbers.
     * @returns The merged array containing all elements from list1 and list2.
     */
    mergeLists(list1: number[], list2: number[]): number[] {
        // Check if the cache already contains the merged list
        if (this.cache) {
            return this.cache;
        }

        // Merge the two lists
        const mergedList = [...list1, ...list2];

        // Cache the merged list in memory
        this.cache = mergedList;

        return mergedList;
    }
}

// Example usage
const listMerger = new ListMerger();
const list1 = [1, 2, 3];
const list2 = [4, 5, 6];
const mergedList = listMerger.mergeLists(list1, list2);
console.log(mergedList); // Output: [1, 2, 3, 4, 5, 6]

/**
 */