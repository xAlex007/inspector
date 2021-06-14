<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="usuarios.aspx.cs" Inherits="Pages_usuarios" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="render" runat="Server">
    <div id="l-gradient">
        <div class="container-fluid m-auto no-margin container-md">
            <div class="row mb-2 justify-content-between">
                <div class="col-3">
                    <asp:LinkButton ID="b_newuser" CssClass="btn btn-outline-success" runat="server" OnClick="b_newuser_Click" CausesValidation="false"><img src="../Src/img/add-user.png" alt="Novo" style="height:25px;margin-right:4px;"/>Novo</asp:LinkButton>
                </div>
                <div class="col-5 col-sm-4 col-md-3 col-lg-2">
                    <asp:TextBox ID="Search" CssClass="form-control" runat="server" placeholder="Pesquisar..." OnTextChanged="Search_TextChanged" AutoPostBack="true"></asp:TextBox>
                </div>
            </div>
            <div class="row" style="font-size: 1.13rem;">
                <div class="col">
                    <asp:ListView ID="lvusers" runat="server" DataKeyNames="Id" OnItemCommand="lvusers_ItemCommand" OnPagePropertiesChanged="lvusers_PagePropertiesChanged">
                        <EmptyDataTemplate>
                            <table id="itemPlaceholderContainer" runat="server" class="table table-responsive">
                                <thead>
                                    <tr runat="server" class="table-secondary justify-content-center">
                                        <th runat="server" class="text-center">Usuário</th>
                                        <th runat="server" class="text-center" style="display: none;">ID</th>
                                        <th runat="server" class="text-center auto-hide">Nome</th>
                                        <th runat="server" class="text-center auto-hide">E-mail</th>
                                        <th runat="server" class="text-center">Nível de Acesso</th>
                                        <th runat="server" class="text-center">Bloqueado?</th>
                                        <th runat="server" class="text-center">Ações</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="table-light">
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td class="text-center">
                                            <span class="fw-bold text-secondary" style="position: relative; left: -1.56vw;">Nenhum registro encontrado</span>
                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                            <table id="itemPlaceholderContainer" runat="server" class="table table-responsive">
                                <thead>
                                    <tr runat="server" class="table-secondary justify-content-center">
                                        <th runat="server" class="text-center">Usuário</th>
                                        <th runat="server" class="text-center" style="display: none;">ID</th>
                                        <th runat="server" class="text-center auto-hide">Nome</th>
                                        <th runat="server" class="text-center auto-hide">E-mail</th>
                                        <th runat="server" class="text-center">Nível de Acesso</th>
                                        <th runat="server" class="text-center">Bloqueado?</th>
                                        <th runat="server" class="text-center">Ações</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="itemPlaceholder" runat="server"></tr>
                                </tbody>
                            </table>
                            <div class="centered">
                                <asp:DataPager ID="DataPager1" PageSize="10" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-outline-danger"
                                            FirstPageText="<img src='../Src/img/first.png' height='28px' alt='next' border='0'>"
                                            PreviousPageText="<img src='../Src/img/previous.png' height='28px' alt='next' border='0'>"
                                            RenderDisabledButtonsAsLabels="true"
                                            ShowFirstPageButton="true" ShowPreviousPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" />
                                        <asp:NumericPagerField ButtonCount="7" CurrentPageLabelCssClass="btn btn-danger btn-pager" NumericButtonCssClass="btn btn-outline-danger btn-pager" />
                                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-outline-danger"
                                            NextPageText="<img src='../Src/img/next.png' height='28px' alt='next' border='0'>"
                                            LastPageText="<img src='../Src/img/last.png' height='28px' alt='next' border='0'>"
                                            RenderDisabledButtonsAsLabels="true"
                                            ShowFirstPageButton="false" ShowPreviousPageButton="false" ShowLastPageButton="true" ShowNextPageButton="true" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr class="table-light">
                                <td class="text-center">
                                    <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
                                </td>
                                <td class="text-center" style="display: none;">
                                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                                </td>
                                <td class="text-center auto-hide">
                                    <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' />
                                </td>
                                <td class="text-center auto-hide">
                                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                </td>
                                <td class="text-center">
                                    <asp:Label ID="NivelLabel" runat="server" Text='<%# Eval("Nivel") %>' />
                                </td>
                                <td class="text-center">
                                    <asp:CheckBox ID="CB_isblock" runat="server" Checked='<%#Convert.ToBoolean(Eval("IsBlock"))%>' Enabled="false" />
                                </td>
                                <td style="width:13rem;">
                                    <asp:LinkButton ID="lbAlterar" class="btn btn-sm btn-outline-primary" runat="server" CommandName="Alterar" CommandArgument='<%# Bind("Id") %>'><img src="../Src/img/edit-user.png" alt="Alterar" style="height:1.3rem;margin-right:4px;"/>Alterar</asp:LinkButton>
                                    <asp:LinkButton ID="lbDeletar" class="btn btn-sm btn-outline-danger" runat="server" CommandName="Deletar" CommandArgument='<%# Bind("Id") %>'><img src="../Src/img/delete-user.png" alt="Deletar" style="height:1.3rem;margin-right:4px;"/>Deletar</asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>

    <!--Modal Novo Usuario-->
    <div class="modal fade" id="newModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color: rgba(0,0,0,0.3)">
                    <h4 class="modal-title" id="staticBackdropLabel"><strong style="margin-left: 145px;">Novo Usuário</strong></h4>
                </div>
                <div class="modal-body" style="background-color: rgba(0,0,0,0.15)">
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

                <div class="modal-footer" style="background-color: rgba(0,0,0,0.3)">
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
</asp:Content>
