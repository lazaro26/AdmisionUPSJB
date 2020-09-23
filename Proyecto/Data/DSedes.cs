using Microsoft.Extensions.Configuration;
using Proyecto.Data.Funciones;
using Proyecto.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace Proyecto.Data
{
    public class DSedes :IDSedes
    {
        private readonly string _connectionString;
        private readonly Populate _populate;

        public DSedes(IConfiguration configuration, Populate populate)
        {
            _connectionString = configuration.GetConnectionString("defaultConnection");
            _populate = populate;
        }


        public async Task<IEnumerable<MSedes>> ListarSedes()
        {
            using (SqlConnection sql = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_ListarSedes", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                   
                    var response = new List<MSedes>();
                    await sql.OpenAsync();

                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            response.Add(_populate.SetSedes(reader));
                        }
                    }
                    return response;
                }
            }
        }



    }
}
