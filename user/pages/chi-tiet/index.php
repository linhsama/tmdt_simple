<?php
require_once '../model/SanPhamModel.php';
require_once '../model/AnhSpModel.php';
require_once '../model/CommonModel.php';
$sp = new SanPhamModel();
$anhSp = new AnhSpModel();
$cm = new CommonModel();

if (!isset($_GET['masp'])) {
    return;
}
$masp = $_GET['masp'];

$sp__Get_By_Id = $sp->SanPham__Get_By_Id($masp);
$sp__Get_Top_Sale = $sp->SanPham__Get_Top_Sale();
$sp__Get_Top_Same = $sp->SanPham__Get_Top_Same($sp__Get_By_Id->math,  $masp);
?>
<main class="main">
    <div class="main-container">
        <div class="main-container__chitiet__left">
            <div class="main-title-container">
                <a href="">
                </a>
            </div>
            <div class="manga-container__chitiet__left">
                <a href="#" onclick="return false">
                    <div class="manga-thumbnail">
                        <img src="../assets/<?= $anhSp->AnhSp__Get_By_Id_Sp_First($sp__Get_By_Id->masp)->hinhanh ?>">
                        <span class="manga-note background-2"><?= $cm->getTimeAgo($sp__Get_By_Id->ngaythem); ?> <i class="bx bxs-star"></i></span>
                    </div>
                </a>
                <div class="manga-sp-container__chitiet__left">
                    <div class="manga-title color-2"><?= $sp__Get_By_Id->tensp ?></div>
                    <div class="sp-container__top">
                        <div class="tab-group-1">
                            <h5 class="text-danger"><b><?= number_format($sp__Get_By_Id->dongia) ?>đ</b></h5>
                        </div>
                        <div class="sp-item-container__chitiet__left">
                            <div class="tab-group-1">
                                <div class="sp-thich">
                                    <div class="btn btn-sm color-0 background-7" onclick="addCart('<?= $masp ?>')">
                                        <i class="bx bx-cart"></i> Mua ngay
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="manga-container__chitiet__bottom">
                <div class="manga-sp-container__chitiet__bottom">
                    <div class="manga-title color-7">Mô tả</div>
                    <div class="chapter-container__chitiet__bottom__noi_dung">
                        <?php if ($sp__Get_By_Id->mota != "") : ?>
                            <?= $sp__Get_By_Id->mota ?>
                        <?php else : ?>
                            <a href="index.php?pages=sp-chi-tiet&masp=<?= $item->masp ?>">
                                <span class="chapter-name"></span>Đang cập nhật...</span>
                            </a>
                        <?php endif ?>
                    </div>
                </div>
            </div>
        </div>

        <div class="main-container__right">
            <div class="main-title-container__right">
                <a href="index.php?pages=sp-top">
                    <div class="item-title color-3"><i class='bx bx-star bx-tada'></i>TOP BÁN CHẠY</div>
                </a>
            </div>
            <div class="main-item-container__right">
                <?php foreach ($sp__Get_Top_Sale as $item) : ?>
                    <?php if (count($sp__Get_Top_Sale) > 0) : ?>
                        <?php $anhSp__Get_By_Id_Sp_First = $anhSp->AnhSp__Get_By_Id_Sp_First($item->masp); ?>
                        <?php if (isset($anhSp__Get_By_Id_Sp_First->masp)) : ?>
                            <a href="index.php?pages=chi-tiet&masp=<?= $item->masp ?>">
                                <div class="manga-container__right" id="top_<?= $top++ ?>">
                                    <div class="manga-thumbnail">
                                        <img src="../assets/<?= $anhSp__Get_By_Id_Sp_First->hinhanh ?>">
                                        <span class="manga-note background-7"> <b>Top <?= $top ?></b> |
                                            <?= $cm->formatThousand($item->luotmua) ?> lượt mua</span>
                                    </div>
                                    <div class="blur"></div>
                                    <div class="manga-title color-3"><?= $item->tensp ?></div>
                                </div>
                            </a>
                        <?php endif ?>
                    <?php endif ?>
                <?php endforeach ?>
            </div>
        </div>
    </div>
    <div class="main-container">
        <div class="main-title-container">
            <a href="index.php?pages=sp-ngau-nhien">
                <div class="item-title color-8"><i class='bx bx-book-reader'></i>SẢN PHẨM CÙNG THƯƠNG HIỆU</div>
            </a>
        </div>
        <div class="main-item-container">
            <?php foreach ($sp__Get_Top_Same as $item) : ?>
                <?php if (count($sp__Get_Top_Same) > 0) : ?>
                    <?php $anhSp__Get_By_Id_Sp_First = $anhSp->AnhSp__Get_By_Id_Sp_First($item->masp); ?>
                    <?php if (isset($anhSp__Get_By_Id_Sp_First->masp)) : ?>
                        <a href="index.php?pages=chi-tiet&masp=<?= $item->masp ?>">
                            <div class="manga-container">
                                <div class="manga-thumbnail">
                                    <img src="../assets/<?= $anhSp__Get_By_Id_Sp_First->hinhanh ?>">
                                    <span class="manga-note background-8"><?= number_format($item->dongia) ?>đ</i></span>
                                </div>
                                <div class="manga-title color-8"><?= $item->tensp ?></div>
                            </div>
                        </a>
                    <?php endif ?>
                <?php endif ?>
            <?php endforeach ?>
        </div>
    </div>
</main>