<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccountSettingsPage.aspx.cs" Inherits="AccountSettingsPage" %>

<!DOCTYPE html>
<script runat="server">
</script>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title>Account settings page</title>   






     <link href= "../Site.css" rel="stylesheet" />
    <style type="text/css">
        #Button2 {
        }
        #UpPremBtn {
            width: 287px;
            height: 41px;
        }
        #UpPremBtn0 {
            width: 287px;
            height: 41px;
        }
        ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
    position: fixed;
    top: 0;
    width: 100%;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color: #4CAF5;

}

#updatePayment{
    display:block;
    position: absolute;
    float: right;
    top: 50%;
    width: 287px;
    padding:25px;
    border: 15px solid #999966;
    margin: 15px;
    text-align:left;
    transition: all linear 4s;
    box-shadow: 0 5px 3px 2px #999966;
            left: 35%;
        }
#updateShipping{
    display:block;
    position: absolute;
    float: right;
    top: 50%;
    width: 287px;
    padding:25px;
    border: 15px solid #999966;
    margin: 15px;
    text-align:left;
    transition: all linear 4s;
    box-shadow: 0 5px 3px 2px #999966;
            left: 35%;
        }
#updatePassword{
    display:block;
    position: absolute;
    float: right;
    top: 50%;
    width: 287px;
    padding:25px;
    border: 15px solid #999966;
    margin: 15px;
    text-align:left;
    transition: all linear 4s;
    box-shadow: 0 5px 3px 2px #999966;
            left: 35%;
        }
    </style>
</head>
   
