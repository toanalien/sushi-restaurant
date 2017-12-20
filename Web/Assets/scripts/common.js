SubCategories = []
Dishes = []
CategoriesID = []
SubCategoriesID = []
searchedDishes = []
newOrderItems = []
Customers = []
CustomerID = 0

Order = {
  Id: 0,
  SubTotal: null,
  PromotionDiscount: null,
  ClassDiscount: null,
  Total: null,
  Status: null,
  CustomerID: null,
  EmployeeID: 0,
  TableID: 0,
  Note: null
}

OrderItem = []

$(document).ready(function() {
  $(".search-dishes").keyup(function(){
    searchDishes($(this).val())
  });

  $('.btn-category').first().click()

  getCustomers()
  // wait load ajax first and then click
  setTimeout(function(){
    $('.btn-sub-category').first().click()
  }, 1000);

  CustomerID = $('#CustomerID').val();

  $('.save').click(function() {
    Save()
  });

  $('.thanh-toan').click(function() {
    console.log('THANH TOAN')
  });

  renderOrderItems()
  renderSubSum()
  renderChietKhau()
  renderSum()
});

function Save() {
  getDataForm()
  $.ajax({
    type: 'POST',
    url: '/Admin/Orders/Create',
    dataType:"JSON",
    data : {
      strOrder : JSON.stringify(Order)
    },
    success : function (result){
      if (result.status) {
        alert('Save success')
      } else {
        alert(result.message)
      }
    }
  });
}

function getCustomers() {
  $.ajax({
    type: 'GET',
    url: '/Customers/GetCustomers',
    success: function (data) {
      Customers = data
    }
  });
}

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
    searchedDishes.map(function(item) {
      // list_item += <p>hello</p>
      list_item += renderDish(item)
    });
  } else {
    dishesFiltered = Dishes.filter( dish => dish.SubCategoryID == id)
    if (dishesFiltered.length) {
      dishesFiltered.map(function(item) {
        // list_item += <p>hello</p>
        list_item += renderDish(item)
      });
    } else {
      list_item = '<h2>No data</h2>'
    }
  }

  $('.dishes').html(list_item)
  $(".dish").each(function() {
    $(this).click(function() {
      AddOrderItem($(this))
    });
  });
}

function renderDish(dish) {
  content = `<div class="col-lg-4 col-md-6 mb-4">
              <div
                class="card h-100 dish"
                id="${dish.ID}">
                  <img
                    class="card-img-top"
                    src="/Content/uploads/${dish.Image}"
                    alt="">
                <div class="card-body">
                  <h4 class="card-title">
                    ${dish.Name}
                  </h4>
                  <h5>${dish.Price} vnd</h5>
                  <h5>${dish.Price - 50000} vnd</h5>
                </div>
              </div>
            </div>`
  return content;
}

function searchDishes(searchText) {
  if (searchText.length) {
    url = `/Dishes/SearchDishes?Name=${searchText}`;
    $.ajax({
      type: 'GET',
      url: url,
      success: function (data) {
        searchedDishes = data;
        Dishes = [...Dishes, ...data]
        Dishes = RemoveDuplicate(Dishes)
        renderDishes(1, true);
      }
    });
  }
}

function AddOrderItem(dishDiv) {
  id = dishDiv.attr('id')
  dish = Dishes.find(d => d.ID == id)

  if (newOrderItems.find(t => t.DishID == id)) {
    newOrderItems = newOrderItems.map( e => e.DishID == id ? { ...e, Quantity: e.Quantity + 1} : e)
  } else {
    AddNewItem(dish)
  }
  renderOrderItems()
}

function getDataForm() {
  Order.SubTotal = getSubSum()
  Order.PromotionDiscount = 0
  Order.ClassDiscount = getChietKhau();
  Order.Total = getSum();
  Order.Status = 0;
  Order.CustomerID = $('#CustomerID').val()
  Order.TableID = $('#TableID').val()
  Order.Note = $('#Note').val()
}

function AddNewItem(dish) {
  newItem = {
    DishID: dish.ID,
    Quantity: 1,
    UnitPrice: dish.Price,
    Discount: 50000,
  }
  newOrderItems.push(newItem)
}

function RemoveNewItem(id) {
  item = newOrderItems.find( e => e.DishID == id)
  newOrderItems = remove(newOrderItems, item)
}

