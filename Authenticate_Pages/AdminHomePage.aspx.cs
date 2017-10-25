using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminHomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            Response.Redirect("~/default.aspx");
        }

        if (!ClientScript.IsStartupScriptRegistered("populate"))
        {
            if (Session["Account"] != null)
            {
                //logOutBtn.Visible = true;
                User acc = (User)Session["Account"];

                AdminLbl.Text = acc.Name;
            }
        }
    }

    protected void ViewAcctsBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Authenticate_Pages/AccountPageAdmin.aspx");
    }

    protected void ViewItemBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Authenticate_Pages/ItemsAdmin.aspx");
    }

    protected void ViewTicketsBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Authenticate_Pages/TicketsPage.aspx");
    }

    protected void logOutBtn_Click(object sender, EventArgs e)
    {
        Session["Account"] = null;
        Session["Admin"] = null;
        Response.Redirect("~/default.aspx");
    }
}