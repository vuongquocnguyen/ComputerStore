<?php

require 'admin/root.php';
$id = isset($_GET['id']) ? $_GET['id'] : '';

$sql = "SELECT manufactures.name as brand, products.* FROM products
JOIN manufactures on manufactures.id = products.manufacturer_id
WHERE products.id = '$id'";
$result = mysqli_query($connect, $sql);
$each = mysqli_fetch_array($result);

$brand = $each['brand'];
?>
<div class="container">
    <div class="grid_full-width">
        <?php include './partials/menu.php' ?>
        <?php include './partials/breadcrumb.php' ?>
        <div class="grid_full-width content">
            <div class="content__brands">
                <?php include './partials/slider.php' ?>
                <div class="grid grid-cart_phone">
                    <div class="row">
                        <div class="col col-2">
                            <div class="cart_phone-img">
                                <img src="admin/products/server/uploads/<?php echo $each['photo'] ?>" alt="">
                            </div>
                        </div>
                        <div class="col col-2">
                            <div class="cart_phone-about">
                                <h2><?php echo $each['name'] ?></h2>
                                <span><?php echo $each['slug'] ?></span>
                                <h4>Giá: <span><?php echo currency_format($each['price']) ?></span></h4>
                                <?php if(empty($_SESSION['id'])){ ?>
                                    <a onclick="return Onc()" href="login.php" class="cart_phone-btn">Mua ngay</a>
                                <?php } else { ?>
                                    <a class="cart_phone-btn" href="add_to_cart.php?id=<?php echo $each['id'] ?>">Mua ngay</a>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="grid grid-cart_phone">
                    <div class="row">
                        <div class="cart_phone-about">
                            <h3>Thông tin sản phẩm:</h3>
                            <p class="cart_phone-descriptions"><?php echo $each['descriptions'] ?></p>
                        </div>
                    </div>
                </div>
            </div>
            <?php include './partials/slidebar.php' ?>
        </div>
        <?php include './detail/comments.php' ?>
        
    </div>
</div>