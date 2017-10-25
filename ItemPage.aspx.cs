using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using App_Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.OleDb;
using System.Drawing;
using System.IO;

public partial class ItemPage : System.Web.UI.Page
{
    double price;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Item"] != null)
        {
            Item current = (Item)Session["Item"];

            IDbCommand cmd = ConnectionFactory.GetCommand("access");
            LoadItem(cmd, current);

            
            //Session["Item"] = null;
        }
        else
        {
            ItemNameLbl.Text = "No Item";
        }
    }

    private void LoadItem(IDbCommand cmd, Item current)
    {
        cmd.Connection.Open();
        string ItemID = Convert.ToString(current.Key);
        cmd.CommandText = "SELECT IName, price, description, category, ItemID, EndTime, EndDate FROM Items WHERE ItemID = " + ItemID;
        IDataReader dr = cmd.ExecuteReader();
        string IName = null, description = null, category = null, EndTime = null, EndDate = null;
        int key = 0;
        string imageExt = null;
        string imageName = null;
        int imageLength = 0;
        byte[] imgData;
        while (dr.Read())
        {
            IName = dr.GetString(0);
            
            description = dr.GetString(2);
            category = dr.GetString(3);
            key = dr.GetInt32(4);
            EndTime = dr.GetDateTime(5).ToString();
            EndDate = dr.GetDateTime(6).ToString();
            try
            {
                price = Convert.ToDouble(dr.GetDecimal(1));
                imageName = dr.GetString(8);
                imageExt = dr.GetString(9);
                imageLength = dr.GetInt32(10);
                imgData = (byte[])dr.GetValue(6);
            }
            catch (Exception e)
            {
                e.GetBaseException();
            }
        }
        dr.Close();
        cmd.Connection.Close();
        ItemPic.ImageUrl += imageName;




        ItemNameLbl.Text = IName;
        PriceLbl.Text = Convert.ToString(price);
        DescTxtBx.Text = description;
        CategoryLbl.Text = category;
        EndLbl.Text = EndDate;
        /*****************Testing upload pic to asp imagebox*************************/
        try
        {
            

        }
        catch (Exception e)
        {
            e.GetBaseException();
        }
        
     //   ItemPic.ImageUrl = ""



//        Stream stream = new MemoryStream(imgData);
//        System.Drawing.Image image = System.Drawing.Image.FromStream(stream);
        
    }












    private void UpdateItemInfo(IDbCommand cmd, String ItemId)
    {
        cmd.CommandText = "SELECT * FROM Items WHERE ItemID = #" + ItemId + "#";
        IDataReader dr = cmd.ExecuteReader();
        
    }

    protected void MakeBidBtn_Click(object sender, EventArgs e)
    {
        if ((User)Session["Account"] == null)
        {
            Session["Item"] = null;
            Response.Redirect("~/Login.aspx");
        }

        IDbCommand cmd;

        User acc = (User)Session["Account"];
        double p;
        try
        {
            p = Convert.ToDouble(bidAmtTxtbx.Text);
        }
        catch
        {
            p = 0;
        }
        

        if (p >= price + 1)
        {
            cmd = ConnectionFactory.GetCommand("access");
            Item current = (Item)Session["Item"];
            //cmd.CommandText = "UPDATE Items SET price = @price, Buyer = @Buyer WHERE IName = '" + current.Name + "'";
            cmd.CommandText = "UPDATE Items SET price = @price, Buyer = @Buyer WHERE ItemID = " + current.Key;
            cmd.Parameters.Clear();

            IDbDataParameter param = cmd.CreateParameter();

            param = cmd.CreateParameter();
            param.ParameterName = "@price";
            param.Value = p.ToString();
            cmd.Parameters.Add(param);
            current.Price = p;

            int buyer = getAccountIDCommand(acc);
            param = cmd.CreateParameter();
            param.ParameterName = "@Buyer";
            param.Value = Convert.ToString(buyer);
            cmd.Parameters.Add(param);


            try
            {
                cmd.Connection.Open();
                //debug msg
                txtMsg.Text += "IDbConnection.State: " + cmd.Connection.State.ToString() + "\r\n";


                int num = cmd.ExecuteNonQuery();

                cmd.Connection.Close();
                //debugging afterwards.
                txtMsg.Text += "Item added: " + num + "\r\n";
                Response.Redirect("~/ItemPage.aspx");
            }
            catch (Exception ex)
            {
                txtMsg.Text = "Error adding user, AccountID may be wrong\r\n";
                txtMsg.Text += ex.ToString();
            }


        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Bid!')", true);
        }

        
                
                
   //     Session["Item"] = null;
    }

/*    private OleDbConnection OpenDB()
    {
        string conS = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\bllit\Workspace\Auction System\App_Data";
        OleDbConnection con = new OleDbConnection(conS);
        return con;
    }*/

    protected void logOut_Click(object sender, EventArgs e)
    {
        Session["Account"] = null;
    }

    private int getAccountIDCommand(User acc)
    {
        IDbCommand cmd = ConnectionFactory.GetCommand("access");

        var id = 0;
        cmd.CommandText = "SELECT AccountID FROM Accounts WHERE email = " + "'" + acc.Email + "'";
        cmd.Connection.Open();

        IDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            id = dr.GetInt32(0);
        }
        dr.Close();
        cmd.Connection.Close();

        return id;
    }

    protected void ComplaintBtn_Click(object sender, EventArgs e)
    {
        if(ComplaintTxtbx.Text.Equals(""))
        {
            ComplaintTxtbx.Text = "Please enter a complaint if you have one.";
            ComplaintTxtbx.BackColor = Color.Red;
        }
        else
        {
            IDbCommand cmd = ConnectionFactory.GetCommand("access");
            sendComplaint(cmd, ComplaintTxtbx.Text);
        }
    }

    private void sendComplaint(IDbCommand cmd, string complaint)
    {
        cmd.CommandText = "INSERT INTO Tickets ( AccountID, Description )"
                                    + "VALUES (@AccountID, @Description )";
        cmd.Parameters.Clear();

        IDbDataParameter param = cmd.CreateParameter();

        param.ParameterName = "@AccountID";
        param.Value = getAccountIDCommand();
        cmd.Parameters.Add(param);
    }

    private string getAccountIDCommand()
    {
        string user = User.Identity.Name;




        return user;
    }
}