using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using App_Data;

public partial class AccountSettingsPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((User)Session["Account"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        User acc = (User)Session["Account"];
    }
    //Update Payment Section
    protected void UpPayBtn_Click(object sender, EventArgs e)
    {
        updatePassword.Visible = false;
        updateShipping.Visible = false;
        updatePayment.Visible = true;
    }
    protected void paymentSubmit_Click(object sender, EventArgs e)
    {
        User acc = (User)Session["Account"];
        IDbCommand cmd;
        cmd = ConnectionFactory.GetCommand("access");
        cmd.CommandText = "UPDATE Accounts SET payment = @payment, cardNumber = @cardNumber, expDate = @expDate, securityCode = @securityCode "
                        + "WHERE AccountID = " + acc.Id;
        cmd.Parameters.Clear();

        IDbDataParameter param = cmd.CreateParameter();

        param = cmd.CreateParameter();
        param.ParameterName = "@payment";
        param.Value = paymentDDL.SelectedValue;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@cardNumber";
        param.Value = paymentCardNumber.Text;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@expDate";
        param.Value = paymentDate.Text;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@securityCode";
        param.Value = paymentCode.Text;
        cmd.Parameters.Add(param);

        try
        {
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
        }
        catch(Exception ex)
        {
            Response.Write(ex.ToString());
        }
        updatePayment.Visible = false;
    }
    //Update Shipping Section
    protected void UpShipBtn_Click(object sender, EventArgs e)
    {
        updatePassword.Visible = false;
        updatePayment.Visible = false;
        updateShipping.Visible = true;
    }
    protected void shippingSubmit_Click(object sender, EventArgs e)
    {
        User acc = (User)Session["Account"];
        IDbCommand cmd;
        cmd = ConnectionFactory.GetCommand("access");
        cmd.CommandText = "UPDATE Accounts SET shipping = @shipping, city = @city, state = @state, zip = @zip "
                        + "WHERE AccountID = " + acc.Id;
        cmd.Parameters.Clear();

        IDbDataParameter param = cmd.CreateParameter();

        param = cmd.CreateParameter();
        param.ParameterName = "@shipping";
        param.Value = shippingStreet.Text;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@city";
        param.Value = shippingCity.Text;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@state";
        param.Value = shippingDDL.SelectedValue;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@zip";
        param.Value = shippingZip.Text;
        cmd.Parameters.Add(param);

        try
        {
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
        }
        catch (Exception ex)
        {

        }
        updateShipping.Visible = false;
    }
    //Update Password Section
    protected void ChangePassBtn_Click(object sender, EventArgs e)
    {
        updatePayment.Visible = false;
        updateShipping.Visible = false;
        updatePassword.Visible = true;
    }
    protected void passwordSubmit_Click(object sender, EventArgs e)
    {
        if(password1.Text != password2.Text)
        {
            Response.Write("Passwords do not match");
        }
        else
        {
            User acc = (User)Session["Account"];
            IDbCommand cmd;
            cmd = ConnectionFactory.GetCommand("access");
            cmd.CommandText = "UPDATE Accounts SET password = @password WHERE AccountID = " + acc.Id.ToString();
            cmd.Parameters.Clear();

            IDbDataParameter param = cmd.CreateParameter();

           param = cmd.CreateParameter();
            param.ParameterName = "@password";
            param.Value = password1.Text;
            cmd.Parameters.Add(param);

            //try
            //{
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
            //}
            //catch (Exception ex)
            //{
            //    Response.Write(ex.ToString());
            //}
            updatePassword.Visible = false;
        }
    }

    protected void logOut_Click(object sender, EventArgs e)
    {
        Session["Account"] = null;
    }
}