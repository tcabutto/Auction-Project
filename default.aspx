<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
           <script type="text/javascript">

            function populateUnregistered()
            {
                var ul = document.getElementById("navbar");
                var li1 = document.createElement("li");
                var li2 = document.createElement("li");

                var a1 = document.createElement("a");
                var a2 = document.createElement("a");

                a1.textContent = "Create Account"
                a2.textContent = "Log in";

                a1.setAttribute('href', "CreateAccount.aspx");
                a2.setAttribute('href', "Login.aspx");

                li1.appendChild(a1);
                li2.appendChild(a2);

                ul.appendChild(li1);
                ul.appendChild(li2);
                
            }

            function populateRegistered()
            {
                var ul = document.getElementById("navbar");

                var li1 = document.createElement("li");
                var li2 = document.createElement("li");
               // var li3 = document.createElement("li");

                var a1 = document.createElement("a");
                var a2 = document.createElement("a");
                //var a3 = document.createElement("a");

                a1.textContent = "My Account";
                a2.textContent = "My Items";
                //a3.textContent = "Log out";

                a1.setAttribute('href', "Authenticate_Pages/AccountPage.aspx");
                a2.setAttribute('href', "Authenticate_Pages/MyItemsPage.aspx");
              //  a3.setAttribute('href', "default.aspx");

                li1.appendChild(a1);
                li2.appendChild(a2);
                //li3.appendChild(a3);

                ul.appendChild(li1);
                ul.appendChild(li2);
                //ul.appendChild(li3);



            }
            
            </script>

    
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
    
    <title>Home page</title>
    <link href="Site.css" rel="stylesheet"/>
</head>
<body>
    
    <form id="form1" runat="server">
        <div>
        <ul id="navbar">
                    
                    
        </ul>
            </div>
        
    <div id="header">
            
            <h1 style="width: 75%; text-align: center;">Welcome to the auction site for everyone!</h1>
            <p style="width: 75%; text-align: left;">&nbsp;</p>
    </div>
         
        <div class="sideR">
            <div class="unregisteredUser">
                <br />
                Log in or create an account to see your own items here!
            <br />
                <br />
            <br />
                <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3">
                    <AlternatingItemTemplate>
                        <tr style="background-color:#FFF8DC">
                            <td>
                                <asp:Label ID="FNameLabel" runat="server" Text='<%# Eval("FName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LNameLabel" runat="server" Text='<%# Eval("LName") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <tr style="background-color:#008A8C;color: #FFFFFF;">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            </td>
                            <td>
                                <asp:TextBox ID="FNameTextBox" runat="server" Text='<%# Bind("FName") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="LNameTextBox" runat="server" Text='<%# Bind("LName") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            </td>
                            <td>
                                <asp:TextBox ID="FNameTextBox" runat="server" Text='<%# Bind("FName") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="LNameTextBox" runat="server" Text='<%# Bind("LName") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color:#DCDCDC;color: #000000;">
                            <td>
                                <asp:Label ID="FNameLabel" runat="server" Text='<%# Eval("FName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LNameLabel" runat="server" Text='<%# Eval("LName") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                            <th runat="server">FName</th>
                                            <th runat="server">LName</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                            <td>
                                <asp:Label ID="FNameLabel" runat="server" Text='<%# Eval("FName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LNameLabel" runat="server" Text='<%# Eval("LName") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="SELECT [FName], [LName] FROM [Accounts]"></asp:SqlDataSource>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>

        </div>
        <div class="sideL">
            <h2>Today&#39;s picks</h2>
            <h2>&nbsp;</h2>
            <h2><asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Label ID="INameLabel" runat="server" Text='<%# Eval("IName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="INameTextBox" runat="server" Text='<%# Bind("IName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="INameTextBox" runat="server" Text='<%# Bind("IName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Label ID="INameLabel" runat="server" Text='<%# Eval("IName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server">IName</th>
                                    <th runat="server">price</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Label ID="INameLabel" runat="server" Text='<%# Eval("IName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="SELECT [IName], [price] FROM [Items]"></asp:SqlDataSource>
            </h2>
            <p>&nbsp;</p>
            <p><h2>Featured items</h2>
            <p>&nbsp;</p>
            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                <AlternatingItemTemplate>
                    <tr style="background-color:#FFF8DC">
                        <td>
                            <asp:Label ID="INameLabel" runat="server" Text='<%# Eval("IName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color:#008A8C;color: #FFFFFF;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:TextBox ID="INameTextBox" runat="server" Text='<%# Bind("IName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:TextBox ID="INameTextBox" runat="server" Text='<%# Bind("IName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color:#DCDCDC;color: #000000;">
                        <td>
                            <asp:Label ID="INameLabel" runat="server" Text='<%# Eval("IName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                        <th runat="server">IName</th>
                                        <th runat="server">price</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                        <td>
                            <asp:Label ID="INameLabel" runat="server" Text='<%# Eval("IName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="SELECT [IName], [price] FROM [Items]"></asp:SqlDataSource>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>


        </div>
        <div style="text-align: left">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Button ID="SearchBtn" runat="server" CssClass="btnSettings" OnClick="SearchBtn_Click" Text="Search" Height="27px" Width="78px" PostBackUrl="~/AllItemsPage.aspx" />
                    &nbsp;
                    <asp:TextBox ID="SearchTxtbx" runat="server" Width="310px" AutoCompleteType="Search" Height="25px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="logOutBtn" runat="server" CssClass="btnSettings" OnClick="logOutBtn_Click" Text="Log out" Visible="False" />
                    <br />
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <p style="width: 25%; margin-left: 25%">
            <asp:Button ID="BrowseItemsBtn" runat="server" BackColor="#CC0000" Height="128px" Text="Browse items" Width="140px" CssClass="btnSettings" OnClick="BrowseItemsBtn_Click" PostBackUrl="~/AllItemsPage.aspx" />
        </p>
        <p style="width: 25%; margin-left: 25%">
            &nbsp;</p>
        <p style="width: 25%; margin-left: 25%">
            <asp:Button ID="NewItemsBtn" runat="server" BackColor="#6600CC" Height="128px" Text="Newest items" Width="140px" PostBackUrl="~/AllItemsPage.aspx" />
        </p>
        <p style="width: 25%; margin-left: 25%">
            &nbsp;</p>
        <p style="width: 25%; margin-left: 25%">
            <asp:Button ID="TrendingItemsBtn" runat="server" BackColor="#0066CC" Height="128px" Text="Trending items" Width="140px" PostBackUrl="~/AllItemsPage.aspx" />
        </p>

    </form>
    </body>
</html>
