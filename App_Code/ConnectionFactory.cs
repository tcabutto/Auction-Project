namespace App_Data
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Data.OleDb;
    using System.Data.SqlClient;
    using System.Data;
    using System.Configuration;

    /// <summary>
    /// Encapsulates building a Command object
    /// </summary>
    public class ConnectionFactory
    {
        public static IDbCommand GetCommand(string dbType)
        {
            IDbConnection con;
            IDbCommand cmd;
            string connectionString;

            if (dbType.Equals("SQLServer"))
            {
                con = new SqlConnection();
                cmd = new SqlCommand();
                connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringSqlServer"].ConnectionString;
            }
            else // Access
            {
                con = new OleDbConnection();
                cmd = new OleDbCommand();
                connectionString = ConfigurationManager.ConnectionStrings["tacabuttoConnectionString"].ConnectionString;
            }

            con.ConnectionString = connectionString;
            cmd.Connection = con;
            return cmd;
        }
    }
}