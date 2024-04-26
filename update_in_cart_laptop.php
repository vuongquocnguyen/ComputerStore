<?php

session_start();

$id = $_GET['id'];
$type = $_GET['type'];

if ( $type === 'decre'){
    if($_SESSION['carts'][$id]['quantity'] > 1) {
        $_SESSION['carts'][$id]['quantity']--;
    }else {
        unset($_SESSION['carts'][$id]);
    }
} else {
    if($_SESSION['carts'][$id]['quantity'] < 99){
        $_SESSION['carts'][$id]['quantity']++;
    }
}

header('location:view_cart.php');