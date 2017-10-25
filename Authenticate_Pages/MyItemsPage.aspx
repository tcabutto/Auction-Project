<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyItemsPage.aspx.cs" Inherits="MyItemsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My items page</title>
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
        .sellers {
            text-align: center;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
         <div>
        <ul id="navbar">
           <li><a href="AccountPage.aspx">My Account</a></li>
            <li><a href="../default.aspx">Home</a></li>
                    
        </ul>
            </div>
           
            <h1> &nbsp;</h1>
         <h1> 
           
            <asp:Label ID="UserNameLbl" runat="server"></asp:Label>
             &#39;s Items</h1>
    <div class="selling">
        <h2 style="text-align: center">Selling</h2>
        <div style="text-align: center">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="1778px" AllowSorting="True">
                <Columns>
                    <asp:TemplateField HeaderText="IName" SortExpression="IName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("IName") %>' OnClick="LinkButton1_Click" Text='<%# Eval("IName") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                    <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                    <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
                </Columns>
            </asp:GridView>
            &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tacabuttoConnectionString %>" ProviderName="<%$ ConnectionStrings:tacabuttoConnectionString.ProviderName %>" SelectCommand="SELECT [IName], [price], [description], [category], [EndDate] FROM [Items] WHERE AccountID = @AccountID" >
            </asp:SqlDataSource>
        </div>
    </div>
    <div class="center">
        <h2 style="text-align: center">Buying</h2>
        <p style="text-align: center">
            <asp:GridView ID="GridView3" runat="server" Width="1781px" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AllowSorting="True">
                <Columns>
                    <asp:TemplateField HeaderText="IName" SortExpression="IName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("IName") %>' OnClick="LinkButton1_Click" Text='<%# Eval("IName") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                    <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                    <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
                </Columns>
            </asp:GridView>
        </p>
    </div>
    <div class="sellers">
        <h2  ID="sellerGrid" style="text-align: center" runat="server">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:tacabuttoConnectionString %>" ProviderName="<%$ ConnectionStrings:tacabuttoConnectionString.ProviderName %>" SelectCommand="SELECT [IName], [price], [description], [category], [EndDate] FROM [Items] WHERE ([Buyer] = @Buyer)">
            </asp:SqlDataSource>
            Sellers<asp:GridView ID="GridView2" runat="server" Width="1784px" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:TemplateField HeaderText="IName" SortExpression="IName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("IName") %>' OnClick="LinkButton1_Click" Text='<%# Eval("IName") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                    <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                    <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
                </Columns>
            </asp:GridView>
        </h2>
        <!-- This label will be set to visible if the user logged in is not a premium. If they are, it will be invisible. -->
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:tacabuttoConnectionString %>" ProviderName="<%$ ConnectionStrings:tacabuttoConnectionString.ProviderName %>" SelectCommand="SELECT [IName], [price], [description], [category], [EndDate] FROM [Items] WHERE (Seller = @AccountID)">
            </asp:SqlDataSource>
        <asp:Label ID="UpPremLbl" runat="server" ForeColor="#FF1515" style="font-weight: 700" Text="Want to manage other people? Upgrade to premium in the account settings!"></asp:Label>
        <br />

    </div>
    </form>
    </body>
</html>
