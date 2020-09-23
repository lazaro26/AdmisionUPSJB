using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Proyecto.Models;

namespace Proyecto.Data.Funciones
{
    public class Populate
    {

        public MPostulante SetPostulante(SqlDataReader reader)
        {
            return new MPostulante()
            {
                Id_postulante = (Int16)reader["Id_postulante"],
                FECREG = reader["FECREG"] == DBNull.Value ? null : (DateTime?)reader["FECREG"],
                NUMDOC = reader["NUMDOC"] as string ,
                CODALU = reader["CODALU"] as string,
                APEPAT = reader["APEPAT"] as string,
                APEMAT = reader["APEMAT"] as string,
                NOMALU = reader["NOMALU"] as string,
            };
        }

        public MSedes SetSedes(SqlDataReader reader)
        {
            return new MSedes()
            {
                CODSED =  reader["CODSED"] as string,
                DESCRIPCION = reader["DESCRIPCION"] as string ,

            };
        }

        public MEspecialidades SetEspecialidades(SqlDataReader reader)
        {
            return new MEspecialidades()
            {
                CODESP = reader["CODESP"] as string ,
                DESCRIPCION = reader["DESCRIPCION"] as string ,

            };
        }



    }
}
