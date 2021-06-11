<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="inspecao.aspx.cs" Inherits="Pages_plans" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="render" Runat="Server">
    <div class="container">
        <div class="row h-100">
            <div class="row justify-content-center align-items-center" style="font-size:20px;">
                <div class="col-5 text-center fw-bold border border-success border-2 rounded-1 bg-header align-self-end">
                    <div class="row row-cols-1">
                        <div class="col border rounded-1 border-success pt-4 pb-3" style="border-color: #4ED84B; background-color: rgba(255,255,255,0.5);">
                            <asp:Label ID="Label1" runat="server" Text="ORDEM DE PRODUÇÃO"></asp:Label>
                        </div>
                    </div>
                    <div class="row row-cols-2">
                        <div class="col border rounded-1 border-success p-center" style="border-color: #4ED84B; background-color: rgba(255,255,255,0.5);">
                            <asp:Label ID="Label2" runat="server" Text="PRODUTO"></asp:Label>
                        </div>                    
                        <div class="col border rounded-1 border-success p-center" style="border-color: #4ED84B; background-color: rgba(255,255,255,0.5);">
                            <asp:Label style="line-height:10px;" ID="Label3" runat="server" Text="DESENHO + POS"></asp:Label>
                        </div>
                    </div>
                    <div class="row row-cols-1">
                        <div class="col border rounded-1 border-success p-center" style="border-color: #4ED84B; background-color: rgba(255,255,255,0.5);">
                            <asp:Label ID="Label4" runat="server" Text="CORRIDA"></asp:Label>
                        </div>
                    </div>
                    <div class="row row-cols-2">
                        <div class="col border rounded-1 border-success p-center" style="border-color: #4ED84B; background-color: rgba(255,255,255,0.5);">
                            <asp:Label ID="Label5" runat="server" Text="Nº COTA"></asp:Label>
                        </div>
                        <div class="col border rounded-1 border-success p-center" style="border-color: #4ED84B; background-color: rgba(255,255,255,0.5);">
                            <asp:Label ID="Label6" runat="server" Text="VALOR MEDIDO"></asp:Label>
                        </div>
                    </div>
                </div>                
            </div>
            <div class="row justify-content-center align-items-center mt-1">
                <div class="col-5 text-center fw-bold border border-success rounded-1 bg-light align-self-start">                    
                    <div class="row row-cols-2">
                        <div class="col border-end border-success py-2" style="border-color: #4ED84B; background-color: rgba(255,255,255,0.5);">
                            <asp:Label ID="Label14" runat="server" Text="Nº COTA"></asp:Label>
                        </div>
                        <div class="col py-2" style="border-color: #4ED84B; background-color: rgba(255,255,255,0.5);">
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>                
           </div>
       </div>
    </div>
</asp:Content>
