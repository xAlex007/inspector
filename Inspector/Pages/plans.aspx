<%@ Page Title="Planos de Inspeção | Inspector" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="plans.aspx.cs" Inherits="Pages_plans" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="render" runat="Server">
    <div id="l-gradient">
        <div class="container-fluid container-md px-0">
            <div class="row mb-2 justify-content-between">
                <div class="col-3">
                    <asp:Button ID="b_newplano" Class="btn btn-outline-success" Text="Novo" runat="server" OnClick="b_newplano_Click" CausesValidation="false" />
                </div>
                <div class="col-5 col-sm-4 col-md-3 col-lg-2">
                    <asp:TextBox ID="Search" CssClass="form-control" runat="server" placeholder="Pesquisar..." OnTextChanged="Search_TextChanged" AutoPostBack="true"></asp:TextBox>
                </div>
            </div>
            <div class="row fs-18">
                <div class="col">
                    <asp:ListView ID="lvplanos" runat="server" DataKeyNames="OP" OnItemCommand="lvplanos_ItemCommand" OnPagePropertiesChanged="lvplanos_PagePropertiesChanged">
                        <EmptyDataTemplate>
                            <table id="itemPlaceholderContainer" runat="server" class="table data table-responsive">
                                <thead>
                                    <tr runat="server" class="table-secondary justify-content-center">
                                        <th runat="server" class="text-center">OP</th>
                                        <th runat="server" class="text-center">Produto</th>
                                        <th runat="server" class="text-center">Quant. Peças</th>
                                        <th runat="server" class="text-center">Inspecionadas</th>
                                        <th runat="server" class="text-center auto-hide">Desenho</th>
                                        <th runat="server" class="text-center auto-hide">Posição</th>
                                        <th runat="server" class="text-center">Ações</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="table-light">
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td class="text-center">
                                            <span class="fw-bold text-secondary">Nenhum registro encontrado</span>
                                        </td>
                                        <td></td>
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
                                        <th runat="server" class="text-center">OP</th>
                                        <th runat="server" class="text-center">Produto</th>
                                        <th runat="server" class="text-center">Quant. Peças</th>
                                        <th runat="server" class="text-center">Inspecionadas</th>
                                        <th runat="server" class="text-center auto-hide">Desenho</th>
                                        <th runat="server" class="text-center auto-hide">Posição</th>
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
                                    <asp:Label ID="OPLabel" runat="server" Text='<%# Eval("OP") %>' />
                                </td>
                                <td class="text-center">
                                    <asp:Label ID="ProdutoLabel" runat="server" Text='<%# Eval("Produto") %>' />
                                </td>
                                <td class="text-center">
                                    <asp:Label ID="QtPecasLabel" runat="server" Text='<%# Eval("QtPecas") %>' />
                                </td>
                                <td class="text-center">
                                    <asp:HyperLink ID="QtTotalizadaLink" runat="server" NavigateUrl='<%# Eval("OP","~/pages/inspecoes.aspx?plano={0}") %>'><%# Eval("QtTotalizada") %></asp:HyperLink>
                                </td>
                                <td class="text-center auto-hide">
                                    <asp:Label ID="DesenhoLabel" runat="server" Text='<%# Eval("Desenho") %>' />
                                </td>
                                <td class="text-center auto-hide">
                                    <asp:Label ID="PosLabel" runat="server" Text='<%# Eval("Posicao") %>' />
                                </td>
                                <td>
                                    <div class="btn-group d-flex flex-wrap justify-content-center">
                                        <asp:LinkButton ID="lbAlterar" class="btn btn-outline-primary btn-sm px-0" runat="server" CommandName="Alterar" CommandArgument='<%# Bind("OP")%>'>Alterar</asp:LinkButton>
                                        <asp:LinkButton ID="lbDeletar" class="btn btn-outline-danger btn-sm px-0" runat="server" CommandName="Deletar" CommandArgument='<%# Bind("OP")%>'>Deletar</asp:LinkButton>
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
    <div class="modal fade" id="newModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header justify-content-center">
                    <h4 class="modal-title fw-bold" id="staticBackdropLabel">Novo Plano de Inspeção</h4>
                </div>
                <div class="modal-body">
                    <asp:Label ID="l_op6" runat="server" Text="Ordem de Produção (6 dígitos):"></asp:Label>
                    <asp:TextBox ID="i_op6" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_op6" ValidationGroup="OK" CssClass="fst-italic fw-bold text-danger text-small"></asp:RequiredFieldValidator>
                </div>
                <div class="modal-footer">
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
                <div class="modal-header justify-content-center">
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
                                    <table id="itemPlaceholderContainer" runat="server" class="table data table-responsive" style="font-size: 0.94rem;">
                                        <thead>
                                            <tr runat="server" class="table-secondary justify-content-center">
                                                <th runat="server" class="text-center">OP</th>
                                                <th runat="server" class="text-center">Produto</th>
                                                <th runat="server" class="text-center">Quant. Peças</th>
                                                <th runat="server" class="text-center text-secondary left-border">Desenho</th>
                                                <th runat="server" class="text-center text-secondary">Posição</th>
                                                <th runat="server" class="text-center text-secondary">Cotas</th>
                                                <th runat="server" class="text-center text-secondary">PDF</th>
                                                <th runat="server" class="text-center text-secondary">XLT</th>
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
                                        <td>
                                            <div class="d-flex centered">
                                                <asp:TextBox ID="txtPeca" CssClass="form-control" Style="text-align: center;" Width="60" runat="server"></asp:TextBox>                                                
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtPeca" ValidationGroup="Save" Display="Dynamic" CssClass="fst-italic fw-bold text-danger text-small"></asp:RequiredFieldValidator>
                                        </td>
                                        <td class="text-center text-secondary left-border">
                                            <asp:Label ID="DesenhoLabel" runat="server" Text='<%# Eval("Desenho") %>' />
                                        </td>
                                        <td class="text-center text-secondary">
                                            <asp:Label ID="PosicaoLabel" runat="server" Text='<%# Eval("Posicao") %>' />
                                        </td>
                                        <td class="text-center text-secondary">
                                            <asp:Label ID="CotasLabel" runat="server" Text='<%# Eval("Cotas") %>' />
                                        </td>
                                        <td class="text-center text-secondary">
                                            <asp:Label ID="PDFLabel" runat="server" Text='<%# Eval("PDF") %>' />
                                        </td>
                                        <td class="text-center text-secondary pe-0">
                                            <asp:Label ID="XLTLabel" runat="server" Text='<%# Eval("XLT") %>' />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="bCancel2" class="btn btn-outline-danger" runat="server" Text="Cancelar" OnClick="cancel_Click" />
                    <asp:Button ID="bConfirm" class="btn btn-outline-success" runat="server" Text="Confirmar" ValidationGroup="Save" OnClick="bConfirm_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
