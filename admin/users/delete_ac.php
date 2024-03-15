<?php
require '../root.php';
session_start();
if(empty($_SESSION['lever'] == 1)){
    header('location:../index.php');
}else{
    $id = $_GET['id'];
    $status = $_GET['status'];
    if( isset ($_REQUEST['id']) || $_REQUEST['id'] != ""){
        
        $sql = "DELETE FROM `customer` WHERE `id` = '$id'";
        $query = mysqli_query($connect, $sql);
        if ($query($sql) === TRUE) {
            header('location:index.php?success= Xóa thành công');
        } else{
            die(mysqli_error($connect));
        }
    }else{
        header('location:index.php');
    }
}
 
mysqli_close($connect);




