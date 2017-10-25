using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using App_Data;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submitBtn_Click(object sender, EventArgs e)
    {
        IDbCommand cmd;
        cmd = ConnectionFactory.GetCommand("Access");
        if (validate(cmd))
        {
            Response.Redirect("Authenticate_Pages/AccountPage.aspx");
        }
        else
        {
            Msg.Text = "Please input valid information";
        }
    }

    private Boolean validate(IDbCommand cmd)
    {
        Boolean retval = false;

        cmd.Connection.Open();
        cmd.CommandText = "SELECT email, [password] FROM Accounts WHERE email = '" + emailTxtbx.Text + "' AND password = '" + passTxtbx.Text + "'";
        IDataReader dr = cmd.ExecuteReader();
        String pass = null, email = null;
        while(dr.Read())
        {
            email = dr.GetString(0);
            pass = dr.GetString(1);
        }

        dr.Close();
        buildUserAccount(cmd);


        cmd.Connection.Close();

        if (email == null) { return retval; }
        else if(pass == null){ return retval; }
        else { retval = true; }
        return retval;
    }

    private void buildUserAccount(IDbCommand cmd)
    {
        cmd.CommandText = "Select AccountID, FName, LName, email, [password], payment, premium, admin FROM Accounts WHERE email = '" + emailTxtbx.Text + "' AND password = '" + passTxtbx.Text + "'";
    
        IDataReader dr = cmd.ExecuteReader();
        String FName = null, LName = null, email = null, password = null, payment=null;
        int AccountID = 0;
        var premium = false;
        var admin = false;
        while(dr.Read())
        {
            AccountID = dr.GetInt32(0);
            FName = dr.GetString(1);
            LName = dr.GetString(2);
            email = dr.GetString(3);
            password = dr.GetString(4);
            payment = dr.GetString(5);
            if (dr.GetBoolean(6) != false) { premium = true; }
            if(dr.GetBoolean(7) != false) {
                admin = true;
                Session["Admin"] = "True";
            }
        }
        dr.Close();
        User registered = new User(premium, email, password, FName + " " + LName, payment, AccountID);
        Session["Account"] = registered;
    }

}