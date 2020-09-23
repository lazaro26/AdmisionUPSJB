using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Proyecto.Models
{
    public class MPostulante
    {
        public int ? Id_postulante { get; set; }
        public DateTime ? FECREG { get; set; }
        public string TIPDOC { get; set; }
        public string NUMDOC { get; set; }
        public string CODALU { get; set; }
        public string APEPAT { get; set; }
        public string APEMAT { get; set; }
        public string NOMALU { get; set; }
        public string CODESP { get; set; }
        public string CODSED { get; set; }
        public string AULA { get; set; }

    }
}
