using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using AutoMagically.Domain.Data;
using AutoMagically.Domain.Models;
using AutoMagically.Infrastructure;
using Microsoft.AspNetCore.Mvc;
using AutoMagically.Presentation.Models;

namespace AutoMagically.Presentation.Controllers
{
    public class HomeController : Controller
    {
        private readonly IDataReader<Magic> _magicReader; 
        public HomeController(IDataReader<Magic> magicReader)
        {
            _magicReader = magicReader; 

        }
        public IActionResult Index()
        {
            return Content(string.Join(",",_magicReader.List())); 
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
