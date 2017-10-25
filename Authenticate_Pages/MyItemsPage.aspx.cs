using App_Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyItemsPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((User)Session["Account"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        if(Session["Admin"] == null)
        {
            sellerGrid.Visible = false;
        }
        else
        {
            UpPremLbl.Visible = false;
        }
        User acc = (User)Session["Account"];
        UserNameLbl.Text = acc.Name;

        Parameter p1 = new Parameter();
        p1.Name = "AccountID";
        p1.Type.Equals("Int32");
        p1.DefaultValue = acc.Id.ToString();
        SqlDataSource1.SelectParameters.Add(p1);

        Parameter p2 = new Parameter();
        p2.Name = "Buyer";
        p2.Type.Equals("Int32");
        p2.DefaultValue = acc.Id.ToString();
        SqlDataSource2.SelectParameters.Add(p2);

        Parameter p3 = new Parameter();
        p3.Name = "AccountID";
        p3.Type.Equals("Int32");
        p3.DefaultValue = acc.Id.ToString();
        SqlDataSource3.SelectParameters.Add(p3);


    }



    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        IDbCommand cmd;

        cmd = ConnectionFactory.GetCommand("access");
        string name = ((LinkButton)sender).CommandArgument;
        cmd.Connection.Open();
        cmd.CommandText = "SELECT IName, price, description, category, seller, ItemID, EndTime, EndDate FROM Items WHERE IName = '" + name + "'";
        IDataReader dr = cmd.ExecuteReader();
        string IName = null, description = null, category = null, EndTime = null, EndDate = null, seller = null;
        int key = 0;
        double price = 0;
        while (dr.Read())
        {
            IName = dr.GetString(0);
            price = Convert.ToDouble(dr.GetDecimal(1));
            description = dr.GetString(2);
            category = dr.GetString(3);
            seller = "0";
            key = dr.GetInt32(5);
            EndTime = dr.GetDateTime(6).ToString();
            EndDate = dr.GetDateTime(7).ToString();
        }
        Item current = new Item(IName, category, price, seller, key, description, EndTime, EndDate);
        Session["Item"] = current;
        Response.Redirect("~/ItemPage.aspx");
    }
}