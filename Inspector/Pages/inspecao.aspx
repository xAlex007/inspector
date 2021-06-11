<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="inspecao.aspx.cs" Inherits="Pages_plans" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.1.1/dist/select2-bootstrap-5-theme.min.css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('.js-example-basic-single').select2();
        });
    </script>
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="render" Runat="Server">
    <div class="container">
        <div class="row h-100">
            <%--Cabeçalho--%>
            <div class="row centered" style="font-size: 20px;">
                <div class="col-5 text-center fw-bold border border-2 rounded-1 border-success bg-header align-self-end">
                    <div class="row row-cols-1">
                        <div class="col border rounded-1 border-success pt-4 pb-3">
                            <asp:Label ID="l_op" runat="server" Text="ORDEM DE PRODUÇÃO"></asp:Label>
                        </div>
                    </div>
                    <div class="row row-cols-2">
                        <div class="col border rounded-1 border-success p-center">
                            <asp:Label ID="l_prod" runat="server" Text="PRODUTO"></asp:Label>
                        </div>
                        <div class="col border rounded-1 border-success p-center">
                            <asp:Label ID="l_desp" runat="server" Text="DESENHO + POS"></asp:Label>
                        </div>
                    </div>
                    <div class="row row-cols-1">
                        <div class="col border rounded-1 border-success p-center">
                            <asp:Label ID="l_corr" runat="server" Text="CORRIDA"></asp:Label>
                        </div>
                    </div>
                    <div class="row row-cols-2">
                        <div class="col border rounded-1 border-success p-center">
                            <asp:Label ID="l_cotas" runat="server" Text="Nº COTA"></asp:Label>
                        </div>
                        <div class="col border rounded-1 border-success p-center">
                            <asp:Label ID="l_valores" runat="server" Text="VALOR MEDIDO"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
            <%--Dados--%>
            <asp:Literal ID="dados" runat="server"></asp:Literal>
            <div class="row centered mt-1">
                <div class="col-5 text-center border border-success rounded-1 bg-light align-self-start">
                    <div class="row row-cols-2">
                        <div class="col border-end border-success p-center">
                            <asp:Label ID="Label14" runat="server" Text="Nº COTA"></asp:Label>
                        </div>
                        <div class="col centered py-2">
                            <asp:TextBox CssClass="form-control form-control-sm text-center m-0" Width="120" Style="font-size: 18px;" ID="TextBox2" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <select class="js-example-basic-single" name="state">
                      <option value="AL">Alabama</option>
                      <option value="WY">Wyoming</option>
                    </select>
                    <asp:DropDownList ID="ddl_planos" CssClass="js-example-basic-single" runat="server"></asp:DropDownList>
                </div>
            </div>
        </div>

        <!--Modal Nova Inspeção-->
        <div class="modal fade" id="newModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header justify-content-center" style="background-color:rgba(0,0,0,0.3)">
                        <h4 class="modal-title fw-bold" id="staticBackdropLabel">Novo Registro de Inspeção</h4>
                    </div>

                    <div class="modal-body" style="background-color:rgba(0,0,0,0.15)">
                        <div class="row centered">
                            <div class="col-6">
                                <asp:Label ID="l_plano" runat="server" Text="Ordem de Produção:"></asp:Label>

                                <br />
                                <asp:Label ID="l_newcorr" runat="server" Text="Corrida:"></asp:Label>
                                <asp:TextBox ID="i_newcorr" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="i_newcorr" ValidationGroup="OK" CssClass="fst-italic fw-bold text-danger text-small"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer" style="background-color:rgba(0,0,0,0.3)">
                        <asp:Button ID="bCancel" class="btn btn-outline-danger" runat="server" Text="Cancelar" OnClick="cancel_Click"/>
                        <asp:Button ID="bOK" class="btn btn-outline-success" runat="server" Text="OK" ValidationGroup="OK" OnClick="bOK_Click"/>                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
