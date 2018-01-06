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

            DateTime startDateTime = DateTime.Today;
            DateTime endDateTime = DateTime.Today.AddDays(1).AddTicks(-1);
            var countOrder = db.Orders
                                .Where(order => order.CreateAt >= startDateTime && order.CreateAt <= endDateTime)
                                .Count();

            // var countBanTrong = db.Tables.Where(t => t.Status == 0).Count();
            var countBanTrong = db.Tables.Where(t => t.Status == 0).Count();
            var countBanDangSuDung = db.Tables.Where(t => t.Status == 1).Count();

            var countKHBac = db.Customers.Where(t => t.Class == 0).Count();
            var countKHVang = db.Customers.Where(t => t.Class == 1).Count();
            var countKHKimCuong = db.Customers.Where(t => t.Class == 2).Count();

            List<double> arrayByDays = new List<double>();
            List<string> arrayByDaysString = new List<string>();
            
            DateTime today = DateTime.Today;


            DateTime today = DateTime.Today;
            List<string> arrayByDaysString = new List<string>();
        

            for (int i = 0; i < 30; i++)
            {
                DateTime startDay = today.AddDays(-i);
                DateTime endDay = today.AddDays(-i + 1).AddTicks(-1);
                
                arrayByDaysString.Add(startDay.ToString("dd-MM"));

                var query = (double)db.Orders
                            .Where(order => order.Status == 1)
                            .Where(order => order.CreateAt >= startDay && order.CreateAt <= endDay)
                            .Select(o => o.Total)
                            .DefaultIfEmpty(0)
                            .Sum();
                arrayByDays.Add(query);
            }

            List<double> arrayByMonths = new List<double>();
            List<string> arrayByMonthsString = new List<string>();

            DateTime FirstDayOfThisMonth = new DateTime( today.Year, today.Month, 1);

            for (int i = 0 ; i < 12 ; i++)
            {
                DateTime startDay = FirstDayOfThisMonth.AddMonths(-i);
                DateTime endDay = startDay.AddMonths(1).AddTicks(-1);

                arrayByMonthsString.Add(startDay.ToString("MM-yyyy"));
                var query = (double)db.Orders
                            .Where(order => order.Status == 1)
                            .Where(order => order.CreateAt >= startDay && order.CreateAt <= endDay)
                            .Select(o => o.Total)
                            .DefaultIfEmpty(0)
                            .Sum();
                arrayByMonths.Add(query);
            }

            var data = Json(new
            {
                countDish = countDish,
                countPromotion = countPromotion,
                countOrder = countOrder,
                // countBanTrong = countBanTrong,
                countBanTrong = countBanTrong,
                countBanDangSuDung = countBanDangSuDung,
                countKHBac = countKHBac,
                countKHVang = countKHVang,
                countKHKimCuong = countKHKimCuong,
                arrayByDays = arrayByDays,
                arrayByDaysString = arrayByDaysString,
                arrayByMonths = arrayByMonths,
                arrayByMonthsString = arrayByMonthsString
            }, JsonRequestBehavior.AllowGet);
            return data;
        }
    }
}