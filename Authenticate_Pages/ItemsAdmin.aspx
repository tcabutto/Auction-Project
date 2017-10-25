<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ItemsAdmin.aspx.cs" Inherits="ItemsAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ItemsAdmin</title>
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
            <br />
            <br />
            <br />
            <br />
            <br />
            </div>
            <h2 style="margin-left: 30%">Item List</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID" DataSourceID="SqlDataSource1" Width="1063px" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" />
                    <asp:TemplateField HeaderText="IName" SortExpression="IName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("IName") %>' OnClick="LinkButton1_Click" Text='<%# Eval("IName") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="AccountID" HeaderText="AccountID" SortExpression="AccountID" />
                    <asp:BoundField DataField="Seller" HeaderText="Seller" SortExpression="Seller" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="SELECT ItemID, IName, category, price, AccountID, Seller FROM Items"></asp:SqlDataSource>
            <br />
        </p>
    </form>
</body>
</html>
