<?php
session_start();
require_once '../../model/KhachHangModel.php';
require_once '../../model/NhanVienModel.php';
require_once '../../model/CommonModel.php';
$khachHang = new KhachHangModel();
$nhanVien = new NhanVienModel();
$cm = new CommonModel();

if (isset($_GET['req'])) {
    switch ($_GET['req']) {
        case "dang-ky":
           

        case "chinh-sua":
           

        case "dang-nhap-admin":
            $email = $_POST['email'];
            // $password = $cm->MaHoaMatKhau(trim($_POST['password']));
            $password = (trim($_POST['password']));
            $res = $nhanVien->NhanVien__Dang_Nhap($email, $password);
            if ($res == false) {
                header('location: ../index.php?pages=dang-nhap-admin&msg=warning');
            } else {
                if ($res->phanquyen == 0) {
                    $_SESSION['admin'] = $res;
                    header('location: ../../admin/');
                }
                elseif ($res->phanquyen == 1) {
                    $_SESSION['manager'] = $res;
                    header('location: ../../admin/');
                }
                else{
                    $_SESSION['user'] = $res;
                    header('location:'. $url);
                }
            }
            break;

        case "dang-xuat":
            if (isset($_SESSION['manager'])) {
                unset($_SESSION['manager']);
            }
            if (isset($_SESSION['admin'])) {
                unset($_SESSION['admin']);
            }
            if (isset($_SESSION['user'])) {
                unset($_SESSION['user']);
            }
            header('location:'.$_SERVER["HTTP_REFERER"]);
            break;
        default:
            break;
    }
}
