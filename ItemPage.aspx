<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ItemPage.aspx.cs" Inherits="ItemPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Item page</title>
    <link href="Site.css" rel="stylesheet" />
    <style>
body {margin:0;}

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
    background-color: #4CAF50;
}
</style>
    </head>
<body>
    
    
         <form id="form1" runat="server">
    
    
         <div>
        <ul id="navbar">
           <li><a href="Authenticate_Pages/AccountPage.aspx">My Account</a></li>
            <li><a href="default.aspx">Home</a></li>
                    
        </ul>
            </div>
             <br />
             <br />
             <br />
             <br />
        <br />
            
    <div class="sideL">
        
        <asp:Label ID="ItemNameLbl" runat="server" style="text-align: center"></asp:Label>
        <br />
        <asp:Label ID="CategoryLbl" runat="server"></asp:Label>
        <br />
        <asp:Image ID="ItemPic" runat="server" Height="142px" Width="158px" ImageUrl="~/Images/" />
        
    </div>
    <div class="center">
        <br />
             <asp:Label ID="BidLbl" runat="server" Text="Starting bid:"></asp:Label>
&nbsp;$<asp:Label ID="PriceLbl" runat="server"></asp:Label>
        <br />
        Bid:
        <asp:TextBox ID="bidAmtTxtbx" runat="server" Width="110px" ></asp:TextBox>
&nbsp;&nbsp;
        <asp:Button ID="MakeBidBtn" runat="server" CssClass="btnSettings" Text="Submit bid" OnClick="MakeBidBtn_Click" BackColor="#4E9902" />
&nbsp;<br />
        <br />
        Ending time:
        <asp:Label ID="EndLbl" runat="server"></asp:Label>
             </div>
        <div class="SideBottom">
            
            Description:<br />
            <asp:TextBox ID="DescTxtBx" runat="server" Height="151px" ReadOnly="True" Width="290px"></asp:TextBox>
            
            <br />
            <br />
            <br />
            <asp:Button ID="ComplaintBtn" runat="server" BackColor="#CC9900" BorderStyle="None" CssClass="btnSettings" OnClick="ComplaintBtn_Click" Text="Send complaint" />
            <asp:TextBox ID="ComplaintTxtbx" runat="server" Height="72px" TextMode="MultiLine" Width="203px"></asp:TextBox>
            <br />
            
        </div>
       
       
             <p>
            <asp:TextBox ID="txtMsg" runat="server" Height="224px" ReadOnly="True" Width="537px" TextMode="MultiLine" Visible="False"></asp:TextBox>
            
             </p>
       
       
         </form>
       
       
</body>
</html>
