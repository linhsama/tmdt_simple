<?php
require_once '../model/DonHangModel.php';
require_once '../model/NhanVienModel.php';
require_once '../model/KhachHangModel.php';
require_once '../model/TrangThaiModel.php';
require_once '../model/ChiTietTrangThaiModel.php';
require_once '../model/ChiTietDonHangModel.php';
$dh = new DonHangModel();
$kh = new KhachHangModel();
$nv = new NhanVienModel();
$tt = new TrangThaiModel();
$cttt = new ChiTietTrangThaiModel();
$ctdh = new ChiTietDonHangModel();
$donHang__Get_All = $dh->DonHang__Get_All();
?>

<div id="main-container">
    <div class="main-title">
        <h3>Quản lý đơn hàng</h3>
        <ul class="breadcrumb">
            <li>
                <a href="#">Quản lý đơn hàng</a>
            </li>
            <li><i class='bx bx-chevron-right'></i></li>
            <li>
                <a class="active" href="index.php?pages=don-hang">Danh sách đơn hàng</a>
            </li>
        </ul>
    </div>
    <div class="row section-container">
        <div class="col-8">
            <div class="main-data">
                <h3 class="section-title">Danh sách đơn hàng</h3>
                <div class="table-responsive">
                    <table id="table_js" class="table table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Ngày đặt</th>
                                <th>Khách hàng</th>
                                <th>Nhân viên</th>
                                <th>Số tiền</th>
                                <th>Tình trạng</th>
                                <th>Ngày cập nhật</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($donHang__Get_All as $item) : ?>
                                <tr>
                                    <td><?= $item->madon ?></td>
                                    <td><?= $item->ngaydat ?></td>
                                    <td><?= $kh->KhachHang__Get_By_Id($item->makh)->tenkh ?></td>
                                    <td><?= $nv->NhanVien__Get_By_Id($item->manv)->tennv ?></td>
                                    <td><?= number_format($ctdh->ChiTietDonHang__Sum_Tien_DH($item->madon)->sum_tien) ?></td>
                                    <td><?= $cttt->ChiTietTrangThai__Get_Last_By_DH($item->madon)->tentt?></td>
                                    <td><?= $cttt->ChiTietTrangThai__Get_Last_By_DH($item->madon)->ngaytao?></td>
                                    <td class="text-center font-weight-bold">
                                        <button type="button" class="btn btn-warning btn-update" onclick="return update_obj('<?= $item->madon ?>')">
                                            <i class="fa fa-edit" aria-hidden="true"></i> Cập nhật trạng thái
                                        </button>
                                    </td>
                                </tr>
                            <?php endforeach ?>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
        <div class="col-4">
            <div class="main-form">
                <?php require_once 'add.php' ?>
            </div>
        </div>
    </div>
</div>

<script>
    function update_obj(madon) {
        $.post("pages/don-hang/update.php", {
            madon: madon,
        }, function(data, status) {
            $(".main-form").html(data);
        });
    };

    function delete_obj(madon) {
        const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
                confirmButton: "m-2 btn btn-danger",
                cancelButton: "m-2 btn btn-secondary"
            },
            buttonsStyling: false
        });
        swalWithBootstrapButtons.fire({
            title: "Xác nhận thao tác",
            text: "Chắc chắn xóa!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Xóa!",
            cancelButtonText: "Hủy!",
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                location.href = "pages/don-hang/action.php?req=delete&madon=" + madon;
            } else if (
                result.dismiss === Swal.DismissReason.cancel
            );
        });
    };
    window.addEventListener('load', function() {
        document.getElementById('dynamicTitle').innerText = "ADMIN | Quản lý đơn hàng";
    })
</script>