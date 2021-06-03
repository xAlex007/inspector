<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Index" %>



<asp:Content ID="Body" ContentPlaceHolderID="render" Runat="Server">
    <div id="gradient">
    <div class="rounded" id="homewelcome">
        <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate">
            <LayoutTemplate>
                <div class="row justify-content-center container-fluid pt-3 pr-0 pl-5">
                    <div class="col-md-6">
                        <div class="row col-md-12 justify-content-center">
                            <h2>Login</h2>
                            <div class="col-12 col-md-12 pt-4">
                                <asp:Label ID="l_user" runat="server" AssociatedControlID="UserName">Usuário:</asp:Label>
                                <asp:TextBox ID="UserName" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="O Usuário é obrigatório." ToolTip="O Usuário é obrigatório." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            </div>
                            <div class="col-12 col-md-12 pt-3">
                                <asp:Label ID="l_psw" runat="server" AssociatedControlID="Password">Senha:</asp:Label>
                                <asp:TextBox ID="Password" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="A senha é obrigatória." ToolTip="A senha é obrigatória." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            </div>
                            <asp:Button ID="bLogin" CssClass="btn btn-danger mt-4" runat="server" Text="Entrar" ValidationGroup="Login1" CommandName="Login" />
                            <div class="col-12 col-md-12 pt-3">
                                <asp:Label ID="msg" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </LayoutTemplate>
        </asp:Login>
    </div>
</div>
</asp:Content>

