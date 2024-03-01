<!-- giua -->
<?php
require 'admin/root.php';

$sqlPt = "SELECT count(id) as total FROM products";
$arrayNum = mysqli_query($connect, $sqlPt);
$row = mysqli_fetch_assoc($arrayNum);
$total_records = $row['total'];

$current_page = isset($_GET['page']) ? $_GET['page'] : 1;
$limit = 6;

$total_page = ceil($total_records / $limit);

if ($current_page > $total_page) {
    $current_page = $total_page;
} else if ($current_page < 1) {
    $current_page = 1;
}

$start = ($current_page - 1) * $limit;

$sql = "SELECT * FROM `products`
    ORDER BY products.id ASC
    LIMIT $limit offset $start";
$result = mysqli_query($connect, $sql);

?>

<div class="container">
    <div class="grid_full-width">
        <?php include './partials/menu.php' ?>
        <div class="grid_full-width content">
            <div class="content__brands">
                <?php include './partials/slider.php' ?>
                <div class="grid">
                    <div class="brands__heading">
                        <h1>DÒNG PC NỔI BẬT NHẤT</h1>
                    </div>
                </div>
                <div class="grid">
                    <div class="row row-category">
                        <?php foreach ($result as $each) : ?>
                            <div class="col col-3 col-2-mt mt-10">
                                <div class="category">
                                    <a href="view_detail.php?id=<?php echo $each['id'] ?>" class="category_link">
                                        <div class="category__img">
                                            <img src="admin/products/server/uploads/<?php echo $each['photo'] ?>" alt="">
                                        </div>
                                        <h4 class="category__name"><?php echo $each['name'] ?></h4>
                                        <div class="category__price">
                                            <p> Giá bán:</p>
                                            <span class="category__money">
                                                <?php echo     currency_format($each['price']) ?>
                                            </span>
                                        </div>
                                    </a>
                                    <div class="category-btn">
                                        <ul class="category-cart">
                                            <li>
                                                <a href="view_detail.php?id=<?php echo $each['id'] ?>">
                                                    Mua ngay
                                                </a>
                                            </li>
                                            <li>
                                                <?php if (!empty($_SESSION['id'])) { ?>
                                                    
                                                    <a onclick="return Suc()" href="add_to_cart.php?id=<?php echo $each['id'] ?>">
                                                        Thêm vào giỏ hàng
                                                    </a>
                                                <?php } ?>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        <?php endforeach ?>
                    </div>
                    <?php include './partials/pagination_mb.php' ?>
                </div>
                <div class="grid">
                    <div class="brands__heading">
                        <h1>Laptop mới</h1>
                    </div>
                </div>
                <?php include './partials/product_laptop.php' ?>
            </div>
            <?php include './partials/slidebar.php' ?>
        </div>
        
    </div>
</div>