using System;
using System.Data.SqlClient;

namespace OnlineBankingSystem.Transaction
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection connection;
        SqlCommand cmd;
        SqlDataReader reader;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //Kayıt Ol
            Response.Redirect("Register.aspx");
        }

        protected void lbForgotPassword_Click(object sender, EventArgs e)
        {
            //Şifremi Unuttum
            if(txtUsername.Text == string.Empty)
            {               
                txtUsername.Focus();
            }
            else
            {
                Session["ParolanızıMıUnuttunuz!"] = txtUsername.Text.Trim();
                Response.Redirect("ForgotPassword.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //Giriş Yap            
            connection = new SqlConnection(Common.GetConnection());
            cmd = new SqlCommand(@"SELECT * FROM Account Where 
                                 UserName = @UserName and Password = @Password", connection);
            cmd.Parameters.AddWithValue("@UserName", txtUsername.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
            try
            {
                connection.Open();
                reader = cmd.ExecuteReader();
                bool isTrue = false;
                while (reader.Read())
                {
                    isTrue = true;
                    Session["userId"] = reader["AccountId"].ToString();
                }
                if (isTrue)
                {
                    Response.Redirect("PerformTransaction.aspx", false);
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
                reader.Close();
                connection.Close();
            }
        }
    }
}