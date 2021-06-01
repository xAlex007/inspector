<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Pages_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Sistema de Login</h2>
        </div>
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblLogin" Text="Login: " runat="server" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtLogin" runat="server" >  

                        </asp:TextBox>

                    </td>
                    <td>
                        <asp:Label ID="LabeSenha" Text="Senha: " runat="server" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtSenha" TextMode="Password" runat="server" >  

                        </asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnLogar"  Text="Logar" OnClick="btnLogar_Click" runat="server" >

                        </asp:Button >
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
