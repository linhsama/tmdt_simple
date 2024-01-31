<?php
require_once '../../../model/DonHangModel.php';
require_once '../../../model/SanPhamModel.php';
require_once '../../../model/NhanVienModel.php';
require_once '../../../model/KhachHangModel.php';
require_once '../../../model/TrangThaiModel.php';
require_once '../../../model/ChiTietTrangThaiModel.php';
require_once '../../../model/ChiTietDonHangModel.php';
$dh = new DonHangModel();
$kh = new KhachHangModel();
$sp = new SanPhamModel();
$nv = new NhanVienModel();
$tt = new TrangThaiModel();
$cttt = new ChiTietTrangThaiModel();
$ctdh = new ChiTietDonHangModel();

$madon = $_POST['madon'];
$chiTietDonHang__Get_By_Id_DH = $ctdh->ChiTietDonHang__Get_By_Id_DH($madon);
$chiTietTrangThai__Get_By_Id_DH = $cttt->ChiTietTrangThai__Get_By_Id_DH($madon);
$trangThai__Get_All = $tt->TrangThai__Get_All();
?>

<div class="main-update">
    <h3 class="section-title">Chi tiết đơn hàng</h3>

    <div class="table-responsive">
        <table id="table_js" class="table table-striped" style="width:100%">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Tổng cộng</th>
                </tr>
            </thead>
            <tbody>
                <?php $count = 0;
                foreach ($chiTietDonHang__Get_By_Id_DH as $item) : ?>
                    <tr>
                        <td><?= ++$count ?></td>
                        <td><?= $sp->SanPham__Get_By_Id($item->masp)->tensp ?></td>
                        <td><?= $item->soluong ?></td>
                        <td><?= number_format($item->dongia) ?></td>
                        <td><?= number_format($item->tongcong) ?></td>
                    </tr>
                <?php endforeach ?>
            </tbody>
            <tfoot>
                <tr class="text-center">
                    <th colspan="3">Tổng số tiền:</th>
                    <th colspan="2"><?= number_format($ctdh->ChiTietDonHang__Sum_Tien_DH($item->madon)->sum_tien) ?></th>
                </tr>
            </tfoot>
        </table>
    </div>

    <hr>
    <h4 class="section-title">Trạng thái đơn hàng</h4>

    <div class="table-responsive">
        <table id="table_js" class="table table-striped" style="width:100%">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Trạng thái</th>
                    <th>Ngày tạo</th>
                </tr>
            </thead>
            <tbody>
                <?php $count = 0;
                foreach ($chiTietTrangThai__Get_By_Id_DH as $item) : ?>
                    <tr>
                        <td><?= ++$count ?></td>
                        <td><?= $tt->TrangThai__Get_By_Id($item->matt)->tentt ?></td>
                        <td><?= $item->ngaytao ?></td>
                    </tr>
                <?php endforeach ?>
            </tbody>
        </table>
    </div>
    <form class="form-group" action="pages/don-hang/action.php?req=update" method="post">
        <div class="col">
            <label>Trạng thái hiện tại:</label>
            <?php foreach ($trangThai__Get_All as $item) : ?>
                <div class="form-check form-check-inline">
                    <input class="form-check-input checkbox" type="radio" id="matt<?= $item->matt ?>" value="<?= $item->matt ?>" name="matt" required <?=$cttt->ChiTietTrangThai__Get_Last_By_DH($madon)->matt == $item->matt ? 'checked' : ''?>>
                    <label class="form-check-label" for="matt<?= $item->matt ?>"><?= $item->tentt ?></label>
                </div>
            <?php endforeach; ?>
        </div>
        </div>
        <br />
        <div class="col text-center">
            <button type="submit" class="btn btn-primary">Lưu thông tin</button>
        </div>
    </form>

</div>