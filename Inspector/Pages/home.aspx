<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Pages_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://codepen.io/chocochip/pen/zYxMgRG"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="render" runat="Server">
    <main>

        <div class="row" style="margin-top: 200px; --bs-gutter-x: 0;">

            <%--Opções de inspeção--%>
            <div class="col-md-6 col-2">
                <div class="rounded col-6" style="margin-left: 300px; margin-right: 50px; border: 3px solid #4ED84B; --bs-gutter-x: 0; background-color: rgb(0,0,0,0.05); width:550px; height:400px;">
                    <div class="row pt-5 pb-5">
                        <div class="col-md-2 col-2 item-inspeção p-2" style="border: 1px solid #4ED84B; background-color: #4ED84B; border-radius: 1.2rem; margin-left:125px;margin-top:15px; height:110px; width:110px;">
                            <a href="#">
                                <img src="../Src/img/caliper.png" style="height: 90px"></a>
                        </div>
                        <div class="col-md-2 col-2 item-inspeção p-2" style="border: 1px solid #4ED84B; background-color: #4ED84B; border-radius: 1.2rem; margin-left:80px;margin-top:15px; height:110px; width:110px;">
                            <a href="#">
                                <img src="../Src/img/agreement.png" style="height: 90px;"></a>
                        </div>
                    </div>
                    <div class="row pb-5">
                        <div class="col-md-2 col-2 item-inspeção p-2" style="border: 1px solid #4ED84B; background-color: #4ED84B; border-radius: 1.2rem; margin-left:125px;height:110px; width:110px;">
                            <a href="#">
                                <img src="../Src/img/school-supplies.png" style="height: 90px;"></a>
                        </div>
                        <div class="col-md-2 col-2 item-inspeção p-2" style="border: 1px solid #4ED84B; background-color: #4ED84B; border-radius: 1.2rem; margin-left:80px; height:110px; width:110px;">
                            <a href="#">
                                <img src="../Src/img/high-priority.png" style="height: 84px; margin-left:3px;" class="mt-1"></a>
                        </div>
                    </div>

                </div>
            </div>

            <%--Opções de gerenciamento--%>
            <div class="col-md-6 col-6">
                <div class="rounded col-6" style="margin-left: 50px; margin-right: 50px; border: 3px solid #4B84D8; --bs-gutter-x: 0; background-color: rgb(0,0,0,0.05); width:550px; height:400px;">
                    <div class="row pt-5 pb-5">
                        <div class="col-md-2 col-2 item-gerenciamento p-2" style="border: 1px solid #4B84D8; background-color: #4B84D8; margin-left: 125px;margin-top:15px; border-radius: 1.2rem;height:110px; width:110px;">
                            <a href="#">
                                <img src="../Src/img/doughnut-chart.png" style="height: 90px;"></a>
                        </div>
                        <div class="col-md-2 col-2 item-gerenciamento p-2" style="border: 1px solid #4B84D8; background-color: #4B84D8; margin-left: 80px;margin-top:15px; border-radius: 1.2rem;height:110px; width:110px;">
                            <a href="templates.aspx">
                                <img src="../Src/img/template.png" style="height: 85px; margin-left:3px;"></a>
                        </div>
                    </div>
                    <div class="row pb-5">
                        <div class="col-md-2 col-2 item-gerenciamento p-2" style="border: 1px solid #4B84D8; background-color: #4B84D8; margin-left: 125px; border-radius: 1.2rem;height:110px; width:110px;">
                            <a href="#">
                                <img src="../Src/img/test-passed.png" style="height: 90px;"></a>
                        </div>
                        <div class="col-md-2 col-2 item-gerenciamento p-2" style="border: 1px solid #4B84D8; background-color: #4B84D8; margin-left: 80px; border-radius: 1.2rem;height:110px; width:110px;">
                            <a href="#">
                                <img src="../Src/img/book-stack.png" style="height: 87px;"></a>
                        </div>
                    </div>

                </div>
            </div>

        </div>

    </main>
</asp:Content>

