<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccountPageAdmin.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AccountPageAdmin</title>
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
          <ul class="nav">
                    <li><a href="~/AdminHomePage.aspx" runat="server">Home</a></li>
                    <li><a href="AccountPage.aspx">My Account</a></li>
                    <li><a href="AccountPageAdmin.aspx">User Accounts</a></li>
                    <li><a href="ItemsAdmin.aspx">Items</a></li>
                    <li><a href="TicketsPage.aspx">Tickets</a></li>
        </ul>
            </div>
        <div>
    
    </div>
        <br />
        <br />
        <h2 style="margin-left: 35%">&nbsp;</h2>
        <h2 style="margin-left: 35%">Account List</h2>
            <asp:GridView ID="GridView1" runat="server" Height="50%" Width="90%" AutoGenerateColumns="False" DataKeyNames="AccountID" DataSourceID="SqlDataSource1" AllowSorting="True" AllowPaging="True" >
                <Columns>
                    <asp:BoundField DataField="AccountID" HeaderText="AccountID" InsertVisible="False" ReadOnly="True" SortExpression="AccountID" />
                    <asp:BoundField DataField="FName" HeaderText="FName" SortExpression="FName" />
                    <asp:BoundField DataField="LName" HeaderText="LName" SortExpression="LName" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="BDate" HeaderText="BDate" SortExpression="BDate" />
                    <asp:BoundField DataField="billingAddress" HeaderText="billingAddress" SortExpression="billingAddress" />
                    <asp:CheckBoxField DataField="Premium" HeaderText="Premium" SortExpression="Premium" />
                    <asp:CheckBoxField DataField="Admin" HeaderText="Admin" SortExpression="Admin" />
                </Columns>
            </asp:GridView>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="SELECT AccountID, FName, LName, email, BDate, billingAddress, Premium, Admin FROM Accounts"></asp:SqlDataSource>
    </form>
        </body>
</html>