<body>
         <ul class="nav">
                    <li><a href= "../default.aspx">Home</a></li>
                    <li><a href="AccountPage.aspx">My Account</a></li>
                    <li><a href="MyItemsPage.aspx">MyItems</a></li>
                    
        </ul>
    <form id="form1" runat="server">   
             
     
          
        <h2>&nbsp;</h2>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <h1>Account settings</h1>
        <div>
            <input id="UpPremBtn" type="button" value="Upgrade to Premium" style="background-color:gold" class="btnSettings" onclick="displayPremium()"/></div>
        <div id="premiumClick" style="width: 353px; margin-left: 708px;color:red;">By checking this box, you agree to be charged unnecessary amounts of money on a monthly period to upgrade to premium.<br />
            <br />
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Confirm upgrade" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" BackColor="#006600" BorderStyle="None" CssClass="btnSettings" Height="33px" Text="Submit" Width="98px" />
        </div>
        <div>
            <asp:Button id="UpPayBtn" runat="server" Text="Update Payment" style="background-color: #009900; width: 287px; height: 41px;" class="btnSettings" onclick="UpPayBtn_Click"/></div>
        <div id="updatePayment" runat="server" visible="false">Choose payment method:
            <asp:DropDownList ID="paymentDDL" runat="server">
                <asp:ListItem>Visa</asp:ListItem>
                <asp:ListItem>MasterCard</asp:ListItem>
                <asp:ListItem>PayPal</asp:ListItem>
            </asp:DropDownList>
            <br />
            Card number:&nbsp&nbsp&nbsp
            <asp:TextBox ID="paymentCardNumber" runat="server" TextMode="Number" Width="163px"></asp:TextBox>
            <br />
            Expiration Date
            <asp:TextBox ID="paymentDate" runat="server"></asp:TextBox>
            <br />
            Security Code&nbsp&nbsp
            <asp:TextBox ID="paymentCode" runat="server" Width="34px"></asp:TextBox>
            <br />
            <asp:Button ID="paymentSubmit" runat="server" onclick="paymentSubmit_Click" Text="Update" Width="100px" />
        </div>
        <div>
            <asp:Button id="UpShipBtn" runat="server" text="Update Shipment" onclick="UpShipBtn_Click" style="background-color: #1a53ff; width: 286px; height: 40px;" class="btnSettings"/></div>
        <div id="updateShipping" runat="server" visible="false">
            Street:
            <asp:TextBox ID="shippingStreet" runat="server"></asp:TextBox><br />
            City:
            <asp:TextBox ID="shippingCity" runat="server"></asp:TextBox><br />
            State:
            <asp:DropDownList ID="shippingDDL" runat="server">
                <asp:ListItem Selected="True" Value="0">--</asp:ListItem>
                <asp:ListItem>AL</asp:ListItem><asp:ListItem>AK</asp:ListItem><asp:ListItem>AZ</asp:ListItem><asp:ListItem>CA</asp:ListItem>
                <asp:ListItem>CO</asp:ListItem><asp:ListItem>CT</asp:ListItem><asp:ListItem>DE</asp:ListItem><asp:ListItem>DC</asp:ListItem>
                <asp:ListItem>FL</asp:ListItem><asp:ListItem>GA</asp:ListItem><asp:ListItem>HI</asp:ListItem><asp:ListItem>ID</asp:ListItem>
                <asp:ListItem>IL</asp:ListItem><asp:ListItem>IN</asp:ListItem><asp:ListItem>IA</asp:ListItem><asp:ListItem>KS</asp:ListItem>
                <asp:ListItem>AR</asp:ListItem><asp:ListItem>KY</asp:ListItem><asp:ListItem>LA</asp:ListItem><asp:ListItem>ME</asp:ListItem>
                <asp:ListItem>MD</asp:ListItem><asp:ListItem>MA</asp:ListItem><asp:ListItem>MI</asp:ListItem><asp:ListItem>MN</asp:ListItem>
                <asp:ListItem>MS</asp:ListItem><asp:ListItem>MO</asp:ListItem><asp:ListItem>MT</asp:ListItem><asp:ListItem>NE</asp:ListItem>
                <asp:ListItem>NV</asp:ListItem><asp:ListItem>NH</asp:ListItem><asp:ListItem>NJ</asp:ListItem><asp:ListItem>NM</asp:ListItem>
                <asp:ListItem>NY</asp:ListItem><asp:ListItem>NC</asp:ListItem><asp:ListItem>ND</asp:ListItem><asp:ListItem>OH</asp:ListItem>
                <asp:ListItem>OK</asp:ListItem><asp:ListItem>OR</asp:ListItem><asp:ListItem>PA</asp:ListItem><asp:ListItem>RI</asp:ListItem>
                <asp:ListItem>SC</asp:ListItem><asp:ListItem>SD</asp:ListItem><asp:ListItem>TN</asp:ListItem><asp:ListItem>TX</asp:ListItem>
                <asp:ListItem>UT</asp:ListItem><asp:ListItem>VT</asp:ListItem><asp:ListItem>VA</asp:ListItem><asp:ListItem>WA</asp:ListItem>
                <asp:ListItem>WV</asp:ListItem><asp:ListItem>WI</asp:ListItem><asp:ListItem>WY</asp:ListItem>
            </asp:DropDownList>
            <br />
            Zip:
            <asp:TextBox ID="shippingZip" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="shippingSubmit" runat="server" Text="Update" onclick="shippingSubmit_Click" Width="100px" />
        </div>
        <div>
            <asp:Button id="ChangePassBtn" runat="server" text="Change password" OnClick="ChangePassBtn_Click" style="background-color: #e68a00; width: 287px; height: 41px;" class="btnSettings"/></div>
        <div id="updatePassword" runat="server" visible="false">
            New password:<br />
            <asp:Textbox ID="password1" runat="server"></asp:Textbox><br />
            Confirm Password:<br />
            <asp:TextBox ID="password2" runat="server"></asp:TextBox><br />
            <asp:Button ID="passwordSubmit" runat="server" Text="Update" onclick="passwordSubmit_Click"/>
        </div>
        <div>
            <input id="DeleteAcctBtn" type="button" value="Delete Account" style="background-color: #ff1a1a; width: 287px; height: 41px;" class="btnSettings"/></div>
        <div>&nbsp;</div>
        
    </form>
    <script type="text/javascript">
        function displayPremium()
        {
            document.getElementById("premiumClick").style.display = "block";
        }

    </script>
</body>
</html>


