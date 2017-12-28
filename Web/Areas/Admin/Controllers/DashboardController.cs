using Data.Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web.Areas.Admin.Controllers
{
    [Authorize]

    public class DashboardController : Controller
    {
        private Entities db = new Entities();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }

        //GET: /Admin/dashboard/data

        public JsonResult GetData()
        {
            var countDish = db.Dishes.Count();
            var countPromotion = db.Promotions.Count();
            var countOrder = db.Orders.Count();

            var countBanTrong = db.Tables.Where(t => t.Status == 0).Count();
            var countBanDatTruoc = db.Tables.Where(t => t.Status == 1).Count();
            var countBanDangSuDung = db.Tables.Where(t => t.Status == 2).Count();

            var countKHBac = db.Customers.Where(t => t.Class == 0).Count();
            var countKHVang = db.Customers.Where(t => t.Class == 1).Count();
            var countKHKimCuong = db.Customers.Where(t => t.Class == 2).Count();

            var data = Json(new
            {
                countDish = countDish,
                countPromotion = countPromotion,
                countOrder = countOrder,
                countBanTrong =countBanTrong,
                countBanDatTruoc=countBanDatTruoc,
                countBanDangSuDung=countBanDangSuDung,
                countKHBac=countKHBac,
                countKHVang=countKHVang,
                countKHKimCuong=countKHKimCuong

            }, JsonRequestBehavior.AllowGet);
            return data;
        }
    }
}