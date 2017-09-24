using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Data.Model.Entities;
using Web.Models;
using Data.Service;

namespace Web.Controllers
{
    public class DishesController : Controller
    {
        private Entities db = new Entities();

        IDishService _dishService;

        //Tu dong inject
        public DishesController(IDishService dishService)
        {
            _dishService = dishService;
        }

        // GET: Dishes
        public ActionResult Index()
        {
            var dishes = db.Dishes.Include(d => d.SubCategory);
            return View(dishes.ToList());
        }

        // GET: Dishes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Dish dish = db.Dishes.Find(id);
            var orders = dish.OrderDishes.Where(p => p.IsDelete==false);
            ViewBag.Orders = orders;
            if (dish == null)
            {
                return HttpNotFound();
            }
            return View(dish);
        }

        // GET: Dishes/Details/5
        public ActionResult ListDishes()
        {
            var query = from d in db.Dishes
                        join od in db.OrderDishes
                        on d.ID equals od.OrderID
                        where od.IsDelete == false
                        select new { Dish1 = d, Orders = od};
            List<DishInOrder> dishes = null;
            
            return View(dishes);
        }

        // GET: Dishes/Create
        public ActionResult Create()
        {
            ViewBag.SubCategoryID = new SelectList(db.SubCategories, "ID", "Name");
            return View();
        }

        // POST: Dishes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Description,IsDelete,Image,Price,OrderTimes,SubCategoryID")] Dish dish)
        {
            if (ModelState.IsValid)
            {
                db.Dishes.Add(dish);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.SubCategoryID = new SelectList(db.SubCategories, "ID", "Name", dish.SubCategoryID);
            return View(dish);
        }

        // GET: Dishes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Dish dish = db.Dishes.Find(id);
            if (dish == null)
            {
                return HttpNotFound();
            }
            ViewBag.SubCategoryID = new SelectList(db.SubCategories, "ID", "Name", dish.SubCategoryID);
            return View(dish);
        }

        // POST: Dishes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Description,IsDelete,Image,Price,OrderTimes,SubCategoryID")] Dish dish)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dish).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SubCategoryID = new SelectList(db.SubCategories, "ID", "Name", dish.SubCategoryID);
            return View(dish);
        }

        // GET: Dishes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Dish dish = db.Dishes.Find(id);
            if (dish == null)
            {
                return HttpNotFound();
            }
            return View(dish);
        }

        // POST: Dishes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Dish dish = db.Dishes.Find(id);
            db.Dishes.Remove(dish);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
