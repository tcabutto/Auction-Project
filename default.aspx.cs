using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try {
            if (Session["Admin"].Equals("True"))
            {
                Response.Redirect("AdminHomePage.aspx");
            }
        }catch{}
        

        //Page.ClientScript.RegisterClientScriptBlock(GetType(), "navbarUnregistered ul", "chooseUnregisteredNav('data');", true);

        if (!ClientScript.IsStartupScriptRegistered("populate"))
         {
                if (Session["Account"] != null)
                {
                logOutBtn.Visible = true;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "populate", "populateRegistered();", true);

                }
                else
                {
                     //Session["Account"] = null;
                     Page.ClientScript.RegisterStartupScript(this.GetType(), "populate", "populateUnregistered();", true);
                    

                }
        }
       




    }

    protected void SearchBtn_Click(object sender, EventArgs e)
    {

    }

    protected void BrowseItemsBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AllItemsPage.aspx");
    }

    protected void logOutBtn_Click(object sender, EventArgs e)
    {
        Session["Account"] = null;
        Response.Redirect("~/default.aspx");
    }
}