using Data.Model.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Utils;

namespace Web.Areas.Admin.Controllers
{
    public class ReservationsController : Controller
    {
        private Entities db = new Entities();
        // GET: Admin/Reservations
        public ActionResult Index()
        {
            var orders = db.Orders.Where(o => o.Status == Const.STATUS_BOOK).Include(o => o.OrderDishes);

            return View(orders.ToList());
        }
    }
}