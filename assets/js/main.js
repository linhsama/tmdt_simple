  var count = 1;
  function addCart(masp) {
  $("#cart-item").text(count++);

  // // Gửi yêu cầu AJAX để tăng số lượt thích
  // $.ajax({
  //   type: "POST",
  //   url: "components/action.php", // Điều này cần phải chỉ đến một file xử lý AJAX trên máy chủ 
  //   data: { action: "addCart", masp: masp },
  //   success: function (response) {
  //     // Cập nhật số lượt theo dõi trên giao diện
  //     if (response == "login_required") {
  //       const Toast = Swal.mixin({
  //         toast: true,
  //         position: "top-end",
  //         showConfirmButton: false,
  //         timer: 2000,
  //         timerProgressBar: true,
  //         didOpen: (toast) => {
  //           toast.onmouseenter = Swal.stopTimer;
  //           toast.onmouseleave = Swal.resumeTimer;
  //         },
  //       });
  //       Toast.fire({
  //         icon: "info",
  //         title: "Vui lòng đăng nhập!",
  //       });
  //     } else {
  //       $("#cart-item").text(response);
  //       const Toast = Swal.mixin({
  //         toast: true,
  //         position: "top-end",
  //         showConfirmButton: false,
  //         timer: 2000,
  //         timerProgressBar: true,
  //         didOpen: (toast) => {
  //           toast.onmouseenter = Swal.stopTimer;
  //           toast.onmouseleave = Swal.resumeTimer;
  //         },
  //       });
  //       Toast.fire({
  //         icon: "success",
  //         title: "Đã thêm vào cart!",
  //       });
  //     }
  //   },
  // });
}
