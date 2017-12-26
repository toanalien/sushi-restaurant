using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Models;
using Web.Utils;

namespace Web.Controllers
{
    public class BaseController : Controller
    {
        ApplicationDbContext context;
        public BaseController()
        {
            context = new ApplicationDbContext();
            ViewBag.IsAdmin = IsAdmin();
        }
        public bool IsAdmin()
        {
            if (User.Identity.IsAuthenticated)
            {
                var user = User.Identity;
                var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
                var s = UserManager.GetRoles(user.GetUserId());
                if (s[0].ToString() == Role.Admin)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            return false;
        }
    }
}