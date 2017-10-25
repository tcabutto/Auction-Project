<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log in to be cool</title>
</head>
<body>
  <form id="form1" runat="server">
    <h3>
      Logon Page</h3>
    <table>
      <tr>
        <td>
          E-mail address:</td>
        <td>
            <asp:TextBox ID="emailTxtbx" runat="server"></asp:TextBox>
          </td>
        <td>
          
        </td>
      </tr>
      <tr>
        <td>
          Password:</td>
        <td>
            <asp:TextBox ID="passTxtbx" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td>
          
        </td>
      </tr>
      <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
      </tr>
    </table>
    <asp:Button ID="submitBtn" Text="Log On" 
       runat="server" OnClick="submitBtn_Click" />
    <p>
      <asp:Label ID="Msg" ForeColor="red" runat="server" />
    </p>
  </form>
</body>
</html>