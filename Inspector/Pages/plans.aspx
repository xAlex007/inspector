<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="plans.aspx.cs" Inherits="Pages_plans" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="render" Runat="Server">
    <div class="block" style="width:100vw">
        <asp:Button ID="b_newplano" Class="btn btn-outline-success" Text="Novo" runat="server" OnClick="b_newplano_Click" CausesValidation="false"/>
        <asp:SqlDataSource ID="Planos" runat="server" ConnectionString="<%$ ConnectionStrings:InspectorDB %>" SelectCommand="SELECT P.OP, P.Produto, T.Desenho, T.Posicao, T.Cotas, T.PDF, T.XLT FROM [dbo].PlanoInspecao AS P INNER JOIN [dbo].Template AS T ON P.Produto = T.Produto"></asp:SqlDataSource>
        <asp:ListView ID="lvplanos" runat="server" DataSourceID="Planos" OnItemCommand="lvplanos_ItemCommand">
            <LayoutTemplate>
                <div class="row bg-body" style="--bs-gutter-x: 0; margin-left: 50px; margin-right: 50px; margin-top: 10px">
                    <div class="col-sm heading">
                        OP
                    </div>
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
                        <%# Eval("OP") %>
                    </div>
                    <div class="col-md">
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
                        <asp:LinkButton ID="lbAlterar" class="btn btn-outline-primary btn-sm" runat="server" CommandName="Alterar" CommandArgument='<%# Bind("OP")%>'>Alterar</asp:LinkButton>
                        <asp:LinkButton ID="lbDeletar" class="btn btn-outline-danger btn-sm" runat="server" CommandName="Deletar" CommandArgument='<%# Bind("OP")%>'>Excluir</asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>

        <asp:GridView ID="GridView1" runat="server"></asp:GridView>

        <!--Modal Novo Plano-->
        <div class="modal fade" id="newModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header justify-content-center" style="background-color:rgba(0,0,0,0.3)">
                        <h4 class="modal-title fw-bold" id="staticBackdropLabel">Novo Plano de Inspeção</h4>
                    </div>

                    <div class="modal-body" style="background-color:rgba(0,0,0,0.15)">
                        <asp:Label ID="l_op6" runat="server" Text="Ordem de Produção (6 dígitos):"></asp:Label>
                        <asp:TextBox ID="i_op6" CssClass="form-control" runat="server"></asp:TextBox>                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_op6" ValidationGroup="OK" CssClass="fst-italic fw-bold text-danger text-small"></asp:RequiredFieldValidator>
                    </div>

                    <div class="modal-footer" style="background-color:rgba(0,0,0,0.3)">
                        <asp:Button ID="Button1" class="btn btn-outline-danger" runat="server" Text="Cancelar" OnClick="cancel_Click"/>
                        <asp:Button ID="Button2" class="btn btn-outline-success" runat="server" Text="OK" ValidationGroup="OK" OnClick="bOK_Click"/>                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

