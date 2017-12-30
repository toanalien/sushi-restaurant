using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Data.Model.Entities;
using Web.Utils;

namespace Web.Areas.Admin.Controllers
{
    [Authorize]
    public class SubCategoriesController : Controller
    {
        private Entities db = new Entities();

        // GET: SubCategories
        [Authorize(Roles = Role.Admin)]
        public ActionResult Index()
        {
            var subCategories = db.SubCategories.Include(s => s.Category);
            return View(subCategories.ToList());
        }

        // GET: SubCategories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubCategory subCategory = db.SubCategories.Find(id);
            if (subCategory == null)
            {
                return HttpNotFound();
            }
            return PartialView("_Detail", subCategory);
        }

        // GET: SubCategories/Create
        [Authorize(Roles = Role.Admin)]
        public ActionResult Create()
        {
            ViewBag.CategoryID = new SelectList(db.Categories, "ID", "Name");
            return View();
        }

        // POST: SubCategories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = Role.Admin)]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Description,CategoryID")] SubCategory subCategory)
        {
            if (ModelState.IsValid)
            {
                db.SubCategories.Add(subCategory);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CategoryID = new SelectList(db.Categories, "ID", "Name", subCategory.CategoryID);
            return View(subCategory);
        }

        // GET: SubCategories/Edit/5
        [Authorize(Roles = Role.Admin)]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubCategory subCategory = db.SubCategories.Find(id);
            if (subCategory == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryID = new SelectList(db.Categories, "ID", "Name", subCategory.CategoryID);
            return View(subCategory);
        }

        // POST: SubCategories/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = Role.Admin)]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Description,CategoryID")] SubCategory subCategory)
        {
            if (ModelState.IsValid)
            {
                db.Entry(subCategory).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryID = new SelectList(db.Categories, "ID", "Name", subCategory.CategoryID);
            return View(subCategory);
        }

        // GET: SubCategories/Delete/5
        [Authorize(Roles = Role.Admin)]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubCategory subCategory = db.SubCategories.Find(id);
            if (subCategory == null)
            {
                return HttpNotFound();
            }
            return View(subCategory);
        }

        // POST: SubCategories/Delete/5
        [Authorize(Roles = Role.Admin)]
        [HttpPost, ActionName("Delete")]
     
        public JsonResult Delete(int id)
        {
            Boolean status = false;
            string message = String.Empty;

            try
            {
                SubCategory subcategory = db.SubCategories.Find(id);
                db.SubCategories.Remove(subcategory);
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
        public JsonResult GetDishes(int ID)
        {
            db.Configuration.ProxyCreationEnabled = false;
            var dishes = from dish in db.Dishes.Where(x => x.SubCategoryID == ID)
                         select new
                         {
                            ID = dish.ID,
                            Name = dish.Name,
                            Image = dish.Image,
                            SubCategoryID = dish.SubCategoryID,
                            Price = dish.Price,
                            Promotion = dish.Promotion
                         };
            return Json( dishes , JsonRequestBehavior.AllowGet);
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
