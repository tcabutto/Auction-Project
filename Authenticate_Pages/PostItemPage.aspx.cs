using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using App_Data;
using System.IO;

public partial class Authenticate_Pages_PostItemPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((User)Session["Account"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        User acc = (User)Session["Account"];
    }

    protected void SubmitBtn_Click(object sender, EventArgs e)
    {
        IDbCommand cmd = ConnectionFactory.GetCommand("access");

        if (FileUpload1.HasFile)
        {
            string fileExt =
               System.IO.Path.GetExtension(FileUpload1.FileName);
            if (fileExt == ".png" || fileExt == ".PNG" || fileExt == ".jpg" || fileExt == ".JPG")
            {
                BuildInsertItemCommand(cmd);


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
        }
    }

    private void BuildInsertItemCommand(IDbCommand cmd)
    {
        cmd.CommandText = "INSERT INTO Items ( AccountID, IName, price, description, category, EndTime, EndDate, [Image], ImageFileName, ImageMime, ImageLength )"
            + "VALUES ( @AccountID, @IName, @price, @description, @category, @EndTime, @EndDate, @Image, @ImageFileName, @ImageMime, @ImageLength )";
        cmd.Parameters.Clear();

        IDbDataParameter param = cmd.CreateParameter();
        String IName = null, description = null, category = null, EndTime = null, EndDate = null, seller = null;
        int key = 0;
        double price = 0;

        //getting pic ready to be inserted to db.
        Stream imageStream = FileUpload1.PostedFile.InputStream;
        int imgLength = FileUpload1.PostedFile.ContentLength;
        string imageExt = FileUpload1.PostedFile.ContentType;
        string imageName = Path.GetFileName(FileUpload1.PostedFile.FileName);
        byte[] imgData = new byte[imgLength - 1];
        //imageStream.Read(imgData, 0, imgLength);

        /*  param.ParameterName = "@ItemID";
          param.Value = getItemIDCommand();
          key = Convert.ToInt32(getItemIDCommand());
          cmd.Parameters.Add(param);*/

        param = cmd.CreateParameter();
        param.ParameterName = "@AccountID";
        User acc = (User)Session["Account"];
        param.Value = getAccountIDCommand(acc);
        seller = Convert.ToString(getAccountIDCommand(acc));
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@IName";
        param.Value = NameTxb.Text;
        IName = NameTxb.Text;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@price";
        param.Value = PriceTxb.Text;
        price = Convert.ToDouble(PriceTxb.Text);
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@description";
        param.Value = DescTxb.Text;
        description = DescTxb.Text;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@category";
        param.Value = CategoryTxb.Text;
        category = CategoryTxb.Text;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@EndTime";
        param.Value = EndTimeDdl.SelectedValue;
        EndTime = EndTimeDdl.SelectedValue;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@EndDate";
        param.Value = Convert.ToString(EndDateCal.SelectedDate);
        EndDate = Convert.ToString(EndDateCal.SelectedDate);
        cmd.Parameters.Add(param);
     
        param = cmd.CreateParameter();
        param.ParameterName = "@Image";
        param.Value = imgData;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@ImageFileName";
        param.Value = imageName;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@ImageMime";
        param.Value = imageExt;
        cmd.Parameters.Add(param);

        param = cmd.CreateParameter();
        param.ParameterName = "@ImageLength";
        param.Value = imgLength;
        cmd.Parameters.Add(param);

        cmd.Connection.Close();
        FileUpload1.SaveAs(Server.MapPath("~/Images/" + imageName));
        Item current = new Item(IName, category, Convert.ToDouble(price), seller, key, description, EndTime, EndDate);
        Session["Item"] = current;

    }

    /*private String getItemIDCommand()
    {
        IDbCommand cmd = ConnectionFactory.GetCommand("access");

        var id = 0;
        cmd.CommandText = "SELECT MAX(ItemID) from Items";
        cmd.Connection.Open();

        IDataReader dr = cmd.ExecuteReader();

        while(dr.Read())
        {
            id = dr.GetInt32(0);
        }
        dr.Close();
        cmd.Connection.Close();
        return Convert.ToString(id + 1);
    }*/

    private int getAccountIDCommand(User acc)
    {
        IDbCommand cmd = ConnectionFactory.GetCommand("access");

        var id = 0;
        cmd.CommandText = "SELECT AccountID FROM Accounts WHERE email = " + "'" + acc.Email + "'";
        cmd.Connection.Open();

        IDataReader dr = cmd.ExecuteReader();

        while(dr.Read())
        {
            id = dr.GetInt32(0);
        }
        dr.Close();
        cmd.Connection.Close();
        
        return id;
    }


}