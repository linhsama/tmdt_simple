<div class="main-add">
    <h3 class="section-title">Thêm loại sản phẩm</h3>
    <form class="form-group" action="pages/loai-sp/action.php?req=add" method="post">
        <div class="col">
            <label for="tenloai" class="form-label">Tên loại</label>
            <input type="text" class="form-control" id="tenloai" name="tenloai" required>
        </div>
        <div class="col">
            <label for="mota" class="form-label">Mô tả</label>
            <textarea class="form-control" id="mota" name="mota"></textarea>
        </div>
        <br />
        <div class="col text-center">
        <button type="submit" class="btn btn-primary">Lưu thông tin</button>
        </div>
    </form>
</div>