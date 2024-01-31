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

class DonHangModel extends Database
{

    public function DonHang__Get_All()
    {
        $obj = $this->connect->prepare("SELECT * FROM donhang");
        $obj->setFetchMode(PDO::FETCH_OBJ);
        $obj->execute();
        return $obj->fetchAll();
    }
    public function DonHang__Add($ngaydat, $makh, $manv)
    {
        $obj = $this->connect->prepare("INSERT INTO donhang(ngaydat, makh, manv) VALUES (?,?,?)");
        $obj->execute(array($ngaydat, $makh, $manv));
        return $obj->rowCount();
    }

    public function DonHang__Update($madon, $ngaydat, $makh, $manv)
    {
        $obj = $this->connect->prepare("UPDATE donhang SET ngaydat=?, makh=?, manv=? WHERE madon=?");
        $obj->execute(array($ngaydat, $makh, $manv, $madon));
        return $obj->rowCount();
    }
    public function DonHang__Delete($madon)
    {
        $obj = $this->connect->prepare("DELETE FROM donhang WHERE madon = ?");
        $obj->execute(array($madon));
        return $obj->rowCount();
    }

    public function DonHang__Get_By_Id($madon)
    {
        $obj = $this->connect->prepare("SELECT * FROM donhang WHERE madon = ?");
        $obj->setFetchMode(PDO::FETCH_OBJ);
        $obj->execute(array($madon));
        return $obj->fetch();
    }

}
