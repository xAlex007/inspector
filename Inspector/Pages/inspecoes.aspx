<%@ Page Title="Inspeções | Inspector" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="inspecoes.aspx.cs" Inherits="Pages_plans" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="render" runat="Server">
    <div id="l-gradient">
        <div class="container-fluid container-md px-0">
            <div class="row mb-2 justify-content-end">
                <div class="col-5 col-sm-4 col-md-3 col-lg-2">
                    <asp:TextBox ID="Search" CssClass="form-control" runat="server" placeholder="Pesquisar..." OnTextChanged="Search_TextChanged" AutoPostBack="true"></asp:TextBox>
                </div>
            </div>
            <div class="row fs-18">
                <div class="col">
                    <asp:ListView ID="lvinspecoes" runat="server" DataKeyNames="Corrida" OnItemCommand="lvinspecoes_ItemCommand" OnPagePropertiesChanged="lvinspecoes_PagePropertiesChanged">
                        <EmptyDataTemplate>
                            <table id="itemPlaceholderContainer" runat="server" class="table data table-responsive">
                                <thead>
                                    <tr runat="server" class="table-secondary justify-content-center">
                                        <th runat="server" class="text-center">Corrida</th>
                                        <th runat="server" class="text-center">Plano</th>
                                        <th runat="server" class="text-center">Inspetor</th>
                                        <th runat="server" class="text-center">Inspecionado em</th>
                                        <th runat="server" class="text-center auto-hide">Modificado em</th>
                                        <th runat="server" class="text-center">Ações</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="table-light">
                                        <td></td>
                                        <td></td>                                        
                                        <td></td>
                                        <td class="text-center">
                                            <span class="fw-bold text-secondary" style="position: relative; left: -1.15vw;">Nenhum registro encontrado</span>
                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                            <table id="itemPlaceholderContainer" runat="server" class="table data table-responsive">
                                <thead>
                                    <tr runat="server" class="table-secondary justify-content-center">
                                        <th runat="server" class="text-center">Corrida</th>
                                        <th runat="server" class="text-center">Plano</th>
                                        <th runat="server" class="text-center">Inspetor</th>
                                        <th runat="server" class="text-center">Inspecionado em</th>
                                        <th runat="server" class="text-center auto-hide">Modificado em</th>
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
                                    <asp:Label ID="CorridaLabel" runat="server" Text='<%# Eval("Corrida") %>' />
                                </td>
                                <td class="text-center">
                                    <asp:Label ID="PlanoLabel" runat="server" Text='<%# Eval("Plano") %>' />
                                </td>
                                <td class="text-center">
                                    <asp:Label ID="InspetorLabel" runat="server" Text='<%# Eval("Inspetor") %>' />
                                </td>
                                <td class="text-center">
                                    <asp:Label ID="HorarioLabel" runat="server" Text='<%# Eval("Horario") %>' />
                                </td>
                                <td class="text-center auto-hide">
                                    <asp:Label ID="ModificadoLabel" runat="server" Text='<%# Eval("Modificado") %>' />
                                </td>
                                <td>
                                    <div class="btn-group d-flex flex-wrap justify-content-end">
                                        <asp:LinkButton ID="lbDetalhes" class="btn btn-outline-info btn-sm px-0" runat="server" CommandName="Detalhes" CommandArgument='<%# Bind("Corrida")%>'>Detalhes</asp:LinkButton>
                                        <asp:LinkButton ID="lbEditar" class="btn btn-outline-primary btn-sm px-0" runat="server" CommandName="Editar" CommandArgument='<%# Bind("Corrida")%>'>Editar</asp:LinkButton>
                                        <asp:LinkButton ID="lbDeletar" class="btn btn-outline-danger btn-sm px-0" runat="server" CommandName="Deletar" CommandArgument='<%# Bind("Corrida")%>'>Deletar</asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
