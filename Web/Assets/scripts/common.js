SubCategories = []
Dishes = []
CategoriesID = []
SubCategoriesID = []

$(document).ready(function() {
  $('.btn-category').first().click()

  // wait load ajax first and then click
  setTimeout(function(){
    $('.btn-sub-category').first().click()
  }, 1000);
});

function GetSubCategories(id) {
  if (CategoriesID.includes(id)) {
    renderSubCategory(id)
  } else {
    $('.dishes').html('<h2>No data</h2>')

    category = $(`.btn-category#${id}`)
    $.ajax({
      type: 'GET',
      url: category.attr('link'),
      success: function (data) {
        SubCategories = [ ...SubCategories, ...data ]
        CategoriesID.push(id)
        renderSubCategory(id)
      }
    });
  }
}

function renderSubCategory(id) {
  subCategoriesFiltered = SubCategories.filter( SubCategory => SubCategory.CategoryID == id)
  list_item = ''
  if (subCategoriesFiltered.length) {
    subCategoriesFiltered.map(function(item) {
      list_item += `<button
                      class='btn btn-primary btn-sub-category'
                      onclick="GetDishes(${item.ID})"
                      type="button">
                      ${item.Name}
                    </button>`;
    });
  } else {
    list_item = '<h2>No data</h2>'
  }

  $('.sub-categories').html(list_item)
  $('.btn-sub-category').first().click()
}

// lay danh sach dish cua sub category id = id
function GetDishes(id) {
  if (SubCategoriesID.includes(id)) {
    renderDishes(id)
    // khong lam gi het
  } else {
    $.ajax({
      type: 'GET',
      url: `/SubCategories/GetDishes/${id}`,
      success: function (data) {
        Dishes = [ ...Dishes, ...data ]
        SubCategoriesID.push(id)
        renderDishes(id)
      }
    });
  }

}

// render danh sach Dish thuoc Subcategory id = id
function renderDishes(id, isSearch = false) {
  list_item = ''

  if (isSearch) {

  } else {
    dishesFiltered = Dishes.filter( dish => dish.SubCategoryID == id)
    if (dishesFiltered.length) {
      dishesFiltered.map(function(item) {
        // list_item += <p>hello</p>
        list_item += `<p>${item.Name}</p>`
      });
    } else {
      list_item = '<h2>No data</h2>'
    }
  }

  $('.dishes').html(list_item)
}

function renderDish(dish) {

}