﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Data.Model.Entities;
using System.Web.Script.Serialization;
using AutoMapper;
using Data.Model.ViewModels;
using AutoMapper.QueryableExtensions;

namespace Web.Areas.Admin.Controllers
{
    public class OrdersController : Controller
    {

        public OrdersController()
        {
            Mapper.Initialize(cfg =>
            {
                cfg.CreateMap<Order, OrderViewModel>();
                cfg.CreateMap<OrderDish, OrderDishViewModel>();
            });
        }
        private Entities db = new Entities();

        // GET: Admin/Orders
        public ActionResult Index()
        {
            var orders = db.Orders.Include(o => o.Customer).Include(o => o.Employee).Include(o => o.Table);
            return View(orders.ToList());
        }

        // GET: Admin/Orders/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // GET: Admin/Orders/Create
        public ActionResult Create()
        {
            ViewBag.CustomerID = new SelectList(db.Customers, "ID", "Name");
            ViewBag.EmployeeID = new SelectList(db.Employees, "ID", "Name");
            ViewBag.TableID = new SelectList(db.Tables, "Id", "Code");
            ViewBag.Categories = db.Categories.ToList();
            return View();
        }

        // POST: Admin/Orders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public JsonResult CreateOrUpdate(string strOrder, string strnewOrderItems)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            Order order = serializer.Deserialize<Order>(strOrder);
            List<OrderDish> newOrderItem = serializer.Deserialize<List<OrderDish>>(strnewOrderItems);
            Boolean status = false;
            string message = String.Empty;
            if (order.Id == 0)
            {
                // tao moi
                // nhap ai vao di fail me roi
                order.EmployeeID = 1;
                order.CreateAt = DateTime.Now;
                db.Orders.Add(order);
                try
                {
                    db.SaveChanges();
                    status = true;
                    message = "Hóa đơn đã được lưu thành công";

                    foreach (var OrderDish in newOrderItem)
                    {
                        OrderDish.OrderID = order.Id;
                        db.OrderDishes.Add(OrderDish);
                        db.SaveChanges();
                    }

                    // xu li orderdish
                }
                catch (Exception ex)
                {
                    status = false;
                    message = ex.Message;
                }

            }
            else
            {
                // cap nhat
                order.EmployeeID = 1;
                order.CreateAt = DateTime.Now;
                try
                {
                    db.Entry(order).State = EntityState.Modified;
                    db.SaveChanges();
                    status = true;
                    // xu li delete old orderdish
                    // xu lí new order dish
                }
                catch (Exception ex)
                {
                    status = false;
                    message = ex.Message;
                }
            }


            var ordervm = Mapper.Map<OrderViewModel>(order);

            return Json(new
            {
                status = status,
                message = message,
                order = ordervm
            });
        }

        // GET: Admin/Orders/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            ViewBag.CustomerID = new SelectList(db.Customers, "ID", "Name", order.CustomerID);
            ViewBag.EmployeeID = new SelectList(db.Employees, "ID", "Name", order.EmployeeID);
            ViewBag.TableID = new SelectList(db.Tables, "Id", "Code", order.TableID);
            ViewBag.Categories = db.Categories.ToList();
            return View(order);
        }

        // POST: Admin/Orders/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,CreateAt,IsDelete,SubTotal,PromotionDiscount,ClassDiscount,Total,Status,CustomerID,EmployeeID,TableID")] Order order)
        {
            if (ModelState.IsValid)
            {
                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CustomerID = new SelectList(db.Customers, "ID", "Name", order.CustomerID);
            ViewBag.EmployeeID = new SelectList(db.Employees, "ID", "Name", order.EmployeeID);
            ViewBag.TableID = new SelectList(db.Tables, "Id", "Code", order.TableID);
            return View(order);
        }

        // GET: Admin/Orders/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // POST: Admin/Orders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Order order = db.Orders.Find(id);
            db.Orders.Remove(order);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public JsonResult GetOrder(int ID)
        {
            db.Configuration.ProxyCreationEnabled = false;


            var order = db.Orders.Single(x => x.Id == ID);
            var ordervm = Mapper.Map<OrderViewModel>(order);

            var orderdish = db.OrderDishes.Where(x => x.OrderID == ID);
            var orderDishVm = Mapper.Map<List<OrderDishViewModel>>(orderdish).ToList();

            var data = Json(new
            {
                order = ordervm,
                orderdish = orderDishVm
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
