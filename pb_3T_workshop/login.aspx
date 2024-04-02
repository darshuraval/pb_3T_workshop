<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="pb_3T_workshop.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div>
                <table>
                    <caption><h1>Log in</h1></caption>
                    <tr>
                        <td>Email Address: </td>
                        <td>
                            <asp:TextBox ID="txtemladd" runat="server"></asp:TextBox> </td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td>
                            <asp:TextBox ID="txtpwd" runat="server"></asp:TextBox> </td>
                    </tr>
                    <tr colspan="2">
                        <td> <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" /></td>
                    </tr>
                </table>
            </div>
        </center>
    </form>
</body>
</html>
