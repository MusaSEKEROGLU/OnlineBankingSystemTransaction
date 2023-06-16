using System;
using System.Data.SqlClient;

namespace OnlineBankingSystem.Transaction
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection connection;
        SqlCommand cmd;
        SqlDataReader reader;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblAccountNumber.Text = displayAccountNumber();
            }
        }

        string displayAccountNumber()
        {
            //Otomatik HesapNo ve HesapTipi Getirme
            connection = new SqlConnection(Common.GetConnection());
            cmd = new SqlCommand(@"SELECT 'MDA20220000' + CAST( MAX( CAST( SUBSTRING( AccountNumber,12, 58 )
                                 AS INT)) +1 AS VARCHAR) AS AccountNumber FROM Account", connection);
            connection.Open();
            reader = cmd.ExecuteReader();
            string accountNumber = string.Empty;
            while (reader.Read())
            {
                accountNumber = reader["AccountNumber"].ToString();
            }
            reader.Close();
            connection.Close();
            return accountNumber;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //Kayıt Ol Register DB'ye kaydetme
            connection = new SqlConnection(Common.GetConnection());
            cmd = new SqlCommand(@"INSERT INTO Account(AccountNumber,AccountType,UserName,
                                 Gender,Email,Address,SecurityQuestionId,Answer,Amount,Password) 
                                 VALUES (@AccountNumber,@AccountType,@UserName,
                                 @Gender,@Email,@Address,@SecurityQuestionId,@Answer,
                                 @Amount,@Password)", connection);

            cmd.Parameters.AddWithValue("@AccountNumber", lblAccountNumber.Text);
            cmd.Parameters.AddWithValue("@AccountType", lblAccountType.Text);
            cmd.Parameters.AddWithValue("@UserName", txtUsername.Text.Trim());
            cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
            cmd.Parameters.AddWithValue("@SecurityQuestionId", ddlSecurityQuestion.SelectedValue);
            cmd.Parameters.AddWithValue("@Answer", txtAnswer.Text.Trim());
            cmd.Parameters.AddWithValue("@Amount", txtAmount.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
            try
            {
                connection.Open();
                int result = cmd.ExecuteNonQuery();
                if(result > 0)
                {
                    Response.Redirect("Login.aspx", false);
                }
                else
                {
                    error.InnerText = "Geçersiz giriş işlemi";
                }
            }
            catch (Exception ex)
            {
                if(ex.Message.Contains("Şifre ihlali"))
                {
                    error.InnerText = "Kullanıcı adı zaten var";
                }
                else
                {
                    Response.Write("<script>alert('Error - " + ex.Message + " ');</script>");
                }
                
            }
            finally
            {
                connection.Close();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //Register Çıkış Yap
            Response.Redirect("Login.aspx");
        }
    }
}