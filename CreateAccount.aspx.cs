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

public partial class CreateAccount : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateBtn_Click(object sender, EventArgs e)
    {
     //   IDbConnection con;
        IDbCommand cmd = ConnectionFactory.GetCommand("access");
        //IDataReader dr;


       // con = new SqlConnection();
       
      //  string conn = ConfigurationManager.ConnectionStrings["tacabuttoConnectionString"].ConnectionString;
       // txtMsg.Text = "***Connection String: \n" + /*conn goes here*/ "\n" + "***Connection State: " + con.State + "\n\n";

        BuildInsertUserCommand(cmd);

        try
        {
            cmd.Connection.Open();
            //debug msg
            txtMsg.Text += "IDbConnection.State: " + cmd.Connection.State.ToString() + "\r\n";


            int num = cmd.ExecuteNonQuery();

            cmd.Connection.Close();
            //debugging afterwards.
            txtMsg.Text += "User added: " + /*num + */ "\r\n";
        }
        catch(Exception ex)
        {
            txtMsg.Text = "Error adding user, AccountID may be wrong\r\n";
            txtMsg.Text += ex.ToString();
        }

        Response.Redirect("Authenticate_Pages/AccountPage.aspx");


        



    }

    private void BuildInsertUserCommand(IDbCommand cmd)
    {   //userid removed. May need to add in if unsuccessful.
        cmd.CommandText = "INSERT INTO Accounts ( AccountID, FName, LName, email, [password], shipping, city, state, payment, cardNumber, expDate, securityCode, billingAddress, zip, BDate )"
                                    + "VALUES (@AccountID, @FName, @LName, @email, @password, @shipping, @city, @state, @payment, @cardNumber, @expDate, @securityCode, @billingAddress, @zip, @BDate )";
        cmd.Parameters.Clear();

        IDbDataParameter param = cmd.CreateParameter();
        string id = getAccountIDCommand();
        param.ParameterName = "@AccountID";
        param.Value = id;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@FName";
        param.Value = FNameTxtbx.Text;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@LName";
        param.Value = LNameTxtbx.Text;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@email";
        param.Value = EmailTxtbx.Text;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@password";
        param.Value = PassTxtbx.Text;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@shipping";
        param.Value = ShippingTxtbx.Text;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@city";
        param.Value = CityTxtbx.Text;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@state";
        param.Value = StateDll.SelectedValue;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@payment";
        param.Value = CardRbl.SelectedValue;
        cmd.Parameters.Add(param);
        //May need to create variables earlier to test for needed format. May just do that on client side with js while typing.
        param = cmd.CreateParameter();
        param.ParameterName = "@cardNumber";
        param.Value = CardTxtbx.Text;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@expDate";
        param.Value = expMonthDdl.SelectedValue + "/" + expYearDdl.SelectedValue;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@securityCode";
        param.Value = secCodeTxtbx.Text;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@billingAddress";
        param.Value = BilllingTxtbx.Text;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@zip";
        param.Value = ZipTxtbx.Text;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@BDate";
        param.Value = birthMonthDdl.SelectedValue + "/" + BirthDayDdl.SelectedValue + "/" + birthYearTxtbx.Text;
        cmd.Parameters.Add(param);

        /*  param = cmd.CreateParameter();
          param.ParameterName = "@premium";
          param.Value = "0";
          cmd.Parameters.Add(param);*/

        User registered = new User(false, EmailTxtbx.Text, PassTxtbx.Text, FNameTxtbx.Text + " " + LNameTxtbx.Text, CardRbl.SelectedValue, Convert.ToInt32(id));
        Session["Account"] = registered;

    }

    private String getAccountIDCommand()
    {
        IDbCommand cmd = ConnectionFactory.GetCommand("access");

        var id = 0;
        cmd.CommandText = "Select Max(AccountID) from Accounts";
        cmd.Connection.Open();

        IDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            id = dr.GetInt32(0);
        }
        dr.Close();
        cmd.Connection.Close();
        return Convert.ToString(id + 1);
    }


    protected void ShippingTxtbx_TextChanged(object sender, EventArgs e)
    {

    }
}