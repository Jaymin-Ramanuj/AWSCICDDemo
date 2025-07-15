using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace AWSCICDDemo.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SuperHeroController : Controller
    {
        private static readonly string[] Names = new[]
      {
            "Iron Man", "Captain America", "Hulk", "BatMan", "DareDavil", "AntMan", "BlackPanther"
        };

        private readonly ILogger<SuperHeroController> _logger;

        public SuperHeroController(ILogger<SuperHeroController> logger)
        {
            _logger = logger;
        }

        [HttpGet(Name = "GetSuperHero")]
        public IEnumerable<SuperHero> GetSuperHero()
        {
            return Enumerable.Range(1, 5).Select(index => new SuperHero
            {
                Power = "Testing",
                age = Random.Shared.Next(100, 1055),
                Name = Names[Random.Shared.Next(Names.Length)]
            })
            .ToArray();
        }
    }
}