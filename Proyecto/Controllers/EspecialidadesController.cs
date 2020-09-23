using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Proyecto.Data;
using Proyecto.Models;

namespace Proyecto.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EspecialidadesController : ControllerBase
    {

        private readonly IDEspecialidad _repository;
        private readonly ILogger<EspecialidadesController> _logger;

        public EspecialidadesController(IDEspecialidad repository)
        {
            this._repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }

        [Authorize]
        [HttpGet]
        [Route("listar")]
        public async Task<ActionResult<IEnumerable<MEspecialidades>>> listar()
        {
            return (await _repository.ListarEspecialidades()).ToList();
        }




    }
}
