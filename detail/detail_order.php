<div class="container">
    <div class="grid_full-width">
        <?php include './partials/menu.php' ?>
        <div class="grid_full-width content">
            <div class="content__brands">
                <?php include './partials/slider.php' ?>
                <div class="grid">
                    <?php if(!empty(mysqli_fetch_array($result))){ ?>
                    <div class="row">
                        <div class="col col-full">
                            <div class="grid table_cart-info">
                                <div class="row-table_cart">
                                    <div class="col-table">Mã đơn</div>
                                    <div class="col-table col-table-5">Thông tin sản phẩm</div>
                                    <div class="col-table col-table-2">Số lượng</div>
                                    <div class="col-table col-table-2">Trạng thái đơn hàng</div>
                                </div>
                                <?php foreach ($result as $each) : ?>
                                    <div class="row-table_cart row-table-order-js">
                                        <div class="col-table-p col-table-2">
                                            <span style="margin: 0 auto ;"><?php echo $each['id'] ?></span>
                                        </div>
                                        <div class="col-table-p col-table-5">
                                            <?php if (!empty($each['name_product']) || !empty($each['image_product'])) : ?>
                                                <img height="200" src="admin/products/server/uploads/<?php echo $each['image_product'] ?>" alt="">
                                                <p><?php echo $each['name_product'] ?></p>
                                            <?php endif ?>
                                            <?php if (!empty($each['name_lp_product']) || !empty($each['image_lp_product'])) : ?>
                                                <img height="200" src="admin/product_laptop/server/uploads/<?php echo $each['image_lp_product'] ?>" alt="">
                                                <p><?php echo $each['name_lp_product'] ?></p>
                                            <?php endif ?>
                                        </div>
                                        <div class="col-table-p col-table-2">
                                            <span class="order-quantity">
                                                <?php echo $each['quantity'] ?>
                                            </span>
                                        </div>

                                        <div class="col-table-p col-table-2">
                                            <div class="order_info">
                                                <?php
                                                switch ($each['status']) {
                                                    case '0':
                                                        echo "Chờ duyệt";
                                                        break;
                                                    case '1':
                                                        echo "Đã duyệt";
                                                        break;
                                                    case '2':
                                                        echo '<span style="color: red;">Đã hủy</span>';
                                                        break;
                                                }
                                                ?>
                                            </div>
                                            <?php if($each['status'] == 0): ?>
                                                <a onclick="return Cancel()" class="order_cancel" href="./order_cancel.php?id=<?php echo $each['id'] ?>" class="">
                                                    Hủy
                                                </a>
                                            <?php endif ?>
                                        </div>
                                        
                                    </div>
                                    <div class="row-table_cart row-after">
                                        
                                            <div class="col-table col-table-5">Tổng tiền hóa đơn: $<span id="sum_quantity"><?php echo currency_format($each['total_price']) ?></span> </div>
                                        </div>
                                    
                                    <?php endforeach ?>
                            </div>
                            
                        </div>
                    </div>
                    <?php } else{ ?>
                    <div class="row">
                        <div class="col col-full">
                            <div class="grid table_cart-info">
                                <div class="row-table_cart">
                                    <div style="margin: 0 auto;" class="content_cart">
                                        <div class="cart_none">
                                            <img src="./public/imgs/cart_0.png" alt="">
                                            <h3>Bạn không có đơn hàng nào !!</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
                </div>

            </div>
            <?php include './partials/slidebar.php' ?>
        </div>

        
    </div>
</div>