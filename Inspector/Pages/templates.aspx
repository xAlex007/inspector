<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="templates.aspx.cs" Inherits="Pages_templates" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Body" ContentPlaceHolderID="render" Runat="Server">
    <main>
        <asp:Button ID="b_newtemplate" runat="server" Text="Novo" class="btn btn-success mt-5 shadow p-3 rounded" OnClick="b_newtemplate_Click" />

                
    </main>
</asp:Content>


