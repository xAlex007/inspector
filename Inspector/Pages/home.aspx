<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Pages_home" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="render" runat="Server">
    <div id="l-gradient">
    <div class="container">      
        <div class="row h-100 justify-content-center align-items-center">
            <%--Opções de inspeção--%>
            <div class="col-10 col-sm-8 col-lg-5 col-xl-4 menu-border" style="border-color: #4ED84B; background-color: rgba(0,0,0,0.05);">
                <div class="row g-5 row-cols-2 py-5">
                    <div class="col d-flex justify-content-end">
                        <asp:HyperLink class="item-inspecao p-2" NavigateUrl="#" ToolTip="Registrar Inspeções" runat="server"><asp:Image ImageUrl="~/Src/img/caliper.png" AlternateText="Registrar Inspeções" ToolTip="Registrar Inspeções" style="height: 90px;" runat="server" /></asp:HyperLink>
                    </div>
                    <div class="col d-flex justify-content-start">
                        <asp:HyperLink class="item-inspecao p-2" NavigateUrl="#" ToolTip="Visualização de Desenhos" runat="server"><asp:Image ImageUrl="~/Src/img/school-supplies.png" AlternateText="Visualização de Desenhos" ToolTip="Visualização de Desenhos" style="height: 90px;" runat="server" /></asp:HyperLink>
                    </div>
                    <div class="col d-flex justify-content-end">                        
                        <asp:HyperLink class="item-inspecao p-2" NavigateUrl="#" ToolTip="Relatório de Inspeção" runat="server"><asp:Image ImageUrl="~/Src/img/agreement.png" AlternateText="Relatório de Inspeção" ToolTip="Relatório de Inspeção" style="height: 90px;" runat="server" /></asp:HyperLink>
                    </div>
                    <div class="col d-flex justify-content-start">
                        <asp:HyperLink class="item-inspecao p-2" NavigateUrl="#" ToolTip="Não Conformidade" runat="server"><asp:Image class="mt-1" ImageUrl="~/Src/img/high-priority.png" AlternateText="Não Conformidade" ToolTip="Não Conformidade" style="height: 84px; margin-left: 3px;" runat="server" /></asp:HyperLink>
                    </div>
                </div>                
            </div>
            <%--Opções de gerenciamento--%>
            <asp:Literal ID="manageMenu" runat="server"></asp:Literal>        
        </div>
    </div>
    </div>
</asp:Content>

