<?php
// all general functions for easier use

function escape($string) {
    global $conn;
    return mysqli_real_escape_string($conn, $string);
}

function query($query) {
    global $conn;
    return mysqli_query($conn, $query);
}

function redirect($location) {
    header("Location: " . $location . "");
}

?>