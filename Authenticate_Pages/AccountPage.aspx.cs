using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AccountPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if((User)Session["Account"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        User acc = (User)Session["Account"];
        UserNameLbl.Text = acc.Name;
        
    }

    protected void LogOutBtn_Click(object sender, EventArgs e)
    {
        Session["Account"] = null;
        Response.Redirect("~/default.aspx");
    }

    protected void YourItemsBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyItemsPage.aspx");
    }

    protected void HomeBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/default.aspx");
    }

    protected void AcctSettingsBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("AccountSettingsPage.aspx");
    }

    protected void PostItemBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("PostItemPage.aspx");
    }
}