using System;
using System.Data;
using System.Data.SqlClient;
using static OnlineBankingSystem.Transaction.Common;

namespace OnlineBankingSystem.Transaction
{
    public partial class PerformTransaction : System.Web.UI.Page
    {
        SqlConnection connection;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        SqlDataReader reader;
        SqlTransaction trans = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userId"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                getAccountNumber();
            }
        }

        void getAccountNumber()
        {
            try
            {
                connection = new SqlConnection(Common.GetConnection());
                cmd = new SqlCommand(@"SELECT AccountId, AccountNumber FROM Account Where 
                                     AccountId != @AccountId", connection);
                cmd.Parameters.AddWithValue("@AccountId", Session["userId"]);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                ddlPayeeAccountNumber.DataSource = dt;
                ddlPayeeAccountNumber.DataTextField = "AccountNumber";
                ddlPayeeAccountNumber.DataValueField = "AccountId";
                ddlPayeeAccountNumber.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error - " + ex.Message + " ');</script>");
            }
        }


        protected void btnSend_Click(object sender, EventArgs e)
        {
            if(Session["userId"] != null)
            {
                connection = new SqlConnection(Common.GetConnection());
                connection.Open();

                try
                {
                    int res = 0;
                    Utils utils = new Utils();
                    int balanceAmount = utils.accountBalance(Convert.ToInt32(Session["userId"]));

                    if(Convert.ToInt32(txtAmount.Text.Trim()) <= balanceAmount)
                    {
                        trans = connection.BeginTransaction();
                        cmd = new SqlCommand(@"INSERT INTO [Transaction](SenderAccountId,ReceiverAccountId,
                                             MobileNumber,Amount,TransactionType,Remarks) VALUES 
                                             (@SenderAccountId,@ReceiverAccountId,@MobileNumber,@Amount,
                                             @TransactionType,@Remarks)",connection,trans);

                        cmd.Parameters.AddWithValue("@SenderAccountId", Session["userId"]);
                        cmd.Parameters.AddWithValue("@ReceiverAccountId", ddlPayeeAccountNumber.SelectedValue);
                        cmd.Parameters.AddWithValue("@MobileNumber",txtMobileNumber.Text.Trim());
                        cmd.Parameters.AddWithValue("@Amount", txtAmount.Text.Trim());
                        cmd.Parameters.AddWithValue("@TransactionType", "DR");
                        cmd.Parameters.AddWithValue("@Remarks", txtRemarks.Text.Trim());
                        res = cmd.ExecuteNonQuery();

                        UpdateSenderAccountBalance(Convert.ToInt32(Session["userId"]), balanceAmount,
                            Convert.ToInt32(txtAmount.Text.Trim()),connection,trans);

                        UpdateReceiverAccountBalance(Convert.ToInt32(ddlPayeeAccountNumber.SelectedValue),
                            Convert.ToInt32(txtAmount.Text.Trim()),connection,trans);

                        trans.Commit();                     

                        res = 1;
                        if(res > 0)
                        {
                            Response.Redirect("MyDebit.aspx", false);
                        }
                        else
                        {
                            error.InnerText = "Geçersiz işlem";
                        }                      
                    }
                
                    else
                    {
                        error.InnerText = "Geçersiz işlem";
                    }
                }
                catch (Exception)
                {
                    try
                    {
                        trans.Rollback();                       
                    }
                 
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error - " + ex.Message + " ');</script>");                    
                    }
                }
                finally
                {
                    connection.Close();
                }
            }
        }

        void UpdateSenderAccountBalance(int _senderId,int _dbAmount,int _amount,SqlConnection sqlConnection,SqlTransaction sqlTransaction)
        {
            try
            {
                if(_dbAmount >= _amount)
                {
                    _dbAmount -= _amount;
                    cmd = new SqlCommand("UPDATE Account SET Amount = @Amount Where AccountId = @AccountId"
                        ,sqlConnection,sqlTransaction);
                    cmd.Parameters.AddWithValue("@Amount", _dbAmount);
                    cmd.Parameters.AddWithValue("@AccountId", _senderId);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error - " + ex.Message + " ');</script>");
            }
        }

        void UpdateReceiverAccountBalance(int _receiverId,int _amount, SqlConnection sqlConnection, SqlTransaction sqlTransaction)
        {
            int _dbAmount = 0;
            cmd = new SqlCommand("SELECT Amount FROM Account Where AccountId = @AccountId",
                sqlConnection,sqlTransaction);          
            cmd.Parameters.AddWithValue("@AccountId", _receiverId);
            try
            {
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    _dbAmount = (int)reader["Amount"];
                    _dbAmount += _amount;
                    cmd = new SqlCommand("UPDATE Account SET Amount = @Amount Where AccountId = @AccountId",
                        sqlConnection,sqlTransaction);
                    cmd.Parameters.AddWithValue("@Amount", _dbAmount);
                    cmd.Parameters.AddWithValue("@AccountId", _receiverId);
                    cmd.ExecuteNonQuery();
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error - " + ex.Message + " ');</script>");
            } 
            
        }

        protected void btnGiveUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("PerformTransaction.aspx");
        }
    }
}