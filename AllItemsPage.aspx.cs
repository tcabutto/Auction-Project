using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using App_Data;


public partial class AllItemsPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
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
        string IName= null, description = null, category = null, EndTime = null, EndDate = null, seller = null;
        int key = 0;
        double price = 0;
        while (dr.Read())
        {
            IName = dr.GetString(0);
            price = Convert.ToDouble(dr.GetDecimal(1));
            description = dr.GetString(2);
            category = dr.GetString(3);
            seller = "0" ;
            key = dr.GetInt32(5);
            EndTime = dr.GetDateTime(6).ToString();
            EndDate = dr.GetDateTime(7).ToString();
        }
        Item current = new Item(IName, category, price, seller, key, description, EndTime, EndDate);
        Session["Item"] = current;
        Response.Redirect("~/ItemPage.aspx");
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        IDbCommand cmd;

        cmd = ConnectionFactory.GetCommand("access");
        string name = ((LinkButton)sender).CommandArgument;
        cmd.Connection.Open();
        cmd.CommandText = "SELECT IName, price, description, category, seller, ItemID, EndTime, EndDate FROM Items WHERE IName = '" + name + "'";
        IDataReader dr = cmd.ExecuteReader();
        String IName = null, description = null, category = null, EndTime = null, EndDate = null, seller = null;
        int key = 0;
        double price = 0;
        while (dr.Read())
        {
            IName = dr.GetString(0);
            price = (double)dr.GetDecimal(1);
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

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}