function remove(array, element) {
    return array.filter(e => e !== element);
}

function renderOrderItems() {
  content = `<div class="row border-bottom">
                <div class="col-sm-3 col-md-3">
                  <p>Món ăn</p>
                </div>
                <div class="col-sm-2 col-md-2">
                  <p>Giá</p>
                </div>
                <div class="col-sm-1 col-md-1">
                  <p>SL</p>
                </div>
                <div class="col-sm-3 col-md-3">
                  <p>Thành Tiền</p>
                </div>
                <divclass="col-sm-2 col-md-2">
                  <p>Action</p>
                </div>
              </div>`
  // merge voi old order items
  newOrderItems.map( item => content += renderItem(item))

  $('.orderItems').html(content)
  renderSubSum()
  renderChietKhau()
  renderSum()

  $('#CustomerID').change(function() {
    CustomerID = $(this).val()
    renderChietKhau();
    renderSum()
  });
}

function renderItem(item) {
  dish = Dishes.find(d => d.ID == item.DishID)
  realMoney = item.UnitPrice - item.Discount
  return content = `<div class="row border-bottom">
                      <div class="col-sm-3 col-md-3">
                        <p>${dish.Name}</p>
                      </div>
                      <div class="col-sm-2 col-md-2">
                        <p>${realMoney}</p>
                      </div>
                      <div class="col-sm-1 col-md-1">
                        <p>${item.Quantity}</p>
                      </div>
                      <div class="col-sm-3 col-md-3">
                        <p>${item.Quantity * realMoney}</p>

                      </div>
                      <divclass="col-sm-2 col-md-2">
                        <button type="button" class="btn-primary btn-xs" onclick="increaseOrderItem(${item.DishID})">
                          <span class="glyphicon glyphicon-plus"></span>
                        </button>
                        <button type="button" class="btn-warning btn-xs" onclick="dereaseOrderItem(${item.DishID})">
                          <span class="glyphicon glyphicon-minus"></span>
                        </button>
                        <button type="button" class="btn-danger btn-xs" onclick="RemoveOrderItem(${item.DishID})">
                          <span class="glyphicon glyphicon-remove"></span>
                        </button>
                      </div>
                    </div>`
}

function increaseOrderItem(DishID){
  newOrderItems = newOrderItems.map( e => e.DishID == DishID ? { ...e, Quantity: e.Quantity + 1} : e)
  renderOrderItems()
}

function dereaseOrderItem(DishID){
  newOrderItems = newOrderItems.map( e => (e.DishID == DishID && e.Quantity >= 1) ? { ...e, Quantity: e.Quantity - 1} : e)
  renderOrderItems()
}

function RemoveOrderItem(DishID) {
  item = newOrderItems.find( e => e.DishID == DishID)
  newOrderItems = remove(newOrderItems, item)
  renderOrderItems()
}


function RemoveDuplicate(arr) {
  uniq = new Set(arr.map(e => JSON.stringify(e)));
  return res = Array.from(uniq).map(e => JSON.parse(e));
}

function getSubSum() {
  subSub = 0
  newOrderItems.map(e => subSub += (e.UnitPrice - e.Discount) * e.Quantity)
  return subSub;
}

function renderSubSum() {
  subSum = getSubSum()
  content = `<h3>Tổng tiền : ${subSub.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")} vnđ</h3>`
  $('.sub-sum').html(content);
}

function getChietKhau() {
  customer = Customers.find(e => e.ID == CustomerID)
  chietKhau = 0
  switch(customer.Class) {
    case 1:
      chietKhau = 5
      break;
    case 2:
      chietKhau = 10
      break;
    case 3:
      chietKhau = 15
      break;
    default:
      chietKhau = 0
  }
  return chietKhau;
}

function renderChietKhau() {
  chietKhau = getChietKhau()
  content = `<h3>Chiết khấu: ${chietKhau}%</h3>`
  $('.chiet-khau').html(content);
}

function getSum() {
  subSum = getSubSum()
  chietKhau = getChietKhau()
  sum = subSum * ( 100 - chietKhau) / 100
  return sum = ~~sum
}

function renderSum(){
  sum = getSum()
  content = `<h3>Thanh toán : ${sum.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")} vnđ</h3>`
  $('.sum').html(content);
}