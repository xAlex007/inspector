<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="templates.aspx.cs" Inherits="Pages_templates" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" Runat="Server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="render" Runat="Server">
    <main> 
        <asp:Button ID="b_newtemplate" Class="btn btn-outline-success" Text="Novo" runat="server" OnClick="b_newtemplate_Click" CausesValidation="false"/>

        <asp:GridView ID="gv_templates" runat="server" OnRowCreated="gv_templates_RowCreated" OnRowCommand="gv_templates_RowCommand">
             <Columns>
                 <asp:TemplateField>
                         <ItemTemplate>
                            <asp:LinkButton ID="lbAlterar" runat="server" CommandName="Alterar" CommandArgument='<%# Bind("Produto")%>'>Alterar</asp:LinkButton>
                         </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField>
                         <ItemTemplate>
                            <asp:LinkButton ID="lbDeletar" runat="server" CommandName="Deletar" CommandArgument='<%# Bind("Produto")%>'>Excluir</asp:LinkButton>
                         </ItemTemplate>
                 </asp:TemplateField>
             </Columns>
        </asp:GridView>

        <!--Modal Novo Template-->
        <div class="modal fade" id="newModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="staticBackdropLabel"><strong>Novo Template</strong></h4>
                    </div>
                    <div class="modal-body">
                        <asp:Label ID="l_produto" runat="server" Text="Produto:"></asp:Label>
                        <asp:TextBox ID="i_produto" CssClass="form-control" runat="server"></asp:TextBox>                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_produto" ValidationGroup="Save"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="l_desenho" runat="server" Text="Desenho:"></asp:Label>
                        <asp:TextBox ID="i_desenho" CssClass="form-control" runat="server"></asp:TextBox>                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_desenho" ValidationGroup="Save"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="l_pos" runat="server" Text="Posição:"></asp:Label>
                        <asp:TextBox ID="i_pos" CssClass="form-control" runat="server"></asp:TextBox>                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_pos" ValidationGroup="Save"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="l_cotas" runat="server" Text="Nº Cotas:"></asp:Label>
                        <asp:TextBox ID="i_cotas" CssClass="form-control" runat="server"></asp:TextBox>                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_cotas" ValidationGroup="Save"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="l_pdf" runat="server" Text="PDF:"></asp:Label>
                        <asp:TextBox ID="i_pdf" CssClass="form-control" runat="server"></asp:TextBox>                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_pdf" ValidationGroup="Save"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="l_xlt" runat="server" Text="XLT:"></asp:Label>
                        <asp:TextBox ID="i_xlt" CssClass="form-control" runat="server"></asp:TextBox>                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_xlt" ValidationGroup="Save"></asp:RequiredFieldValidator>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="Button4" class="btn btn-outline-danger" runat="server" Text="Cancelar" OnClick="cancel_Click"/>
                        <asp:Button ID="Button1" class="btn btn-outline-success" runat="server" Text="Salvar" ValidationGroup="Save" OnClick="bSave_Click"/>                        
                    </div>
                </div>
            </div>
        </div>
        
        <!--Modal Editar Template-->
                <div class="modal fade" id="editModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="staticBackdropLabel2"><strong>Editar Template</strong></h4>
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
                        <asp:TextBox ID="ei_pdf" CssClass="form-control" runat="server"></asp:TextBox>                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="ei_pdf" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="el_xlt" runat="server" Text="XLT:"></asp:Label>
                        <asp:TextBox ID="ei_xlt" CssClass="form-control" runat="server"></asp:TextBox>                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="ei_xlt" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="Button3" class="btn btn-outline-danger" runat="server" Text="Cancelar" OnClick="cancel_Click"/>
                        <asp:Button ID="Button2" class="btn btn-outline-success" runat="server" Text="Salvar" ValidationGroup="Edit" OnClick="bEdit_Click"/>                        
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>


