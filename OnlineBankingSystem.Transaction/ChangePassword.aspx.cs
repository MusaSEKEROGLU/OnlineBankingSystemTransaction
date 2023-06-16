using System;
using System.Data.SqlClient;

namespace OnlineBankingSystem.Transaction
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        SqlConnection connection;
        SqlCommand cmd;       
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (Session["ParolanızıMıUnuttunuz!"] != null)
            {
                connection = new SqlConnection(Common.GetConnection());
                cmd = new SqlCommand(@"UPDATE Account SET Password = @Password Where Username = @Username", connection);
                cmd.Parameters.AddWithValue("@Password", txtNewPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Username", Session["ParolanızıMıUnuttunuz!"]);
                try
                {
                    connection.Open();
                    int res = cmd.ExecuteNonQuery();
                    if(res > 0)
                    {
                        Response.Redirect("Login.aspx",false);
                    }
                    else
                    {
                        error.InnerText = "Kullanıcı adı veya şifre hatalı.";
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error - " + ex.Message + " ');</script>");
                }
                finally
                {
                    connection.Close();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPassword.aspx");
        }
    }
}