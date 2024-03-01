<?php
session_start();

require 'admin/root.php';



$email = $_POST['email'] ?? null;
$email = strip_tags($email);
$password = md5($_POST['password']);
$password = strip_tags($password);



$sql = "SELECT * from customers
where `email` = '$email' and `password` = '$password'";
$result = mysqli_query($connect, $sql);
$number_rows = mysqli_num_rows($result);

if ($number_rows == 1) {
    $each = mysqli_fetch_array($result);
    if ($each['status'] > 0) {
        $_SESSION['id'] = $each['id'];
        $_SESSION['name'] = $each['name'];
        $id = $each['id'];
        if ($remember) {
            $token = uniqid('user_', true);
            $sql = "UPDATE customers
        SET 
        token = '$token'
        WHERE 
        id = '$id'";
            mysqli_query($connect, $sql);
            setcookie('remember', $token, time() + (86400 * 30), "/");
            
        }
    } else {
        $_SESSION['error'] = 'Tài khoản của bạn đã bị khóa';
        header('location:login.php');
    }
} else {
    $_SESSION['error'] = "Tài khoản không tồn tại";
}
header('location:login.php');
mysqli_close($connect);
