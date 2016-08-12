using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using JOK_PaaS_2Tier_VC_App;
using JOK_PaaS_2Tier_VC_App.Controllers;

namespace JOK_PaaS_2Tier_VC_App.Tests.Controllers
{
    [TestClass]
    public class HomeControllerTest
    {
        [TestMethod]
        public void Index()
        {
            // Arrange
            HomeController controller = new HomeController();

            // Act
            ViewResult result = controller.Index() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void About()
        {
            // Arrange
            HomeController controller = new HomeController();

            // Act
            ViewResult result = controller.About() as ViewResult;

            // Assert
            
            // This is a rather silly unit test - but we are just interested in exercising the test mechanism,
            // not trying to create effective unit tests.
            Assert.AreEqual("Sample MVC Web Application (ASP.NET 4.6.1) to exercise an Azure Blue/Green deployment model.", result.ViewBag.Message);
        }

        [TestMethod]
        public void Contact()
        {
            // Arrange
            HomeController controller = new HomeController();

            // Act
            ViewResult result = controller.Contact() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
    }
}
