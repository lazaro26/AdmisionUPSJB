using Proyecto.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Proyecto.Data
{
    public interface IDPostulante
    {
        Task<IEnumerable<MPostulante>> ListarPostulante(MPostulante obj);
        Task<IEnumerable<MPostulante>> ConsultarPostulante(MPostulante obj);
        Task RegistrarAsistencia(MPostulante obj);
      
    }
}
