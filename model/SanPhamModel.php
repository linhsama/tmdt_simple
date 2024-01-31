<?php

$a = "./config/connect.php";
$b = "../config/connect.php";
$c = "../../config/connect.php";
$d = "../../../config/connect.php";
$e = "../../../../config/connect.php";
$f = "../../../../../config/connect.php";

if (file_exists($a)) {
    $des = $a;
}
if (file_exists($b)) {
    $des = $b;
}
if (file_exists($c)) {
    $des = $c;
}
if (file_exists($d)) {
    $des = $d;
}

if (file_exists($e)) {
    $des = $e;
}

if (file_exists($f)) {
    $des = $f;
}
include_once($des);

class SanPhamModel extends Database
{

    public function SanPham__Get_All()
    {
        $obj = $this->connect->prepare("SELECT * FROM sanpham");
        $obj->setFetchMode(PDO::FETCH_OBJ);
        $obj->execute();
        return $obj->fetchAll();
    }
    public function SanPham__Add($tensp, $dongia, $mota, $ngaythem, $trangthai, $luotthich, $luotmua, $luotxem, $math, $maloai)
    {
        $obj = $this->connect->prepare("INSERT INTO sanpham(tensp, dongia, mota, ngaythem, trangthai, luotthich, luotmua, luotxem, math, maloai) VALUES (?,?,?,?,?,?,?,?,?,?)");
        $obj->execute(array($tensp, $dongia, $mota, $ngaythem, $trangthai, $luotthich, $luotmua, $luotxem, $math, $maloai));
        return $this->connect->lastInsertId();
    }

    public function SanPham__Update($masp, $tensp, $dongia, $mota, $ngaythem, $trangthai, $luotthich, $luotmua, $luotxem, $math, $maloai)
    {
        $obj = $this->connect->prepare("UPDATE sanpham SET tensp=?, dongia=?, mota=?, ngaythem=?, trangthai=?, luotthich=?, luotmua=?, luotxem=?, math=?, maloai=? WHERE masp=?");
        $obj->execute(array($tensp, $dongia, $mota, $ngaythem, $trangthai, $luotthich, $luotmua, $luotxem, $math, $maloai, $masp));
        return $obj->rowCount();
    }


    public function SanPham__Delete($masp)
    {
        $obj = $this->connect->prepare("DELETE FROM sanpham WHERE masp = ?");
        $obj->execute(array($masp));

        return $obj->rowCount();
    }

    public function SanPham__Get_By_Id($masp)
    {
        $obj = $this->connect->prepare("SELECT * FROM sanpham WHERE masp = ?");
        $obj->setFetchMode(PDO::FETCH_OBJ);
        $obj->execute(array($masp));
        return $obj->fetch();
    }


    public function SanPham__Get_Top_Sale()
    {
        $sql = "SELECT * FROM sanpham ORDER BY luotmua DESC  LIMIT 3";
        $obj = $this->connect->prepare($sql);
        $obj->setFetchMode(PDO::FETCH_OBJ);
        $obj->execute();
        return $obj->fetchAll();
    }

    public function SanPham__Get_Top_Updated($limit = 6)
    {
        $sql = "SELECT * FROM sanpham
        GROUP BY sanpham.masp
        ORDER BY ngaythem DESC
        LIMIT $limit";

        $obj = $this->connect->prepare($sql);
        $obj->setFetchMode(PDO::FETCH_OBJ);
        $obj->execute();
        return $obj->fetchAll();
    }
    public function SanPham__Get_Top_Random($limit = 6)
    {
        $sql = "SELECT * FROM sanpham
        ORDER BY RAND()
        LIMIT $limit";

        $obj = $this->connect->prepare($sql);
        $obj->setFetchMode(PDO::FETCH_OBJ);
        $obj->execute();
        return $obj->fetchAll();
    }

    public function SanPham__Get_Top_Same($math,  $masp)
    {
        $sql = "SELECT * FROM sanpham INNER JOIN thuonghieu ON sanpham.math = thuonghieu.math WHERE thuonghieu.math =? AND sanpham.masp !=?
        ORDER BY RAND()
        LIMIT 6";

        $obj = $this->connect->prepare($sql);
        $obj->setFetchMode(PDO::FETCH_OBJ);
        $obj->execute(array($math, $masp));
        return $obj->fetchAll();
    }
}
