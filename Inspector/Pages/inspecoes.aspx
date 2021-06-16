﻿<%@ Page Title="Inspeções - Inspector" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="inspecoes.aspx.cs" Inherits="Pages_plans" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="render" runat="Server">
    <div id="l-gradient">
        <div class="container-fluid m-auto no-margin container-md">
            <div class="row mb-2 justify-content-end">
                <div class="col-5 col-sm-4 col-md-3 col-lg-2">
                    <asp:TextBox ID="Search" CssClass="form-control" runat="server" placeholder="Pesquisar..." OnTextChanged="Search_TextChanged" AutoPostBack="true"></asp:TextBox>
                </div>
            </div>
            <div class="row" style="font-size: 1.13rem;">
                <div class="col">
                    <asp:ListView ID="lvinspecoes" runat="server" DataKeyNames="Corrida" OnItemCommand="lvinspecoes_ItemCommand" OnPagePropertiesChanged="lvinspecoes_PagePropertiesChanged">
                        <EmptyDataTemplate>
                            <table id="itemPlaceholderContainer" runat="server" class="table table-responsive">
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
                                        <td class="text-center">
                                            <span class="fw-bold text-secondary" style="position: relative; left: 0.3vw;">Nenhum registro encontrado</span>
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
                                <td style="width: 13rem;">
                                    <div class="btn-group flex-wrap" role="group">
                                        <asp:LinkButton ID="lbDetalhes" class="btn btn-outline-info btn-sm" runat="server" CommandName="Detalhes" CommandArgument='<%# Bind("Corrida")%>'>Detalhes</asp:LinkButton>
                                        <asp:LinkButton ID="lbEditar" class="btn btn-outline-primary btn-sm" runat="server" CommandName="Editar" CommandArgument='<%# Bind("Corrida")%>'>Editar</asp:LinkButton>
                                        <asp:LinkButton ID="lbDeletar" class="btn btn-outline-danger btn-sm" runat="server" CommandName="Deletar" CommandArgument='<%# Bind("Corrida")%>'>Deletar</asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>

    <!--Modal Novo Plano-->
    <%--<div class="modal fade" id="newModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header justify-content-center" style="background-color: rgba(0,0,0,0.3)">
                    <h4 class="modal-title fw-bold" id="staticBackdropLabel">Novo Plano de Inspeção</h4>
                </div>

                <div class="modal-body" style="background-color: rgba(0,0,0,0.15)">
                    <asp:Label ID="l_op6" runat="server" Text="Ordem de Produção (6 dígitos):"></asp:Label>
                    <asp:TextBox ID="i_op6" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_op6" ValidationGroup="OK" CssClass="fst-italic fw-bold text-danger text-small"></asp:RequiredFieldValidator>
                </div>

                <div class="modal-footer" style="background-color: rgba(0,0,0,0.3)">
                    <asp:Button ID="bCancel" class="btn btn-outline-danger" runat="server" Text="Cancelar" OnClick="cancel_Click" />
                    <asp:Button ID="bOK" class="btn btn-outline-success" runat="server" Text="OK" ValidationGroup="OK" OnClick="bOK_Click" />
                </div>
            </div>
        </div>
    </div>

    <!--Modal Confirmar Plano-->
    <div class="modal fade" id="confirmModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header justify-content-center" style="background-color: rgba(0,0,0,0.3)">
                    <h4 class="modal-title fw-bold" id="staticBackdropLabel1">Novo Plano de Inspeção</h4>
                </div>

                <div class="modal-body">
                    <asp:Label ID="Label1" runat="server" Text="Será criado um plano de inspeção para cada uma das ordens abaixo:"></asp:Label>
                    <br />
                    <br />
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:ListView ID="lvnewplan" runat="server" DataKeyNames="OP" OnItemCommand="lvnewplan_ItemCommand">
                                <LayoutTemplate>
                                    <table id="itemPlaceholderContainer" runat="server" border="1" class="table" style="font-size: 15px;">
                                        <thead>
                                            <tr runat="server" class="table-secondary justify-content-center">
                                                <th runat="server" class="text-center">OP</th>
                                                <th runat="server" class="text-center">Produto</th>
                                                <th runat="server" class="text-center">Quant. Peças</th>
                                                <th runat="server" class="text-center left-border">Desenho</th>
                                                <th runat="server" class="text-center">Posição</th>
                                                <th runat="server" class="text-center">Cotas</th>
                                                <th runat="server" class="text-center">PDF</th>
                                                <th runat="server" class="text-center">XLT</th>
                                                <th runat="server"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </tbody>
                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr class="table-light">
                                        <td class="text-center">
                                            <asp:Label ID="OPLabel" runat="server" Text='<%# Eval("OP") %>' />
                                        </td>
                                        <td class="text-center">
                                            <asp:Label ID="ProdutoLabel" runat="server" Text='<%# Eval("Produto") %>' />
                                        </td>
                                        <td style="padding-left: 1.5em;">
                                            <asp:TextBox ID="txtPeca" CssClass="form-control" Style="text-align: center; font-size: 15px;" Width="60" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="text-center left-border">
                                            <asp:Label ID="DesenhoLabel" runat="server" Text='<%# Eval("Desenho") %>' />
                                        </td>
                                        <td class="text-center">
                                            <asp:Label ID="PosicaoLabel" runat="server" Text='<%# Eval("Posicao") %>' />
                                        </td>
                                        <td class="text-center">
                                            <asp:Label ID="CotasLabel" runat="server" Text='<%# Eval("Cotas") %>' />
                                        </td>
                                        <td class="text-center">
                                            <asp:Label ID="PDFLabel" runat="server" Text='<%# Eval("PDF") %>' />
                                        </td>
                                        <td class="text-center pe-0">
                                            <asp:Label ID="XLTLabel" runat="server" Text='<%# Eval("XLT") %>' />
                                        </td>
                                        <td class="ps-0" style="padding-top: 1em">
                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Src/img/remove.png" AlternateText="Remover" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div class="modal-footer" style="background-color: rgba(0,0,0,0.3)">
                    <asp:Button ID="bCancel2" class="btn btn-outline-danger" runat="server" Text="Cancelar" OnClick="cancel_Click" />
                    <asp:Button ID="bConfirm" class="btn btn-outline-success" runat="server" Text="Confirmar" OnClick="bConfirm_Click" />
                </div>
            </div>--%>
        </div>
    </div>
</asp:Content>