using System;
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
using Microsoft.AspNet.Identity;
using Web.Utils;

namespace Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin,Staff")]
    public class OrdersController : Controller
    {

        public OrdersController()
        {
            Mapper.Initialize(cfg =>
            {
                cfg.CreateMap<Order, OrderViewModel>();
                cfg.CreateMap<OrderDish, OrderDishViewModel>();
                cfg.CreateMap<Dish, DishViewModel>();
            });
        }
        private Entities db = new Entities();

        // GET: Admin/Orders
        [Authorize(Roles = Role.Admin)]
        public ActionResult Index()
        {
            var orders = db.Orders.Include(o => o.Customer).Include(o => o.AspNetUser).Include(o => o.Table);
            return View(orders.ToList());
        }

        // GET: Admin/Orders/Details/5
        [Authorize(Roles = Role.Admin)]
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
            return PartialView("_Detail", order);
        }

        // GET: Admin/Orders/Create
        public ActionResult Create()
        {
            ViewBag.CustomerID = new SelectList(db.Customers, "ID", "Name");
            ViewBag.EmployeeID = new SelectList(db.Employees, "ID", "Name");
            ViewBag.TableID = new SelectList(db.Tables.Where(t => t.Status ==  0), "Id", "Code");
            ViewBag.Categories = db.Categories.ToList();
            return View();
        }

        // POST: Admin/Orders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public JsonResult CreateOrUpdate(string strOrder, string strnewOrderItems, string strDeleteItems, string strMixOrderItem)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            Order order = serializer.Deserialize<Order>(strOrder);
            Boolean status = false;
            string message = String.Empty;
            if (order.Id == 0)
            {
                // tao moi
                var currentUser = System.Web.HttpContext.Current.User.Identity;
                order.UserId = currentUser.GetUserId();
                order.CreateAt = DateTime.Now;
                db.Orders.Add(order);
                try
                {
                    db.SaveChanges();
                    status = true;
                    message = "Hóa đơn đã được lưu thành công";
                    var table = db.Tables.Find(order.TableID);
                    table.Status = 2;
                    db.SaveChanges();
                    List<OrderDish> newOrderItem = serializer.Deserialize<List<OrderDish>>(strnewOrderItems);

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
                var currentUser = System.Web.HttpContext.Current.User.Identity;
                order.UserId = currentUser.GetUserId();
                order.CreateAt = DateTime.Now;
                try
                {
                    db.Entry(order).State = EntityState.Modified;
                    db.SaveChanges();
                    status = true;
                    // xu li delete old orderdish
                    int[] DeleteItems = serializer.Deserialize<int[]>(strDeleteItems);
                    foreach (int id in DeleteItems )
                    {
                        OrderDish od = db.OrderDishes.Find(id);
                        db.OrderDishes.Remove(od);
                        db.SaveChanges();
                    }
                    // xu lí new order dish
                    List<OrderDish> mixOrderItem = serializer.Deserialize<List<OrderDish>>(strMixOrderItem);
                    foreach (var od in mixOrderItem)
                    {
                        if (od.Id != 0)
                        {
                            db.Entry(od).State = EntityState.Modified;
                            db.SaveChanges();
                        }
                        else
                        {
                            od.OrderID = order.Id;
                            db.OrderDishes.Add(od);
                            db.SaveChanges();
                        }
                    }
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
            ViewBag.TableID = new SelectList(db.Tables, "Id", "Code", order.TableID);
            ViewBag.Categories = db.Categories.ToList();
            ViewBag.Order = Mapper.Map<OrderViewModel>(order);

            var orderdish = db.OrderDishes.Where(x => x.OrderID == id);
            ViewBag.oldOrderItems = Mapper.Map<List<OrderDishViewModel>>(orderdish).ToList();

            var dishes = from d in db.Dishes
                         where d.OrderDishes.Any( od => od.OrderID == id)
                         select d;
            ViewBag.Dishes = Mapper.Map<List<DishViewModel>>(dishes).ToList();
            return View(order);
        }

        // POST: Admin/Orders/Delete/5
        // POST: Admin/Orders/Delete/5
        [HttpPost, ActionName("Delete")]
        public JsonResult Delete(int id)
        {
            Boolean status = false;
            string message = String.Empty;
            try
            {
                Order order = db.Orders.Find(id);
                db.Orders.Remove(order);
                db.SaveChanges();
                status = true;
                message = "Xóa hóa đơn thành công";
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

        public JsonResult changeState(int ID)
        {
            var order = db.Orders.Find(ID);
            order.Status = 1;
            db.Entry(order).State = EntityState.Modified;
            db.SaveChanges();

            var table = db.Tables.Find(order.TableID);
            table.Status = 0;
            string message = String.Empty;
            message = "Hóa đơn được thanh toán thành công";

            var orderdishes = db.OrderDishes.Where(od => od.OrderID == order.Id);
            foreach (var od in orderdishes)
            {
                var dish = db.Dishes.Find(od.DishID);
                dish.OrderTimes += od.Quantity;
                db.Entry(dish).State = EntityState.Modified;
            }
            db.SaveChanges();

            if (order.CustomerID != null)
            {
                var customer = db.Customers.Find(order.CustomerID);
                var sumTien = db.Orders.Where(o => o.CustomerID == customer.ID)
                                .Where(o => o.Status == 1)
                                .Select(o => o.Total).Sum();
                if (sumTien > 5000000)
                {
                    db.Entry(customer).State = EntityState.Modified;
                    if (sumTien > 15000000)
                    {
                        customer.Class = 2;
                    }
                    else
                    {
                        customer.Class = 1;
                    }
                    db.SaveChanges();
                }
            }


            var data = Json(new
            {
                status = true,
                message = message
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
