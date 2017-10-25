<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TicketsPage.aspx.cs" Inherits="TicketsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
          <ul class="nav">
                    <li><a href="~/AdminHomePage.aspx" runat="server">Home</a></li>
                    <li><a href="AccountPage.aspx">My Account</a></li>
                    <li><a href="AccountPageAdmin.aspx">User Accounts</a></li>
                    <li><a href="ItemsAdmin.aspx">Items</a></li>
                    <li><a href="TicketsPage.aspx">Tickets</a></li>
        </ul>
            </div>
        <div class="center">
            <h1 style="text-align: center; height: 83px">&nbsp;</h1>
            <h1 style="text-align: center; height: 83px">Tickets</h1>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="SELECT TicketID, AccountID, Description, Status FROM Tickets" DeleteCommand="DELETE FROM Tickets"></asp:SqlDataSource>
            <br />
         </div>   
            <asp:GridView ID="GridView1" runat="server" Height="50%" Width="90%" AutoGenerateColumns="False" DataKeyNames="TicketID" DataSourceID="SqlDataSource1" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="TicketID" HeaderText="TicketID" InsertVisible="False" ReadOnly="True" SortExpression="TicketID" />
                    <asp:BoundField DataField="AccountID" HeaderText="AccountID" SortExpression="AccountID" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:CheckBoxField DataField="Status" HeaderText="Status" SortExpression="Status" />
                </Columns>
            </asp:GridView>
            
    </form>
</body>
</html>
