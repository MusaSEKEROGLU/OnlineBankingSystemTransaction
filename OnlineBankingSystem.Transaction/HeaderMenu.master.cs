using System;
using static OnlineBankingSystem.Transaction.Common;

namespace OnlineBankingSystem.Transaction
{
    public partial class HeaderMenu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["userId"] != null)
                {
                    Utils utils = new Utils();
                    lblBalance.Text = utils.accountBalance(Convert.ToInt32(Session["userId"])).ToString();

                }
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}