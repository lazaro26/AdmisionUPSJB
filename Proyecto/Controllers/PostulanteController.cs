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
    public class PostulanteController : ControllerBase
    {

        private readonly IDPostulante _repository;
        private readonly ILogger<PostulanteController> _logger;

        public PostulanteController(IDPostulante repository)
        {
            this._repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }

        [Authorize]
        [HttpGet]
        [Route("listar")]
        public async Task<ActionResult<IEnumerable<MPostulante>>> listar(string codsed, string codesp)
        {
            MPostulante obj =new MPostulante();
            obj.CODSED = codsed;
            obj.CODESP = codesp;
            return (await _repository.ListarPostulante(obj)).ToList();
        }


        [Authorize]
        [HttpPost]
        [Route("registrar")]
        public async Task<IActionResult> Registrar(MPostulante obj)
        {

          var resut =  (await _repository.ConsultarPostulante(obj)).ToList();

            try
            {
                await _repository.RegistrarAsistencia(resut[0]);
                return Ok();
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
                return StatusCode(500, e);
            }
        }

    }
}
