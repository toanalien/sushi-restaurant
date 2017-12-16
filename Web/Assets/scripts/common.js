SubCategories = []
Dishes = []

console.log(111)
jQuery(document).ready(function($) {
    // $('.main-content').hide()
    $.ajax({
    type: 'GET',
    url: '/Categories/GetSubCategories/1',
    success: function (data) {
        console.log(data)
        SubCategories = data
    }


    });

    $.ajax({
    type: 'GET',
    url: '/SubCategories/GetDishes/1',
    success: function (data) {
        console.log(data)
        Dishes = data
    }


    });
});