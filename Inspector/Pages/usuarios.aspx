<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="usuarios.aspx.cs" Inherits="Pages_usuarios" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="render" runat="Server">
    <div class="block w-75" style="margin-top: 100px; margin-left: 240px;">
        <asp:Button ID="Button5" Class="btn btn-outline-success buttonuser" Text="Novo usuário" runat="server" OnClick="b_newuser_Click" CausesValidation="false" />
        <asp:SqlDataSource ID="Users" runat="server" ConnectionString="<%$ ConnectionStrings:InspectorDB %>" SelectCommand="SELECT Id, Username, Nome, Email, Nivel, IsBlock FROM [dbo].[Usuario]"></asp:SqlDataSource>
        <asp:ListView ID="lvusers" runat="server" DataSourceID="Users" OnItemCommand="lvusers_ItemCommand">
            <LayoutTemplate>
                <div class="row bg-body">
                    <div id="id" class="col-sm heading" style="display: none;">
                        ID
                   
                    </div>
                    <div class="col-sm heading py-2" style="background-color: rgba(0,0,0,0.2); padding-left: 90px;">
                        Usuário
                   
                    </div>
                    <div class="col-md heading py-2" style="background-color: rgba(0,0,0,0.2); padding-left: 70px;">
                        Nome
                   
                    </div>
                    <div class="col-md heading py-2" style="background-color: rgba(0,0,0,0.2); padding-left: 70px;">
                        E-mail
                   
                    </div>
                    <div class="col-md heading py-2" style="background-color: rgba(0,0,0,0.2); padding-left: 30px;">
                        Nível de Acesso
                   
                    </div>
                    <div class="col-md heading py-2" style="background-color: rgba(0,0,0,0.2); padding-left: 70px;">
                        Bloqueado?
                   
                    </div>
                    <div class="col-sm heading py-2 pl-3" style="background-color: rgba(0,0,0,0.2); padding-left: 50px;">
                        Ações
                   
                    </div>
                </div>
                <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
            </LayoutTemplate>

            <ItemTemplate>
                <div class="row border-bottom" style="background-color: rgba(0,0,0,0.08);">
                    <div class="col-sm pb-2" style="display: none;">
                        <%# Eval("Id") %>
                    </div>
                    <div class="col-sm pb-2">
                        <%# Eval("Username") %>
                    </div>
                    <div class="col-md pb-2">
                        <%# Eval("Nome") %>
                    </div>
                    <div class="col-md pb-2">
                        <%# Eval("Email") %>
                    </div>
                    <div class="col-md pb-2" style="text-align: center;">
                        <%# Eval("Nivel") %>
                    </div>
                    <div class="col-md pb-2" style="text-align: center;">
                        <asp:CheckBox ID="ro_isblock" runat="server" Checked='<%#Convert.ToBoolean(Eval("IsBlock"))%>' Enabled="false" />
                    </div>
                    <div class="col-sm pb-2">
                        <asp:LinkButton ID="lbAlterar" class="btn btn-sm btn-outline-primary" runat="server" CommandName="Alterar" CommandArgument='<%# Bind("Id") %>'> <img src="../Src/img/edit-user.png" alt="Modificar" style="height:25px;margin-right:4px;"/>Editar </asp:LinkButton>
                        <asp:LinkButton ID="lbDeletar" class="btn btn-sm btn-outline-danger" runat="server" CommandName="Deletar" CommandArgument='<%# Bind("Id") %>'> <img src="../Src/img/delete-user.png" alt="Excluir" style="height:25px;margin-right:4px;" />Excluir </asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>

        <!--Modal Novo Usuario-->
        <div class="modal fade" id="newModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color:rgba(0,0,0,0.3)">
                        <h4 class="modal-title" id="staticBackdropLabel"><strong style="margin-left: 145px;">Novo Usuário</strong></h4>
                    </div>
                    <div class="modal-body" style="background-color:rgba(0,0,0,0.15)">
                        <asp:Label ID="l_usuario" runat="server" Text="Usuário:"></asp:Label>
                        <asp:TextBox ID="i_usuario" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_usuario" ValidationGroup="Save"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="l_senha" runat="server" Text="Senha:"></asp:Label>
                        <asp:TextBox ID="i_senha" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_senha" ValidationGroup="Save"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="l_nome" runat="server" Text="Nome Completo:"></asp:Label>
                        <asp:TextBox ID="i_nome" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_nome" ValidationGroup="Save"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="l_email" runat="server" Text="E-mail:"></asp:Label>
                        <asp:TextBox ID="i_email" TextMode="Email" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_email" ValidationGroup="Save"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="l_nivel" runat="server" Text="Nivel de Acesso:"></asp:Label>
                        <asp:DropDownList ID="i_nivel" CssClass="form-select" runat="server">
                            <asp:ListItem Value="A">Administrador</asp:ListItem>
                            <asp:ListItem Value="S">Supervisor</asp:ListItem>
                            <asp:ListItem Value="I">Inspetor</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_nivel" ValidationGroup="Save"></asp:RequiredFieldValidator>
                        <br />
                    </div>

                    <div class="modal-footer" style="background-color:rgba(0,0,0,0.3)">
                        <asp:Button ID="Button4" class="btn btn-outline-danger" runat="server" Text="Cancelar" OnClick="cancel_Click" />
                        <asp:Button ID="Button1" class="btn btn-outline-success" runat="server" Text="Salvar" ValidationGroup="Save" OnClick="bSave_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!--Modal Editar Usuario-->
        <div class="modal fade" id="editModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="staticBackdropLabel2"><strong>Editar Usuário</strong></h4>
                    </div>
                    <div class="modal-body">
                        <asp:TextBox ID="ei_id" CssClass="form-control" runat="server" Enabled="false" Visible="false"></asp:TextBox>
                        <asp:Label ID="el_usuario" runat="server" Text="Usuário:"></asp:Label>
                        <asp:TextBox ID="ei_usuario" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="ei_usuario" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="el_senha" runat="server" Text="Senha:"></asp:Label>
                        <asp:TextBox ID="ei_senha" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="ei_senha" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="el_nome" runat="server" Text="Nome Completo:"></asp:Label>
                        <asp:TextBox ID="ei_nome" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="ei_nome" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="el_email" runat="server" Text="E-mail:"></asp:Label>
                        <asp:TextBox ID="ei_email" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="ei_email" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="el_nivel" runat="server" Text="Nivel de Acesso:"></asp:Label>
                        <asp:DropDownList ID="ei_nivel" CssClass="form-select" runat="server">
                            <asp:ListItem Value="A">Administrador</asp:ListItem>
                            <asp:ListItem Value="S">Supervisor</asp:ListItem>
                            <asp:ListItem Value="I">Inspetor</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="ei_nivel" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="el_isblock" runat="server" Text="Bloqueado?"></asp:Label>
                        <asp:CheckBox ID="ei_isblock" CssClass="form-check" runat="server" />
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="Button3" class="btn btn-outline-danger" runat="server" Text="Cancelar" OnClick="cancel_Click" />
                        <asp:Button ID="Button2" class="btn btn-outline-success" runat="server" Text="Salvar" ValidationGroup="Edit" OnClick="bEdit_Click" />
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

