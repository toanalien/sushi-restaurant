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

            var countBanTrong = db.Tables.Where(t => t.Status == 0).Count();

            var data = Json(new
            {
                countDish = countDish,
                countPromotion = countPromotion
            }, JsonRequestBehavior.AllowGet);
            return data;
        }
    }
}