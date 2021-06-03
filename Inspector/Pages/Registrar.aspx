<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registrar.aspx.cs" Inherits="Pages_Registrar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <section>
            <div class="row col-md-12">

                <div class="col-12 col-md-12 m-2">
                    <label>CPF</label>
                    <asp:TextBox ID="txtcpf" runat="server"></asp:TextBox>
                </div>

                <div class="col-12 col-md-12 m-2">
                    <label>Nome</label>
                    <asp:TextBox ID="txtnome" runat="server"></asp:TextBox>
                </div>

                <div class="col-12 col-md-12 m-2">
                    <label>Data de Nascimento</label>
                    <asp:TextBox ID="txtdatanascimento" runat="server"></asp:TextBox>
                </div>

                <div class="col-12 col-md-12 m-2">
                    <label>Senha</label>
                    <asp:TextBox Type="password" ID="txtsenha" runat="server"></asp:TextBox>
                </div>

                <div>
                     <asp:LinkButton ID="lbRegistro"  class="btn btn-light" runat="server" OnClick="lbRegistro_Click1">Registrar</asp:LinkButton>
                </div>

            </div>

        </section>




    </form>
</body>
</html>
