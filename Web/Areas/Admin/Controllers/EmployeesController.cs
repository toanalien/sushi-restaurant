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
using Web.Utils;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System.Web.Security;

namespace Web.Areas.Admin.Controllers
{
    [Authorize(Roles = Role.Admin)]
    public class EmployeesController : Controller
    {
        private Entities db = new Entities();
        ApplicationUserManager _userManager;

        public EmployeesController()
        {
        }

        public EmployeesController(ApplicationUserManager userManager)
        {
            _userManager = userManager;
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        // GET: Admin/Employees
        public ActionResult Index()
        {
            var employees = db.Employees.Where(e => e.IsDelete == false).Include(e => e.AspNetUser);
            return View(employees.ToList());
        }

        // GET: Admin/Employees/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = db.Employees.Find(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            return PartialView("_Detail", employee);
        }

        // GET: Admin/Employees/Create
        public ActionResult Create()
        {
            ViewBag.RoleName = new SelectList(db.AspNetRoles, "Name", "Name");
            return View();
        }

        // POST: Admin/Employees/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async System.Threading.Tasks.Task<ActionResult> Create([Bind(Include = "ID,Name,Department,Position,Sex,Birthday,Phone,Address")] Employee employee,
            string Email, string Password, string RoleName)
        {
            if (ModelState.IsValid)
            {
                // Create User object
                var user = new ApplicationUser { UserName = Email, Email = Email };
                var result = await UserManager.CreateAsync(user, Password);
                if (result.Succeeded)
                {
                    // Add user with role
                    var result2 = await UserManager.AddToRoleAsync(user.Id, RoleName);

                    // Map employee with user
                    employee.UserId = user.Id;

                    employee.CreatedAt = DateTime.Now;
                    employee.IsDelete = false;
                    // Add employee
                    db.Employees.Add(employee);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.Email = Email;
                    ViewBag.Errors = result.Errors;
                }
            }
            ViewBag.RoleName = new SelectList(db.AspNetRoles, "Name", "Name");
            return View(employee);
        }

        // GET: Admin/Employees/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = db.Employees.Find(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            return View(employee);
        }

        // POST: Admin/Employees/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Department,Position,Sex,Birthday,Phone,Address")] Employee employee)
        {
            if (ModelState.IsValid)
            {
                db.Entry(employee).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(employee);
        }

        // POST: Admin/Employees/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult Delete(int id)
        {
            Boolean status = false;
            string message = String.Empty;
            try
            {
                Employee employee = db.Employees.Find(id);

                var user = employee.AspNetUser;
                if (user != null)
                {
                    var orders = user.Orders.ToList();
                    if (orders != null)
                    {
                        foreach (var order in orders)
                        {
                            order.AspNetUser = null;
                            db.Entry(order).State = EntityState.Modified;
                        }
                    }
                    db.Employees.Remove(employee);
                    db.SaveChanges();
                    UserManager.Delete(UserManager.FindByEmail(user.Email));
                    db.SaveChanges();
                }

                status = true;
                message = "Xóa employee thành công";
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
