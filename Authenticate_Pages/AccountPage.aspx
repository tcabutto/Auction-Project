<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccountPage.aspx.cs" Inherits="AccountPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Account page</title>
    <link href="Site.css" rel="stylesheet" />
    <style type="text/css">
        .leftButtons {
            text-align: center;
        }
        .center {
            text-align: center;
        }
    </style>
</head>
<body class="center">
    <form id="form1" runat="server">
            <a href="~/default.aspx">
            </a>
        <h1 style="height: 148px; text-align: center;">Welcome <asp:Label ID="UserNameLbl" runat="server"></asp:Label>!</h1>
        <div class="leftButtons">

            <asp:Button ID="AcctSettingsBtn" runat="server" CssClass="btnSettings" Text="Edit Account Settings" Height="40%" Width="20%" OnClick="AcctSettingsBtn_Click" />
            <br />
            <br />
        </div>
        <div class="center">
            <asp:Button ID="YourItemsBtn" runat="server" CssClass="btnSettings" Text="Your Items" Height="60%" Width="20%" OnClick="YourItemsBtn_Click" />
            <br />
            <br />
            <asp:Button ID="PostItemBtn" runat="server" CssClass="btnSettings" Text="Post Item" Height="60%" Width="20%" OnClick="PostItemBtn_Click" />
            <br />
            <br />
            <asp:Button ID="LogOutBtn" runat="server" CssClass="btnSettings" Text="Log out" Height="60%" Width="20%" OnClick="LogOutBtn_Click" />
            <br />
            <br />
            <asp:Button ID="HomeBtn" runat="server" CssClass="btnSettings" Text="Home" Height="60%" Width="20%" OnClick="HomeBtn_Click" />
        </div>
        
    </form>
</body>
</html>
