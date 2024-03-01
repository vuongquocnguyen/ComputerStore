<?php
require 'admin/root.php';
$brand = isset($_GET['mb']) ? $_GET['mb'] : '';

$sqlPt = "SELECT 
    count(*)
    FROM products
    JOIN manufactures on products.manufacturer_id = manufactures.id
    WHERE manufactures.name = '$brand'";
$arrayNum = mysqli_query($connect, $sqlPt);
$row = mysqli_fetch_assoc($arrayNum);
$total_records = $row['count(*)'];

$current_page = isset($_GET['page']) ? $_GET['page'] : 1;
$limit = 6;

$total_page = ceil($total_records / $limit);

if ($current_page > $total_page) {
    $current_page = $total_page;
} else if ($current_page < 1) {
    $current_page = 1;
}

$start = ($current_page - 1) * $limit;

$sql = "SELECT
    products.*, 
    manufactures.name as manuf_name 
    FROM products
    JOIN manufactures on products.manufacturer_id = manufactures.id
    WHERE manufactures.name = '$brand'  
    ORDER BY `products`.`id`  DESC
    LIMIT $limit offset $start";
$result = mysqli_query($connect, $sql);
?>
<div class="container">
    <div class="grid_full-width">
        <?php include './partials/menu.php' ?>
        <?php include './partials/breadcrumb.php' ?>
        <div class="grid_full-width content">
            <div class="content__brands">
                <?php include './partials/slider.php' ?>
                <div class="grid">
                    <div class="brands__heading">
                        <h1>Dòng <?php echo $brand; ?> series</h1>
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
                                                <?php echo currency_format($each['price']) ?>
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
                                                    <a href="add_to_cart.php?id=<?php echo $each['id'] ?>">
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
                    <div class="row">
                        <div class="row_page">
                            <nav>
                                <ul class="pagination">
                                    <?php if ($current_page > 1 && $total_page > 1) { ?>
                                        <li class="page-item">
                                            <a class="page-link" href="view_brand.php?mb=<?php echo $brand ?>&page=<?php echo ($current_page - 1) ?>">Prev</a>
                                        </li>
                                    <?php } ?>
                                    <?php for ($i = 1; $i <= $total_page; $i++) { ?>
                                        <li class="page-item">
                                            <?php if ($i == $current_page) { ?>
                                                <span class="page-link text-muted"><?php echo  $i ?></span>
                                            <?php } else { ?>
                                                <a class="page-link" href="view_brand.php?mb=<?php echo $brand ?>&page=<?php echo  $i ?>"><?php echo  $i ?></a>
                                            <?php } ?>
                                        </li>
                                    <?php } ?>
                                    <?php if ($current_page < $total_page && $total_page > 1) { ?>
                                        <li class="page-item">
                                            <a class="page-link" href="view_brand.php?mb=<?php echo $brand ?>&page=<?php echo ($current_page + 1) ?>">Next</a>
                                        </li>
                                    <?php } ?>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <?php include './partials/slidebar.php' ?>
        </div>
        
    </div>
</div>