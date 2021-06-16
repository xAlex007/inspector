<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PDF.aspx.cs" Inherits="Pages_PDF" uiCulture="aa-DJ" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>


    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
    </style>
</head>
<body style="height: 107px">
    <form id="form1" runat="server">
        <div>

 <nav class="navbar nav-cecal d-flex justify-content-between">
                <div class="container-fluid px-0 px-md-3">
                    <a class="navbar-brand ms-sm-0 ms-md-3 ps-2 ps-md-0" href="../Pages/home.aspx">
                        <img src="../Src/img/logo.png" class="logo-cecal img-fluid" height="48" width="180" alt="Logo Cecal"/>
                    </a>
                    <div class="container-fluid-nav text-center md title">
                        <h1>INSPECTOR</h1>
                    </div>                
                    <div id="userbtn" style="width:180px;" class="d-flex flex-row-reverse pe-4 pe-md-0" runat="server" visible="false">
                        <div class="btn-group me-sm-0 me-md-3 align-self-end">
                          <button type="button" class="dropbtn btn btn-light rounded-circle" data-bs-toggle="dropdown" aria-expanded="false">
                              <asp:Label ID="usrini" runat="server"></asp:Label>
                          </button>
                          <ul class="dropdown-menu dropdown-content dropdown-menu-end pt-0">
                            <li class="card-header"><asp:Label ID="greet" runat="server"></asp:Label></li>
                            <li><asp:PlaceHolder ID="ph_usr" runat="server"></asp:PlaceHolder></li>
                            <li><asp:LinkButton ID="b_logout" CssClass="dropdown-item" OnClick="b_logout_Click" runat="server"><img class="pb-1" src="../Src/img/logout.png" height="32"/>&nbspSair</asp:LinkButton></li>
                          </ul>
                        </div>
                    </div>
                </div>
            </nav>

        </div>
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1"></td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="margin-left: 40px">
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="margin-left: 40px">
                    <asp:GridView ID="GridView1" runat="server" Height="31px" Width="780px" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="applicationid" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="applicationid" HeaderText="ID" ReadOnly="True" SortExpression="applicationid">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cname" HeaderText="Nome" SortExpression="cname">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="address" HeaderText="Endereço" SortExpression="address">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="emailadress" HeaderText="EmailAdress" SortExpression="emailadress">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mobilenumber" HeaderText="Numero" SortExpression="mobilenumber">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="resumefile" HeaderText="Resume (PDF)" Text="Visualizar" />
                        </Columns>
                        <EmptyDataRowStyle BackColor="Gray" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="#999999" ForeColor="Red" Font-Bold="True" Height="40px" />
                        <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
                        <RowStyle ForeColor="Red" Height="40px" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="margin-left: 40px">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PDFConnectionString %>" SelectCommand="SELECT * FROM [Table_1]"></asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
