using Microsoft.Extensions.Configuration;
using Proyecto.Data.Funciones;
using Proyecto.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace Proyecto.Data
{
    public class DPostulante : IDPostulante
    {
        private readonly string _connectionString;
        private readonly Populate _populate;

        public DPostulante(IConfiguration configuration, Populate populate)
        {
            _connectionString = configuration.GetConnectionString("defaultConnection");
            _populate = populate;
        }


        public async Task<IEnumerable<MPostulante>> ListarPostulante(MPostulante obj)
        {
            using (SqlConnection sql = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_ListarPostulantes", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@CODSED", obj.CODSED));
                    cmd.Parameters.Add(new SqlParameter("@CODESP", obj.CODESP));
                    var response = new List<MPostulante>();
                    await sql.OpenAsync();

                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            response.Add(_populate.SetPostulante(reader));
                        }
                    }
                    return response;
                }
            }
        }


        public async Task<IEnumerable<MPostulante>> ConsultarPostulante(MPostulante obj)
        {
            using (SqlConnection sql = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_ConsultarPostulante", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@NUMDOC", obj.NUMDOC));
                    var response = new List<MPostulante>();
                    await sql.OpenAsync();

                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            response.Add(_populate.SetPostulante(reader));
                        }
                    }
                    return response;
                }
            }
        }

      
        public async Task RegistrarAsistencia(MPostulante obj)
        {
            using (SqlConnection sql = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_RegistrarAsistencia", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Id_postulante", obj.Id_postulante));
               

                    try
                    {
                        await sql.OpenAsync();
                        await cmd.ExecuteNonQueryAsync();
                        return;
                    }
                    catch (Exception e)
                    {
                        return;
                    }

                }
            }
        }






    }
}
