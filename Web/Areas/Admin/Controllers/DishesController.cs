﻿using System;
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
using System.IO;
using Web.Utils;
using AutoMapper;
using Data.Model.ViewModels;

namespace Web.Areas.Admin.Controllers
{
    [Authorize]
    public class DishesController : Controller
    {
        public DishesController()
        {
            Mapper.Initialize(cfg =>
            {
                cfg.CreateMap<Dish, DishViewModel>();
                cfg.CreateMap<Promotion, PromotionViewModel>();
            });
        }

        private Entities db = new Entities();

        IDishService _dishService;

        //Tu dong inject
        public DishesController(IDishService dishService)
        {
            _dishService = dishService;
        }

        // GET: Dishes
        [Authorize(Roles = Role.Admin)]
        public ActionResult Index()
        {
            var dishes = db.Dishes.Where(d => d.IsDelete != true).Include(d => d.SubCategory);
            dishes.ToList().ForEach(p => p.Image = Const.UPLOAD_LOCATION + p.Image);
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
            dish.Image = Const.UPLOAD_LOCATION + dish.Image;
            var orders = dish.OrderDishes;
            ViewBag.Orders = orders;
            if (dish == null)
            {
                return HttpNotFound();
            }
            return PartialView("_Detail", dish);
        }

        // GET: Dishes/Details/5
        public ActionResult ListDishes()
        {
            var query = from d in db.Dishes
                        join od in db.OrderDishes
                        on d.ID equals od.OrderID
                        select new { Dish1 = d, Orders = od};
            List<DishInOrder> dishes = null;

            return View(dishes);
        }

        // GET: Dishes/Create
        [Authorize(Roles = Role.Admin)]
        public ActionResult Create()
        {
            ViewBag.SubCategoryID = new SelectList(db.SubCategories, "ID", "Name");
            return View();
        }

        // POST: Dishes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = Role.Admin)]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Description,Image,Price,SubCategoryID")] Dish dish,
            HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {

                if (file != null)
                {
                    var ext = Path.GetExtension(file.FileName);
                    var filename = Guid.NewGuid() + ext;
                    file.SaveAs(HttpContext.Server.MapPath(Const.UPLOAD_LOCATION)
                                                  + filename);
                    dish.Image = filename;

                }
                dish.IsDelete = false;
                dish.OrderTimes = 0;

                db.Dishes.Add(dish);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.SubCategoryID = new SelectList(db.SubCategories, "ID", "Name", dish.SubCategoryID);
            return View(dish);
        }

        // GET: Dishes/Edit/5
        [Authorize(Roles = Role.Admin)]
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
            ViewBag.Image = Const.UPLOAD_LOCATION + dish.Image;
            ViewBag.SubCategoryID = new SelectList(db.SubCategories, "ID", "Name", dish.SubCategoryID);
            return View(dish);
        }

        // POST: Dishes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = Role.Admin)]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Description,Image,Price,SubCategoryID")] Dish dish,
            HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                dish.IsDelete = false;
                db.Entry(dish).State = EntityState.Modified;
                if (file != null)
                {
                    try
                    {
                        var oldFile = HttpContext.Server.MapPath(Const.UPLOAD_LOCATION) + dish.Image;
                        System.IO.File.Delete(oldFile);

                        var ext = Path.GetExtension(file.FileName);
                        var filename = Guid.NewGuid() + ext;
                        file.SaveAs(HttpContext.Server.MapPath(Const.UPLOAD_LOCATION) + filename);
                        dish.Image = filename;
                    }
                    catch (Exception)
                    {
                        throw;
                    }


                }
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SubCategoryID = new SelectList(db.SubCategories, "ID", "Name", dish.SubCategoryID);
            return View(dish);
        }


        [Authorize(Roles = Role.Admin)]
        // POST: Dishes/Delete/5
        [HttpPost, ActionName("Delete")]
        public JsonResult Delete(int id)
        {
            Boolean status = false;
            string message = String.Empty;

            try
            {
                Dish dish = db.Dishes.Find(id);
                db.Dishes.Remove(dish);
                db.SaveChanges();
                status = true;
                message = "Xóa dish thành công";
            }
            catch (Exception ex)
            {
                status = false;
                message = ex.Message;
            }

            return Json(new
            {
                status = status,
                message = message
            });
        }

        // GET
        public JsonResult SearchDishes(string Name)
        {
            db.Configuration.ProxyCreationEnabled = false;
            var Dishes = db.Dishes.Where(d => d.Name.Contains(Name));
            return Json( Dishes, JsonRequestBehavior.AllowGet);
        }

        public JsonResult getDish(int ID)
        {
            db.Configuration.ProxyCreationEnabled = false;
            Mapper.Initialize(cfg =>
            {
                cfg.CreateMap<Dish, DishViewModel>();
                cfg.CreateMap<Promotion, PromotionViewModel>();
            });
            var dish = db.Dishes.Single(x => x.ID == ID);
            var dishvm = Mapper.Map<DishViewModel>(dish);

            var promotion = db.Promotions.Find(dish.PromotionID);
            var promotionvm = Mapper.Map<PromotionViewModel>(promotion);

            var data = Json(new
            {
                ID = dishvm.ID,
                Name = dishvm.Name,
                Image = dishvm.Image,
                SubCategoryID = dishvm.SubCategoryID,
                Price = dishvm.Price,
                Promotion = promotionvm
            }, JsonRequestBehavior.AllowGet);
            return data;
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
