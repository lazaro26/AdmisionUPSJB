using Microsoft.Extensions.Configuration;
using Proyecto.Data.Funciones;
using Proyecto.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Threading.Tasks;


namespace Proyecto.Data
{
    public class DEspecialidad : IDEspecialidad
    {

        private readonly string _connectionString;
        private readonly Populate _populate;

        public DEspecialidad(IConfiguration configuration, Populate populate)
        {
            _connectionString = configuration.GetConnectionString("defaultConnection");
            _populate = populate;
        }

        public async Task<IEnumerable<MEspecialidades>> ListarEspecialidades()
        {
            using (SqlConnection sql = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_ListarEspecialidades", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    var response = new List<MEspecialidades>();
                    await sql.OpenAsync();

                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            response.Add(_populate.SetEspecialidades(reader));
                        }
                    }
                    return response;
                }
            }
        }

    }
}
