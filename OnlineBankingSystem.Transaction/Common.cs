using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace OnlineBankingSystem.Transaction
{
    public class Common
    {
        public static string GetConnection()
        {
            return ConfigurationManager.ConnectionStrings["Dbo_OnlineBankingSystemConnectionString"].ConnectionString;
        }

        public class Utils
        {
            SqlConnection connection;
            SqlCommand cmd;
            SqlDataAdapter sda;
            DataTable dt;


            public int accountBalance(int userId)
            {
                int balanceAmount = 0;
                try
                {
                    connection = new SqlConnection(Common.GetConnection());
                    cmd = new SqlCommand(@"SELECT Amount FROM Account Where AccountId = @AccountId", connection);
                    cmd.Parameters.AddWithValue("@AccountId", userId);
                    sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);
                    balanceAmount = Convert.ToInt32(dt.Rows[0]["Amount"]) == 0 ? 0 : Convert.ToInt32(dt.Rows[0]["Amount"]);
                }
                catch (Exception ex)
                {
                    HttpContext.Current.Response.Write("<script> alert('Error - " + ex.Message + " ');</script>");
                    
                }
                return balanceAmount;
            }
        }
    }
}