<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Index" %>



<asp:Content ID="Body" ContentPlaceHolderID="render" Runat="Server">
<div id="gradient">
    <div class="rounded" id="homewelcome">
        <h1>INSPECTOR</h1>        
    
    </div>
</div>
            <asp:LinkButton ID="lbLogin" class="btn btn-light" runat="server" OnClick="lbLogin_Click">Login</asp:LinkButton>
             <asp:LinkButton href="Pages/Registrar.aspx" ID="lbRegistro"  class="btn btn-light" runat="server" OnClick="lbRegistro_Click1">Registrar</asp:LinkButton>

</asp:Content>

