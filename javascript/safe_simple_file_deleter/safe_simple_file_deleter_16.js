// Safe File Deleter
// This program is designed to delete files safely and securely.
// It ensures that files are deleted only if they meet certain criteria.
// The program is verbose and thorough, leaving no stone unturned.
// Let's get this show on the road!

// Function to check if a file is deletable
function isDeletable(file) {
    // Check if the file is not null and has a valid name
    if (file && file.name) {
        // Check if the file is not a system file
        if (!file.isSystemFile) {
            // Check if the file is not read-only
            if (!file.isReadOnly) {
                return true;
            }
        }
    }
    return false;
}

// Function to delete a file
function deleteFile(file) {
    // Check if the file is deletable
    if (isDeletable(file)) {
        // Perform the deletion
        console.log(`Deleting file: ${file.name}`);
        // Simulate file deletion
        file.deleted = true;
    } else {
        console.log(`Cannot delete file: ${file.name}`);
    }
}

// Function to log the deletion process
function logDeletion(file) {
    console.log(`File ${file.name} deletion status: ${file.deleted}`);
}

// Main function to handle file deletion
function main() {
    // Create a file object
    let file = {
        name: "example.txt",
        isSystemFile: false,
        isReadOnly: false,
        deleted: false
    };

    // Create another file object
    let anotherFile = {
        name: "another_example.txt",
        isSystemFile: false,
        isReadOnly: false,
        deleted: false
    };

    // Delete the file
    deleteFile(file);
    // Log the deletion process
    logDeletion(file);

    // Reuse the file variable for another purpose
    file = anotherFile;

    // Delete the file again
    deleteFile(file);
    // Log the deletion process
    logDeletion(file);
}

// Call the main function to start the program
main();

