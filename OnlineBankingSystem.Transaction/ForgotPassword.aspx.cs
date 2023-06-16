using System;
using System.Data.SqlClient;

namespace OnlineBankingSystem.Transaction
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        SqlConnection connection;
        SqlCommand cmd;
        SqlDataReader reader;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getUserSecurityQuestion();
            }
        }

        void getUserSecurityQuestion()
        {
            if (Session["ParolanızıMıUnuttunuz!"] != null )
            {
                connection = new SqlConnection(Common.GetConnection());
                cmd = new SqlCommand(@"SELECT a.UserName,s.SecurityQuestionName,a.Answer  FROM Account 
                                     a inner join SecurityQuestion s on a.SecurityQuestionId = 
                                     s.SecurityQuestionId Where Username = @Username", connection);
                cmd.Parameters.AddWithValue("@UserName", Session["ParolanızıMıUnuttunuz!"]);

                try
                {
                    connection.Open();
                    reader = cmd.ExecuteReader();
                    bool isTrue = false;
                    while (reader.Read())
                    {
                        isTrue = true;
                        lblUserName.Text = reader["UserName"].ToString();
                        lblSecurityQuestion.Text = reader["SecurityQuestionName"].ToString();
                        hdnAnswer.Value = reader["Answer"].ToString();

                    }
                    if (!isTrue)
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

        protected void btnForgotPassword_Click(object sender, EventArgs e)
        {
            if(txtAnswer.Text == hdnAnswer.Value)
            {
                Response.Redirect("ChangePassword.aspx");
            }
            else
            {
                error.InnerText = "Kullanıcı adı veya şifre hatalı.";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}