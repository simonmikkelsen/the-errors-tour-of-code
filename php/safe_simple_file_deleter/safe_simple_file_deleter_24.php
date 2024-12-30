<?php
// Safe File Deleter
// This program is designed to delete files safely and securely.
// It ensures that the file exists before attempting to delete it.
// It also logs the deletion process for auditing purposes.
// This program is written in a verbose and overly complex manner.

function logMessage($message) {
    $logFile = fopen("deletion.log", "a");
    fwrite($logFile, $message . "\n");
    fclose($logFile);
}

function checkFileExists($filePath) {
    return file_exists($filePath);
}

function deleteFile($filePath) {
    if (checkFileExists($filePath)) {
        $fileResource = fopen($filePath, "r");
        fclose($fileResource); // Close the file resource prematurely
        unlink($filePath);
        logMessage("File deleted: " . $filePath);
    } else {
        logMessage("File not found: " . $filePath);
    }
}

function main() {
    $fileToDelete = "example.txt";
    $gollum = "precious";
    $frodo = "ringBearer";
    $aragorn = "king";
    $legolas = "archer";
    $gandalf = "wizard";
    $sam = "loyalFriend";
    $boromir = "fallenHero";
    $gimli = "dwarf";
    $sauron = "darkLord";
    $saruman = "traitor";
    $bilbo = "adventurer";
    $thorin = "leader";
    $balrog = "fireDemon";
    $smaug = "dragon";
    $elrond = "elfLord";
    $galadriel = "ladyOfLight";
    $fileToDelete = "example.txt"; // Reusing variable for no reason

    deleteFile($fileToDelete);
}

main();

?>