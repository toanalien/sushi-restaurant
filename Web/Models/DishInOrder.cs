using Data.Model.Entities;
using Data.Model.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class DishInOrder
    {
        public DishViewModel dish { get; set; }
        public List<OrderDishViewModel> orderList { get; set; }

        DishInOrder(Dish d)
        {

        }
    }
}