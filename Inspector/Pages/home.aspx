<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Pages_home" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="render" runat="Server">
    <div id="l-gradient">
        <div class="container pb-4">
            <!--Relógio-->
            <div class="row text-center" style="height:calc(1rem + 16vh); font-size: calc(1rem + 2.5vw);">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:Timer ID="Clock" runat="server" Interval="1000" OnTick="Clock_Tick"></asp:Timer>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="l_clock" runat="server"></asp:Label>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Clock" EventName="Tick"></asp:AsyncPostBackTrigger>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <!--Menu-->
            <div class="row h-100 centered">
                <!--Opções de inspeção-->
                <div class="col-9 col-sm-8 col-lg-5 col-xl-4 menu-border" style="border-color: #4ED84B; background-color: rgba(255,255,255,0.5);">
                    <div class="row g-5 row-cols-2 py-5">
                        <div class="col d-flex justify-content-end">
                            <asp:HyperLink class="item-inspecao pt-3 px-3" NavigateUrl="~/Pages/inspecao.aspx" ToolTip="Registrar Inspeções" runat="server"><asp:Image ImageUrl="~/Src/img/caliper.png" AlternateText="Registrar Inspeções" ToolTip="Registrar Inspeções" style="height: 70px;" runat="server" /></asp:HyperLink>
                        </div>
                        <div class="col d-flex justify-content-start">
                            <asp:HyperLink class="item-inspecao p-2" NavigateUrl="#" ToolTip="Visualização de Desenhos" runat="server"><asp:Image ImageUrl="~/Src/img/school-supplies.png" AlternateText="Visualização de Desenhos" ToolTip="Visualização de Desenhos" style="height: 85px;" runat="server" /></asp:HyperLink>
                        </div>
                        <div class="col d-flex justify-content-end">
                            <asp:HyperLink class="item-inspecao pt-32 px-3" NavigateUrl="#" ToolTip="Relatório de Inspeção" runat="server"><asp:Image ImageUrl="~/Src/img/agreement.png" AlternateText="Relatório de Inspeção" ToolTip="Relatório de Inspeção" style="height: 70px;" runat="server" /></asp:HyperLink>
                        </div>
                        <div class="col d-flex justify-content-start">
                            <asp:HyperLink class="item-inspecao py-3 px-3" NavigateUrl="#" ToolTip="Não Conformidade" runat="server"><asp:Image class="mt-1" ImageUrl="~/Src/img/high-priority.png" AlternateText="Não Conformidade" ToolTip="Não Conformidade" style="height: 70px;" runat="server" /></asp:HyperLink>
                        </div>
                    </div>
                </div>
                <!--Opções de gerenciamento-->
                <asp:Literal ID="manageMenu" runat="server"></asp:Literal>
            </div>
        </div>
    </div>
</asp:Content>
