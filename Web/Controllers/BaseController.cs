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
        }
       
    }
}