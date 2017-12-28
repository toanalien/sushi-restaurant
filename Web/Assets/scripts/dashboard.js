
function getData() {
    $.get('/admin/dashboard/getdata', function (res) {
        // data = JSON.parse(res);
        $('#countDish').text(res.countDish);
        $('#countPromotion').text(res.countPromotion);
        $('#countOrder').text(res.countOrder);

        var ctxBanAn = document.getElementById("BanAnChart").getContext('2d');
        var BanAnChart = new Chart(ctxBanAn, {
            width: 500,
            type: 'pie',
            responsive: true,
            data: {

                labels: ["Bàn Trống", "Bàn Đặt Trước", "Bàn Đang Sử Dụng"],
                datasets: [{
                    backgroundColor: [
                      "#A6FF1F",
                      "#E89A0C",
                      "#FF0000"
                    ],
                    data: [res.countBanTrong, res.countBanDatTruoc, res.countBanDangSuDung]
                }]
            }
        });

        var ctxKhachHang = document.getElementById("KhachHangChart").getContext('2d');
        var KhachHangChart = new Chart(ctxKhachHang, {
            type: 'pie',
            responsive: true,
            data: {

                labels: ["Khách Hàng Bạc", "Khách Hàng Vàng", "Khách Hàng Kim Cương"],
                datasets: [{
                    backgroundColor: [
                      "#0DFCFF",
                      "#450CE8",
                      "#DA0EE8"
                    ],
                    data: [res.countKHBac, res.countKHVang, res.countKHKimCuong]
                }]
            }
        });
    })
}
$(document).ready(function () {
    getData();
})
