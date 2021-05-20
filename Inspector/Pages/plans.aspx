<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="plans.aspx.cs" Inherits="Pages_plans" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="render" Runat="Server">
    <main>
        <asp:Button ID="b_newplano" Class="btn btn-outline-success" Text="Novo" runat="server" OnClick="b_newplano_Click" CausesValidation="false"/>
        <asp:SqlDataSource ID="Planos" runat="server" ConnectionString="<%$ ConnectionStrings:InspectorDB %>" SelectCommand="SELECT P.OP, P.Produto, T.Desenho, T.Posicao, T.Cotas, T.PDF, T.XLT FROM [dbo].PlanoInspecao AS P INNER JOIN [dbo].Template AS T ON P.Produto = T.Produto"></asp:SqlDataSource>
        <asp:ListView ID="lvplanos" runat="server" DataSourceID="Planos" OnItemCommand="lvplanos_ItemCommand">
            <LayoutTemplate>
                <div class="row bg-body">
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
                <div class="row bg-light border">
                    <div class="col-sm">
                        '<%# Eval("OP") %>'
                    </div>
                    <div class="col-md">
                        '<%# Eval("Produto") %>'
                    </div>                    
                    <div class="col-md">
                        '<%# Eval("Desenho") %>'
                    </div>
                    <div class="col-md">
                        '<%# Eval("Posicao") %>'
                    </div>
                    <div class="col-md">
                        '<%# Eval("Cotas") %>'
                    </div>
                    <div class="col-md">
                        '<%# Eval("PDF") %>'
                    </div>
                    <div class="col-md">
                        '<%# Eval("XLT") %>'
                    </div>
                    <div class="col-sm">
                        <asp:LinkButton ID="lbAlterar" class="btn btn-outline-primary btn-sm" runat="server" CommandName="Alterar" CommandArgument='<%# Bind("Produto")%>'>Alterar</asp:LinkButton>
                        <asp:LinkButton ID="lbDeletar" class="btn btn-outline-danger btn-sm" runat="server" CommandName="Deletar" CommandArgument='<%# Bind("Produto")%>'>Excluir</asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </main>
</asp:Content>

