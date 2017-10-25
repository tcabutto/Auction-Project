<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AllItemsPage.aspx.cs" Inherits="AllItemsPage" %>

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
                    <li><a href="default.aspx">Home</a></li>
                    <li><a href="Authenticate_Pages/AccountPage.aspx">My Account</a></li>
                    <li><a href="Authenticate_Pages/MyItemsPage.aspx">MyItems</a></li>
                    
        </ul>
            </div>
    <div>
        <br />
        <br />
        <br />
        <asp:Button ID="SearchBtn" runat="server" Height="27px" Text="Search" Width="77px" PostBackUrl="~/AllItemsPage.aspx" />
          <asp:TextBox ID="SearchTxtBx" runat="server" Height="19px" Width="445px"></asp:TextBox>
    
   </div>
        <div style="text-align: center">

            <br />
            <h2>Results</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="1775px" AllowPaging="True" AllowSorting="True" DataKeyNames="ItemID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:TemplateField HeaderText="IName" SortExpression="IName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("IName") %>' CommandArgument='<%#Eval("IName") %>' OnClick="LinkButton1_Click"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                    <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="EndTime" HeaderText="EndTime" SortExpression="EndTime" />
                    <asp:BoundField DataField="Seller" HeaderText="Seller" SortExpression="Seller" />
                    <asp:BoundField DataField="Buyer" HeaderText="Buyer" SortExpression="Buyer" />
                </Columns>
            </asp:GridView>

            <br />
        </div>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="SELECT  [ItemID], [IName], [description], [category], [price], [EndTime], [Seller], [Buyer] FROM [Items] WHERE ([IName] = ?)">
                 <SelectParameters>
                     <asp:FormParameter FormField="SearchTxtbx" Name="IName" Type="String" />
                 </SelectParameters>
          </asp:SqlDataSource>
          <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="1775px" DataKeyNames="ItemID">
              <Columns>
                  <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" InsertVisible="False" ReadOnly="True" Visible="False" />
                  <asp:TemplateField HeaderText="IName" SortExpression="IName">
                      <EditItemTemplate>
                          <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IName") %>'></asp:TextBox>
                      </EditItemTemplate>
                      <ItemTemplate>
                          <asp:LinkButton ID="LinkButton2" runat="server" Text='<%# Eval("IName") %>' CommandArgument='<%#Eval("IName") %>' OnClick="LinkButton2_Click"></asp:LinkButton>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                  <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                  <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                  <asp:BoundField DataField="EndTime" HeaderText="EndTime" SortExpression="EndTime" />
                  <asp:BoundField DataField="Seller" HeaderText="Seller" SortExpression="Seller" />
                  <asp:BoundField DataField="Buyer" HeaderText="Buyer" SortExpression="Buyer" />
              </Columns>
          </asp:GridView>
          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="SELECT [ItemID], [IName], [description], [category], [price], [EndTime], [Seller], [Buyer] FROM [Items] ORDER BY [ItemID] DESC"></asp:SqlDataSource>
             </form>
    </body>
</html>
