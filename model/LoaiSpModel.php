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

class LoaiSpModel extends Database
{

    public function LoaiSp__Get_All()
    {
        $obj = $this->connect->prepare("SELECT * FROM loaisp");
        $obj->setFetchMode(PDO::FETCH_OBJ);
        $obj->execute();
        return $obj->fetchAll();
    }
    public function LoaiSp__Add($tenloai, $mota)
    {
        $obj = $this->connect->prepare("INSERT INTO loaisp(tenloai, mota) VALUES (?,?)");
        $obj->execute(array($tenloai, $mota));
        return $obj->rowCount();
    }

    public function LoaiSp__Update($maloai, $tenloai, $mota)
    {
        $obj = $this->connect->prepare("UPDATE loaisp SET tenloai=?, mota=? WHERE maloai=?");
        $obj->execute(array($tenloai, $mota, $maloai));
        return $obj->rowCount();
    }
    public function LoaiSp__Delete($maloai)
    {
        $obj = $this->connect->prepare("DELETE FROM loaisp WHERE maloai = ?");
        $obj->execute(array($maloai));
        return $obj->rowCount();
    }

    public function LoaiSp__Get_By_Id($maloai)
    {
        $obj = $this->connect->prepare("SELECT * FROM loaisp WHERE maloai = ?");
        $obj->setFetchMode(PDO::FETCH_OBJ);
        $obj->execute(array($maloai));
        return $obj->fetch();
    }
}
