SubCategories = []
Dishes = []
SubCategoriesID = []

$(document).ready(function() {
  $('.btn-category').first().click()

  // wait load ajax first and then click
  setTimeout(function(){
    $('.btn-sub-category').first().click()
  }, 1000);
});

function GetSubCategories(id) {
  category = $(`.btn-category#${id}`)
  $.ajax({
    type: 'GET',
    url: category.attr('link'),
    success: function (data) {
      SubCategories = data
      renderSubCategory()
    }
  });
}

function renderSubCategory() {
  list_item = ''
  if (SubCategories.length) {
    SubCategories.map(function(item) {
      list_item += `<button class='btn btn-primary btn-sub-category' onclick="GetDishes(${item.ID})" type="button">${item.Name}</button>`;
    });
  } else {
    list_item = '<h2>No data</h2>'
  }

  $('.sub-categories').html(list_item)
}

// lay danh sach dish cua sub category id = id
function GetDishes(id) {
  if (SubCategoriesID.includes(id)) {
    renderDish(id)
    // khong lam gi het
  } else {
    $.ajax({
      type: 'GET',
      url: `/SubCategories/GetDishes/${id}`,
      success: function (data) {
        Dishes = [ ...Dishes, ...data ]
        SubCategoriesID.push(id)
        renderDish(id)
      }
    });
  }

}

// render danh sach Dish thuoc Subcategory id = id
function renderDish(id) {
  dishesFiltered = Dishes.filter( dish => dish.SubCategoryID == id)
  console.log(dishesFiltered)
  list_item = ''
  if (dishesFiltered.length) {
    dishesFiltered.map(function(item) {
     list_item += `<p>${item.Name}</p>`
    });
  } else {
    list_item = '<h2>No data</h2>'
  }

  $('.dishes').html(list_item)
}
