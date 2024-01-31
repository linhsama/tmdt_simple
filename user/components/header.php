<?php
require_once "../model/LoaiSpModel.php";
require_once "../model/ThuongHieuModel.php";
$loaisp = new LoaiSpModel();
$th = new ThuongHieuModel();
// Lấy danh sách thể loại
$loaiSp__Get_All = $loaisp->LoaiSp__Get_All();
$thuongHieu__Get_All = $th->ThuongHieu__Get_All();
?>

<!-- Thẻ chứa thanh điều hướng -->
<nav class="navbar">
    <!-- Thẻ chứa nội dung thanh điều hướng -->
    <div class="navbar-container">
        <!-- Phần bên trái thanh điều hướng -->
        <div class="navbar-logo-menu">
            <!-- Logo -->
            <a class="navbar-logo" href="./index.php">
                <img alt="logo" src="../assets/images/logo.png">
            </a>
            <!-- Nút điều hướng trên điện thoại -->
            <div class="navbar-toggle"><i class="bx bx-menu"></i></div>
            <!-- Menu điều hướng -->
            <div class="navbar-menu">
                <!-- Ô tìm kiếm -->
                <div class="navbar-search">
                    <input id="search-box" type="text" name="search" autocomplete="off">
                    <div class="icon">
                        <i class="bx bx-search"></i>
                    </div>
                </div>
                <!-- Danh sách -->
                <div class="navbar-item has-sub">
                    <a href="index.php?pages=danh-muc"><i class='bx bx-category-alt'></i>Danh mục</a>
                    <ul class="navbar-item-sub">
                        <div class="menu-country">
                            <?php foreach ($thuongHieu__Get_All as $item) : ?>
                                <li><a href="index.php?pages=thuong-hieu&math=<?= $item->math ?>"><?= $item->tenth ?></a></li>
                            <?php endforeach ?>
                        </div>
                        <div class="menu-genre">
                            <?php foreach ($loaiSp__Get_All as $item) : ?>
                                <li>
                                    <a href="index.php?pages=loai-sp&maloai=<?= $item->maloai ?>">
                                        <?= $item->tenloai ?>
                                    </a>
                                </li>
                            <?php endforeach ?>
                        </div>
                    </ul>
                </div>
                <!-- Sản phẩm hot -->
                <div class="navbar-item"><a href="index.php?pages=san-pham-hot"><i class='bx bxs-hot bx-burst' style='color:#ff0004'></i>Sản phẩm hot</a></div>

                <!-- Nút đóng menu -->
                <div class="navbar-close">
                    <i class="bx bx-x"></i>
                </div>
            </div>
        </div>
        <!-- Phần bên phải thanh điều hướng -->

        <div class="navbar-display-user-action">
            <div class="navbar-display-cart">
                <i class='bx bxs-cart'>
                    <span id="cart-item">0</span>
                </i>
            </div>

            <?php if (isset($_SESSION['user'])) : ?>
                <!-- display-user người dùng đã đăng nhập -->
                <div class="navbar-display-user">
                    <i class='bx bxs-user-detail'></i>
                </div>
                <!-- Menu hành động của người dùng -->
                <div class="navbar-display-action hidden">
                    <a href="#">
                        <li><b><i class='bx bx-user-check'></i><?= $_SESSION['user']->ten_hien_thi ?></b></li>
                    </a>
                    <a href="index.php?pages=san-phan-da-xem">
                        <li> <i class='bx bx-book-reader'></i> Sản phẩm đã xem</li>
                    </a>
                    <a href="index.php?pages=san-phan-da-thich">
                        <li> <i class='bx bx-book-heart'></i> Sản phẩm đã thích</li>
                    </a>
                    <a href="index.php?pages=san-phan-theo-doi">
                        <li><i class='bx bx-book-bookmark'></i> Đang theo dõi</li>
                    </a>
                    <hr>
                    <a href="../auth/pages/chinh-sua.php">
                        <li> <i class='bx bx-cog'></i> Chỉnh sửa</li>
                    </a>
                    <hr>
                    <a href="../auth/pages/action.php?req=dang-xuat">
                        <li><i class='bx bx-log-out'></i> Đăng xuất</li>
                    </a>
                </div>
            <?php else : ?>
                <!-- display-user người dùng chưa đăng nhập -->
                <div class="navbar-display-user">
                    <i class="bx bx-user"></i>
                </div>
                <!-- Menu hành động khi chưa đăng nhập -->
                <div class="navbar-display-action hidden">
                    <li><i class='bx bx-log-in'></i> <a href="../auth?pages=dang-nhap">Đăng nhập</a></li>
                </div>
            <?php endif ?>
        </div>
    </div>
</nav>

<!-- Nút hành động nổi -->
<div class="floating-action">
    <!-- Nút chuyển đổi tìm kiếm -->
    <div class="action-item action-toggle"><i class="bx bx-target-lock"></i></div>
    <!-- Nút trang chủ -->
    <div class="action-item action-home"><i class="bx bx-home"></i></div>
    <!-- Nút menu -->
    <div class="action-item action-menu"><i class="bx bx-menu"></i></div>
    <!-- Nút người dùng -->
    <div class="action-item action-user"><i class="bx bx-user"></i></div>
    <!-- Nút lên đầu trang -->
    <div class="action-item action-top"><i class="bx bx-chevron-up"></i></div>
</div>