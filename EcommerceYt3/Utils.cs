using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Configuration;

namespace EcommerceYt3
{

    public class Utils
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        SqlDataReader sdr;
        DataTable dt;
        public static string GetConnection()

        {
            return ConfigurationManager.ConnectionStrings["cs"].ToString();
        }

        public static bool isValidExtension(string file)
        {
            bool isValid = false;
            string[] fileExtensions = { ".jpg", ".png", ".jpeg" }; 
            foreach(var filename in fileExtensions)
            {
                 if(file.ToLower().Contains(filename))
                {
                    isValid = true;
                    break;
                }
            }
            return isValid;
              
        }

        public static string GenerateUniqueId()
        {
            Guid guid = Guid.NewGuid();

            return guid.ToString();

        }
    }
}