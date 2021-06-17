<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="render" runat="Server">
    <div id="gradient">
        <div class="container-fluid container-md px-0">
            <div class="row h-100 centered">
                <div class="col-11 col-sm-9 col-md-8 col-lg-7 col-xl-6">
                    <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate">
                        <LayoutTemplate>
                            <div class="row centered pt-3 px-0 mx-0 login">
                                <div class="col-8 col-sm-6">
                                    <div class="row justify-content-center mx-0">
                                        <h2 class="text-center" style="font-family: Audiowide;">LOGIN</h2>
                                        <div class="col-12 pt-4">
                                            <asp:Label ID="l_user" runat="server" AssociatedControlID="UserName">Usuário:</asp:Label>
                                            <asp:TextBox ID="UserName" CssClass="form-control" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Usuário obrigatório." ToolTip="Usuário obrigatório." ValidationGroup="Login1" CssClass="fst-italic fw-bold text-danger text-small"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-12 pt-2">
                                            <asp:Label ID="l_psw" runat="server" AssociatedControlID="Password">Senha:</asp:Label>
                                            <asp:TextBox ID="Password" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Senha obrigatória." ToolTip="Senha obrigatória." ValidationGroup="Login1" CssClass="fst-italic fw-bold text-danger text-small"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Button ID="bLogin" CssClass="btn btn-danger mt-2" runat="server" Text="Entrar" ValidationGroup="Login1" CommandName="Login" />
                                        <div class="col-12 pt-2 my-2 text-center text-danger fw-bold">
                                            <asp:Label ID="msg" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </LayoutTemplate>
                    </asp:Login>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

