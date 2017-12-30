using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Data.Model.Entities;

namespace Web.Areas.Admin.Controllers
{
    [Authorize]
    public class PromotionsController : Controller
    {
        private Entities db = new Entities();

        // GET: Promotions
        public ActionResult Index()
        {
            var promotions = db.Promotions.OrderByDescending(p => p.Id);
            return View(promotions.ToList());
        }

        // GET: Promotions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Promotion promotion = db.Promotions.Find(id);
            if (promotion == null)
            {
                return HttpNotFound();
            }
            return View(promotion);
        }

        // GET: Promotions/Create
        public ActionResult Create()
        {
            ViewBag.Categories = db.Categories.ToList();
            return View();
        }

        // POST: Promotions/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,DiscountPercent,Name,Description,CreateAt,ExpireAt")] Promotion promotion,
            List<int> dishes)
        {
            if (ModelState.IsValid)
            {
                Promotion tp = new Promotion();
                tp = db.Promotions.Where(x => x.Id == promotion.Id).FirstOrDefault();
                //
                if (tp == null)
                {
                    foreach (var dishId in dishes)
                    {
                        var dish = db.Dishes.Find(dishId);
                        if (dish != null)
                        {
                            dish.Promotion = promotion;
                            db.Entry(dish).State = EntityState.Modified;
                        }
                        
                    }
                    db.Promotions.Add(promotion);
                    db.SaveChanges();
                }
                else
                {
                    tp.CreateAt = promotion.CreateAt;
                    db.SaveChanges();
                }

                return RedirectToAction("Index");
            }

            return View(promotion);
            
        }

        // GET: Promotions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Promotion promotion = db.Promotions.Find(id);
            if (promotion == null)
            {
                return HttpNotFound();
            }
            ViewBag.Categories = db.Categories.ToList();
            return View(promotion);
        }

        // POST: Promotions/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,DiscountPercent,Name,Description,CreateAt,ExpireAt")] Promotion promotion,
            List<int> dishes)
        {
            if (ModelState.IsValid)
            {
                foreach (var dish in db.Dishes.Where(d => d.PromotionID == promotion.Id))
                {
                    dish.Promotion = null;
                    dish.PromotionID = null;
                    db.Entry(dish).State = EntityState.Modified;
                }
                foreach (var dishId in dishes)
                {
                    var dish = db.Dishes.Find(dishId);
                    if (dish != null)
                    {
                        dish.Promotion = promotion;
                        db.Entry(dish).State = EntityState.Modified;
                    }

                }
                db.Entry(promotion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(promotion);
        }

        // GET: Promotions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Promotion promotion = db.Promotions.Find(id);
            if (promotion == null)
            {
                return HttpNotFound();
            }
            return View(promotion);
        }

        // POST: Promotions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Promotion promotion = db.Promotions.Find(id);
            db.Promotions.Remove(promotion);
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
