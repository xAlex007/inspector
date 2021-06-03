<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="render" Runat="Server">
<div id="gradient">
    <div class="rounded" id="homewelcome">
        <h1>INSPECTOR</h1>        
        <asp:LinkButton ID="lbLogin" class="btn btn-light" runat="server" style="margin-left: 90px;">Login</asp:LinkButton>
    </div>
</div>
</asp:Content>

