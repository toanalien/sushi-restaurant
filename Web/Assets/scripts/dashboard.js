﻿
function getData() {
    $.get('/admin/dashboard/getdata', function (res) {
        // data = JSON.parse(res);
        $('#countDish').text(res.countDish);
        $('#countPromotion').text(res.countPromotion);
        $('#countOrder').text(res.countOrder);

        var ctxOrderByDay = document.getElementById("OrderByDayChart").getContext('2d');

        new Chart(document.getElementById("OrderByDayChart"), {
            type: 'line',
            data: {
                labels: res.arrayByDaysString.reverse(),
                datasets: [{
                    data: res.arrayByDays.reverse(),
                    label: "",
                    borderColor: "#3e95cd",
                    fill: false
                }  ]
            },
            options: {
                title: {
                    display: true,
                    text: 'Tổng doanh thu theo từng ngày'
                },
                scales: {
                    yAxes: [{ 
                            scaleLabel: function (valuePayload) {
                                return Number(valuePayload.value).toFixed(2).replace('.',',');
                            }
                    }],
                },
            }
        });

        new Chart(document.getElementById("OrderByMonthChart"), {
            type: 'line',
            data: {
                labels: res.arrayByMonthsString.reverse(),
                datasets: [{
                    data: res.arrayByMonths.reverse(),
                    label: "",
                    borderColor: "#FF0000",
                    fill: false
                }]
            },
            options: {
                title: {
                    display: true,
                    text: 'Tổng doanh thu theo từng tháng'
                },
                scales: {
                    yAxes: [{ 
                            scaleLabel: function (valuePayload) {
                                return Number(valuePayload.value).toFixed(2).replace('.',',');
                            }
                    }],
                },
            }
        });

        var ctxBanAn = document.getElementById("BanAnChart").getContext('2d');

        var BanAnChart = new Chart(ctxBanAn, {
            type: 'pie',
            responsive: true,
            data: {

                labels: ["Bàn Trống", "Bàn Đang Sử Dụng"],
                datasets: [{
                    backgroundColor: [
                      "#E89A0C",
                      "#FF0000"
                    ],
                    data: [res.countBanTrong, res.countBanDangSuDung]
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