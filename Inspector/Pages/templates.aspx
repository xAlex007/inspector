<%@ Page Title="Templates | Inspector" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="templates.aspx.cs" Inherits="Pages_templates" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="render" runat="Server">
    <div id="l-gradient">
        <div class="container-fluid container-md px-0">
            <div class="row mb-2 justify-content-between">
                <div class="col-3">
                    <asp:Button ID="b_newtemplate" Class="btn btn-outline-success" Text="Novo" runat="server" OnClick="b_newtemplate_Click" CausesValidation="false" />
                </div>
                <div class="col-5 col-sm-4 col-md-3 col-lg-2">
                    <asp:TextBox ID="Search" CssClass="form-control" runat="server" placeholder="Pesquisar..." OnTextChanged="Search_TextChanged" AutoPostBack="true"></asp:TextBox>
                </div>
            </div>
            <div class="row fs-18">
                <div class="col">
                    <asp:ListView ID="lvtemplates" runat="server" DataKeyNames="Produto" OnItemCommand="lvtemplates_ItemCommand" OnPagePropertiesChanged="lvtemplates_PagePropertiesChanged">
                        <EmptyDataTemplate>
                            <table id="itemPlaceholderContainer" runat="server" class="table data table-responsive">
                                <thead>
                                    <tr runat="server" class="table-secondary justify-content-center">
                                        <th runat="server" class="text-center">Produto</th>
                                        <th runat="server" class="text-center">Desenho</th>
                                        <th runat="server" class="text-center auto-hide">Posição</th>
                                        <th runat="server" class="text-center auto-hide">Nº Cotas</th>
                                        <th runat="server" class="text-center">Anexo PDF</th>
                                        <th runat="server" class="text-center">Anexo XLT</th>
                                        <th runat="server" class="text-center">Ações</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="table-light">
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td class="text-center">
                                            <span class="fw-bold text-secondary" style="position: relative; left: 2vw;">Nenhum registro encontrado</span>
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
                                        <th runat="server" class="text-center">Produto</th>
                                        <th runat="server" class="text-center">Desenho</th>
                                        <th runat="server" class="text-center auto-hide">Posição</th>
                                        <th runat="server" class="text-center auto-hide">Nº Cotas</th>
                                        <th runat="server" class="text-center">Anexo PDF</th>
                                        <th runat="server" class="text-center">Anexo XLT</th>
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
                                    <asp:Label ID="ProdutoLabel" runat="server" Text='<%# Eval("Produto") %>' />
                                </td>
                                <td class="text-center">
                                    <asp:Label ID="DesenhoLabel" runat="server" Text='<%# Eval("Desenho") %>' />
                                </td>
                                <td class="text-center auto-hide">
                                    <asp:Label ID="PosLabel" runat="server" Text='<%# Eval("Posicao") %>' />
                                </td>
                                <td class="text-center auto-hide">
                                    <asp:Label ID="CotasLabel" runat="server" Text='<%# Eval("Cotas") %>' />
                                </td>
                                <td class="text-center">
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Text='<%# Eval("PDF") %>'></asp:LinkButton>
                                    <%--<asp:HyperLink ID="PDFLink" runat="server" NavigateUrl='<%# Eval("PDF","~/Src/uploaded/{0}") %>'><%# Eval("PDF") %></asp:HyperLink>--%>
                                </td>
                                <td class="text-center">
                                    <asp:Label ID="XLTLabel" runat="server" Text='<%# Eval("XLT") %>' />
                                </td>
                                <td>
                                    <div class="btn-group d-flex flex-wrap justify-content-center">
                                        <asp:LinkButton ID="lbAlterar" class="btn btn-outline-primary btn-sm px-0" runat="server" CommandName="Alterar" CommandArgument='<%# Bind("Produto")%>'>Alterar</asp:LinkButton>
                                        <asp:LinkButton ID="lbDeletar" class="btn btn-outline-danger btn-sm px-0" runat="server" CommandName="Deletar" CommandArgument='<%# Bind("Produto")%>'>Deletar</asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>                    
                </div>
            </div>
        </div>
    </div>

    <!--Modal Novo Template-->
    <div class="modal fade" id="newModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header justify-content-center">
                    <h4 class="modal-title fw-bold" id="staticBackdropLabel">Novo Template</h4>
                </div>
                <div class="modal-body">
                    <asp:Label ID="l_produto" runat="server" Text="Produto:"></asp:Label>
                    <asp:TextBox ID="i_produto" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_produto" ValidationGroup="Save" CssClass="fst-italic fw-bold text-danger text-small"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="l_desenho" runat="server" Text="Desenho:"></asp:Label>
                    <asp:TextBox ID="i_desenho" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_desenho" ValidationGroup="Save" CssClass="fst-italic fw-bold text-danger text-small"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="l_pos" runat="server" Text="Posição:"></asp:Label>
                    <asp:TextBox ID="i_pos" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_pos" ValidationGroup="Save" CssClass="fst-italic fw-bold text-danger text-small"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="l_cotas" runat="server" Text="Nº Cotas:"></asp:Label>
                    <asp:TextBox ID="i_cotas" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_cotas" ValidationGroup="Save" CssClass="fst-italic fw-bold text-danger text-small"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="l_pdf" runat="server" Text="PDF:"></asp:Label>
                    <asp:FileUpload CssClass="form-control" ID="i_pdf" runat="server" accept=".pdf" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_pdf" ValidationGroup="Save" CssClass="fst-italic fw-bold text-danger text-small"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="l_xlt" runat="server" Text="XLT:"></asp:Label>
                    <asp:FileUpload CssClass="form-control" ID="i_xlt" runat="server" accept=".xlt" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_xlt" ValidationGroup="Save" CssClass="fst-italic fw-bold text-danger text-small"></asp:RequiredFieldValidator>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button4" class="btn btn-outline-danger" runat="server" Text="Cancelar" OnClick="cancel_Click" />
                    <asp:Button ID="Button1" class="btn btn-outline-success" runat="server" Text="Salvar" ValidationGroup="Save" OnClick="bSave_Click" />
                </div>
            </div>
        </div>
    </div>

    <!--Modal Editar Template-->
    <div class="modal fade" id="editModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header justify-content-center">
                    <h4 class="modal-title fw-bold" id="staticBackdropLabel2">Editar Template</h4>
                </div>
                <div class="modal-body">
                    <asp:Label ID="el_produto" runat="server" Text="Produto:"></asp:Label>
                    <asp:TextBox ID="ei_produto" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="ei_produto" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="el_desenho" runat="server" Text="Desenho:"></asp:Label>
                    <asp:TextBox ID="ei_desenho" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="ei_desenho" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="el_pos" runat="server" Text="Posição:"></asp:Label>
                    <asp:TextBox ID="ei_pos" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="ei_pos" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="el_cotas" runat="server" Text="Nº Cotas:"></asp:Label>
                    <asp:TextBox ID="ei_cotas" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="ei_cotas" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="el_pdf" runat="server" Text="PDF:"></asp:Label>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:PlaceHolder ID="ph_pdf" runat="server"></asp:PlaceHolder>
                            <asp:LinkButton ID="b_rmvpdf" runat="server" OnClick="b_rmvpdf_Click" CssClass="remove-button"><asp:Image runat="server" ImageUrl="~/Src/img/remove.png" Height="24"/></asp:LinkButton>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                    <asp:Label ID="el_xlt" runat="server" Text="XLT:"></asp:Label>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:PlaceHolder ID="ph_xlt" runat="server"></asp:PlaceHolder>
                            <asp:LinkButton ID="b_rmvxlt" runat="server" OnClick="b_rmvxlt_Click" CssClass="remove-button"><asp:Image runat="server" ImageUrl="~/Src/img/remove.png" Height="24"/></asp:LinkButton>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div class="modal-footer">
                    <asp:Button ID="Button3" class="btn btn-outline-danger" runat="server" Text="Cancelar" OnClick="cancel_Click" />
                    <asp:Button ID="Button2" class="btn btn-outline-success" runat="server" Text="Salvar" ValidationGroup="Edit" OnClick="bEdit_Click" />
                </div>
            </div>
        </div>
    </div>

    <!--Modal Desenho-->
    <div class="modal fade" id="pdfModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row" style="height:77vh">
                        <asp:Literal ID="Desenho" runat="server"></asp:Literal>
                    </div>                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>
