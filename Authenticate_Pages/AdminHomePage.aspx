<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminHomePage.aspx.cs" Inherits="AdminHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin home page</title>
    <link href="Site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <ul class="navbar">
            <a href="HomePage.aspx">
            <li>
                <h2>Log out</h2>
            </li>
                </a>
        </ul>
    <div class="center">
    <h1>Welcome Admin <asp:Label ID="AdminLbl" runat="server"></asp:Label>!</h1>
    </div>
    <div class="sideL"><asp:Button ID="ViewAcctsBtn" runat="server" CssClass="btnSettings" Height="200px" Text="View Accounts" Width="210px" /></div>
    <div class="sideR">
        <br />
        <asp:Button ID="ViewItemBtn" runat="server" CssClass="btnSettings" Height="200px" Text="View Items" Width="210px" /></div>

    <div class="center"><asp:Button ID="ViewTicketsBtn" runat="server" CssClass="btnSettings" Height="200px" Text="View Tickets" Width="410px" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TicketID" DataSourceID="SqlDataSource1" Width="1063px">
            <Columns>
                <asp:BoundField DataField="TicketID" HeaderText="TicketID" InsertVisible="False" ReadOnly="True" SortExpression="TicketID" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                <asp:CheckBoxField DataField="Status" HeaderText="Status" SortExpression="Status" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tacabuttoConnectionString %>" ProviderName="<%$ ConnectionStrings:tacabuttoConnectionString.ProviderName %>" SelectCommand="SELECT [TicketID], [Description], [UserID], [Status] FROM [Tickets]"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
        <br />
        </div>
    </form>
</body>
</html>
