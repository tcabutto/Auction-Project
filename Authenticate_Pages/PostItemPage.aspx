<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PostItemPage.aspx.cs" Inherits="Authenticate_Pages_PostItemPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Post Item</title>
    <link href="Site.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 287px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <h2 style="text-align: center">Post Item</h2>
        <div class="container">
            <table align="center" id="table1">
                <tr>
                    <td>Image:
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Has to be picutre file" ValidationExpression="(.*\.([gG][iI][fF]|[jJ][pP][gG]|[jJ][pP][eE][gG]|[bB][mM][pP])$)" ControlToValidate="FileUpload1" Font-Bold="True" ForeColor="#D81B1B"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Name:<br />
                        <asp:TextBox ID="NameTxb" runat="server"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                    <td>Price:<br />
                        <asp:TextBox ID="PriceTxb" runat="server"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Category:<br />
                        <asp:TextBox ID="CategoryTxb" runat="server"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                    <td>Description:<br />
                        <asp:TextBox ID="DescTxb" runat="server"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        
                        End time:<asp:DropDownList ID="EndTimeDdl" runat="server">
                            <asp:ListItem Selected="True">12:00AM</asp:ListItem>
                            <asp:ListItem>1:00AM</asp:ListItem>
                            <asp:ListItem>2:00AM</asp:ListItem>
                            <asp:ListItem>3:00AM</asp:ListItem>
                            <asp:ListItem>4:00AM</asp:ListItem>
                            <asp:ListItem>5:00AM</asp:ListItem>
                            <asp:ListItem>6:00AM</asp:ListItem>
                            <asp:ListItem>7:00AM</asp:ListItem>
                            <asp:ListItem>8:00AM</asp:ListItem>
                            <asp:ListItem>9:00AM</asp:ListItem>
                            <asp:ListItem>10:00AM</asp:ListItem>
                            <asp:ListItem>11:00AM</asp:ListItem>
                            <asp:ListItem>12:00PM</asp:ListItem>
                            <asp:ListItem>1:00PM</asp:ListItem>
                            <asp:ListItem>2:00PM</asp:ListItem>
                            <asp:ListItem>3:00PM</asp:ListItem>
                            <asp:ListItem>4:00PM</asp:ListItem>
                            <asp:ListItem>5:00PM</asp:ListItem>
                            <asp:ListItem>6:00PM</asp:ListItem>
                            <asp:ListItem>7:00PM</asp:ListItem>
                            <asp:ListItem>8:00PM</asp:ListItem>
                            <asp:ListItem>9:00PM</asp:ListItem>
                            <asp:ListItem>10:00PM</asp:ListItem>
                            <asp:ListItem>11:00PM</asp:ListItem>
                        </asp:DropDownList>
                        
                    </td>
                    <td class="auto-style1">
                        <asp:Calendar ID="EndDateCal" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="38px" Width="183px">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        
                        <asp:Button ID="SubmitBtn" runat="server" Text="Submit" OnClick="SubmitBtn_Click" />
                        
                    </td>
                    <td class="auto-style1">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
        <p>
                        <asp:TextBox ID="txtMsg" runat="server" Height="177px" TextMode="MultiLine" Width="1223px"></asp:TextBox>
                        </p>
    </form>
</body>
</html>
