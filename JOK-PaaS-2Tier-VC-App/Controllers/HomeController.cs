using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace JOK_PaaS_2Tier_VC_App.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Sample MVC Web Application (ASP.NET 4.6.1) to exercise an Azure Blue/Green deployment model.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Contact Me!";

            return View();
        }
    }
}