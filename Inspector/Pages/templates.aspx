<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="templates.aspx.cs" Inherits="Pages_templates" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        
    </script>
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="render" Runat="Server">
    <div class="block" style="width:100vw"> 
        <asp:Button ID="b_newtemplate" Class="btn btn-outline-success" Text="Novo" runat="server" OnClick="b_newtemplate_Click" CausesValidation="false"/>
        <asp:SqlDataSource ID="Templates" runat="server" ConnectionString="<%$ ConnectionStrings:InspectorDB %>" SelectCommand="SELECT * FROM [Template]"></asp:SqlDataSource>
        <asp:ListView ID="lvtemplates" runat="server" DataSourceID="Templates" OnItemCommand="lvtemplates_ItemCommand">
            <LayoutTemplate>
                <div class="row bg-body" style="--bs-gutter-x: 0; margin-left: 50px; margin-right: 50px; margin-top: 10px">
                    <div class="col-sm heading">
                        Produto
                    </div>
                    <div class="col-md heading">
                        Desenho
                    </div>
                    <div class="col-md heading">
                        Posição
                    </div>
                    <div class="col-md heading">
                        Nº Cotas
                    </div>
                    <div class="col-md heading">
                        Anexo PDF
                    </div>
                    <div class="col-md heading">
                        Anexo XLT
                    </div>
                    <div class="col-sm heading">
                        Ações
                    </div>
                </div>      
                <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
            </LayoutTemplate>

            <ItemTemplate>
                <div class="row bg-light border" style="--bs-gutter-x: 0; margin-left: 50px; margin-right: 50px; margin-top: 10px">
                    <div class="col-sm">
                        <%# Eval("Produto") %>
                    </div>
                    <div class="col-md">
                        <%# Eval("Desenho") %>
                    </div>
                    <div class="col-md">
                        <%# Eval("Posicao") %>
                    </div>
                    <div class="col-md">
                        <%# Eval("Cotas") %>
                    </div>
                    <div class="col-md">
                        <%# Eval("PDF") %>
                    </div>
                    <div class="col-md">
                        <%# Eval("XLT") %>
                    </div>
                    <div class="col-sm">
                        <asp:LinkButton ID="lbAlterar" class="btn btn-outline-primary btn-sm" runat="server" CommandName="Alterar" CommandArgument='<%# Bind("Produto")%>'>Alterar</asp:LinkButton>
                        <asp:LinkButton ID="lbDeletar" class="btn btn-outline-danger btn-sm" runat="server" CommandName="Deletar" CommandArgument='<%# Bind("Produto")%>'>Excluir</asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>

        <!--Modal Novo Template-->
        <div class="modal fade" id="newModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header justify-content-center" style="background-color:rgba(0,0,0,0.3)">
                        <h4 class="modal-title fw-bold" id="staticBackdropLabel">Novo Template</h4>
                    </div>

                    <div class="modal-body" style="background-color:rgba(0,0,0,0.15)">
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
                        <asp:FileUpload ID="i_pdf" runat="server" accept=".pdf" />                  
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_pdf" ValidationGroup="Save" CssClass="fst-italic fw-bold text-danger text-small"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="l_xlt" runat="server" Text="XLT:"></asp:Label>                      
                        <asp:FileUpload ID="i_xlt" runat="server" accept=".xlt"/>              
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_xlt" ValidationGroup="Save" CssClass="fst-italic fw-bold text-danger text-small"></asp:RequiredFieldValidator>
                    </div>

                    <div class="modal-footer" style="background-color:rgba(0,0,0,0.3)">
                        <asp:Button ID="Button4" class="btn btn-outline-danger" runat="server" Text="Cancelar" OnClick="cancel_Click"/>
                        <asp:Button ID="Button1" class="btn btn-outline-success" runat="server" Text="Salvar" ValidationGroup="Save" OnClick="bSave_Click"/>                        
                    </div>
                </div>
            </div>
        </div>
        
        <!--Modal Editar Template-->
        <div class="modal fade" id="editModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color:rgba(0,0,0,0.3)">
                        <h4 class="modal-title" id="staticBackdropLabel2"><strong style="font-family: mina; margin-left: 136px; font-size:27px">Editar template</strong></h4>
                    </div>
                    <div class="modal-body" style="background-color:rgba(0,0,0,0.15)">
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
                                <asp:PlaceHolder ID="ph_pdf" runat="server" ></asp:PlaceHolder>
                                <asp:LinkButton ID="b_rmvpdf" runat="server" OnClick="b_rmvpdf_Click" CssClass="remove-button"><asp:Image runat="server" ImageUrl="~/Src/img/remove.png" Height="24"/></asp:LinkButton>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <br />
                        <asp:Label ID="el_xlt" runat="server" Text="XLT:"></asp:Label>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>                               
                                <asp:PlaceHolder ID="ph_xlt" runat="server" ></asp:PlaceHolder>
                                <asp:LinkButton ID="b_rmvxlt" runat="server" OnClick="b_rmvxlt_Click" CssClass="remove-button"><asp:Image runat="server" ImageUrl="~/Src/img/remove.png" Height="24"/></asp:LinkButton>
                             </ContentTemplate>
                        </asp:UpdatePanel>                       
                    </div>

                    <div class="modal-footer" style="background-color:rgba(0,0,0,0.3)">
                        <asp:Button ID="Button3" class="btn btn-outline-danger" runat="server" Text="Cancelar" OnClick="cancel_Click"/>
                        <asp:Button ID="Button2" class="btn btn-outline-success" runat="server" Text="Salvar" ValidationGroup="Edit" OnClick="bEdit_Click"/>                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


