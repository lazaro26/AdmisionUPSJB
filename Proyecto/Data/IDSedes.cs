using Proyecto.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Proyecto.Data
{
    public interface IDSedes
    {
        Task<IEnumerable<MSedes>> ListarSedes();

    }
}
