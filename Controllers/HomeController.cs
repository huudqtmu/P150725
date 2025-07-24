using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using P150725.Models;
using Prometheus;

namespace P150725.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private static readonly Counter HelloCounter = Metrics.CreateCounter("hello_requests_total", "Total number of hello requests");

        [HttpGet]
        public string Get()
        {
            HelloCounter.Inc(); // tăng counter mỗi lần gọi API
            return "Home access!";
        }

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
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
