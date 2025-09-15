<%@ Page Title="" Language="C#" MasterPageFile="~/Secure/Site.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="DatabaseInventory__Web_.Secure.Statistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TopContent" runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="../CustomCss/dbGridView-Stats.css" rel="stylesheet" />
    <link href="../CustomCss/fadeTexts.css" rel="stylesheet" />

    <style>
        /*
            .hoverTable {
            width: 100%;
            border-collapse: collapse;
        }

        .hoverTable td {
            padding: 7px;
            border: #4e95f4 1px solid;
        }
        .hoverTable tr {
            background: #b8d1f3;
        }
        
        .hoverTable tr:hover {
            background-color: #ffff99;
        }
        */

        table {
            font-size: 16px;
        }

        th, td {
            padding-top: 2px !important;
            padding-bottom: 2px !important;
        }

        .rowsCursor {
            cursor: default;
        }

        .bg-image {
            background-image: url('../Images/ph-points.png');
            background-repeat: no-repeat;
            /*height: 120vh;*/
            margin: auto;
            width: 550px;
            height: 700px;
            background-size: contain;
            background-position: center;
            text-align: center;
            /*border: 3px solid green;*/
            /*float: right;*/
            position: absolute;
            top: 1px;
            left: 580px;
        }

        .tbl-title {
            font-weight: bold;
            font-size: 18px !important;
        }

        .tbl-title-aws {
            font-weight: bold;
            font-size: 18px !important;
        }

        .imgAws {
            padding-left: 50px;
            background-image: url('/Images/aws.png');
            background-repeat: no-repeat;
            background-size: contain;
        }

        .leftCol-Svdb {
            font-weight: bold;
            padding-left: 15px;
            width: 70%;
        }

        .leftCol-Val {
            padding-left: 30px;
        }

        .rightCol {
            width: 250px;
            text-align: left;
            font-weight: bold;
            padding-left: 15px;
        }

        /*THIS IS FOR CONTENT THAT HAS MULTIPLE COLUMNS*/

        .map {
            /*float: left;*/
            /*margin-left: 50px;*/
            width: 10%;
            border: solid 1px white;
        }

        .aws {
            float: left;
            width: 20%;
            margin-left: 20px;
            border: solid 1px white;
        }

        .eastAve-Nova {
            float: left;
            margin-left: 50px;
            width: 40%;
            border: solid 1px white;
        }

        .Launchpad-Cebu {
            float: left;
            margin-left: 40px;
            width: 40%;
            border: solid 1px white;
        }

        .dgvTables {
            float: left;
            margin-right: 30px;
            margin-left: 20px;
            width: 40%;
            border: solid 1px white;
        }

        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        .row {
            display: flex;
        }

        @media screen and (max-width: 600px) {
            .column {
                width: 100%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="card">
        <div style="padding-left: 25px;">
            <%--<div class="fade-in-text">
                <h2><b>STATISTICS</b></h2>
            </div>--%>
            <h2><b>STATISTICS</b></h2>
        </div>
        <div class="body">
            <div class="table-responsive">
                <div class="dataTables_wrapper form-inline dt-bootstrap">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="bs-component">
                                <div class="row">
                                    <div class="aws">
                                        <div style="padding-top: 120px;"></div>
                                        <%-- CLOUD --%>
                                        <table border="0" cellpadding="4" cellspacing="4" style="width: 250px;">
                                            <tr>
                                                <td colspan="2">
                                                    <img src="../Images/aws.png" height="60" width="60"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" bgcolor="#CDD7E0" style="text-align: center;">
                                                    <asp:Label ID="label41" runat="server" Text="CLOUD" CssClass="tbl-title-aws"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="leftCol-Svdb">
                                                    <asp:Label ID="label81" runat="server" Text="SERVERS:"></asp:Label>
                                                </td>
                                                <td class="rightCol" style="color: red;">
                                                    <asp:Label ID="lblCloudServer" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label83" runat="server" Text="AWS:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblCloudAWS" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Svdb">
                                                    <asp:Label ID="label85" runat="server" Text="DATABASES:"></asp:Label>
                                                </td>
                                                <td class="rightCol" style="color: red;">
                                                    <asp:Label ID="lblCloudDB" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label87" runat="server" Text="Production:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblCloudProd" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label89" runat="server" Text="Pre-Production:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblCloudPreProd" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label91" runat="server" Text="Old-Production:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblCloudOldProd" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label93" runat="server" Text="Staging:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblCloudStg" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label95" runat="server" Text="Development:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblCloudDev" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label97" runat="server" Text="Others:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblCloudOthers" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label99" runat="server" Text="DR:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblCloudDR" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="eastAve-Nova">
                                        <!-- EAST AVENUE -->
                                        <table border="0" cellpadding="4" cellspacing="4" style="width: 250px;">
                                            <tr>
                                                <td colspan="2" bgcolor="#7786A3" style="text-align: center;">
                                                    <asp:Label ID="label1" runat="server" Text="EAST AVENUE" CssClass="tbl-title" ForeColor="white"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="leftCol-Svdb">
                                                    <asp:Label ID="label2" runat="server" Text="SERVERS:"></asp:Label>
                                                </td>
                                                <td class="rightCol" style="color: red;">
                                                    <asp:Label ID="lblEAServers" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label4" runat="server" Text="Physical:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblEAPhysical" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label3" runat="server" Text="VM:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblEAVM" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Svdb">
                                                    <asp:Label ID="label6" runat="server" Text="DATABASES:"></asp:Label>
                                                </td>
                                                <td class="rightCol" style="color: red;">
                                                    <asp:Label ID="lblEADB" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label8" runat="server" Text="Production:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblEAProd" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label10" runat="server" Text="Pre-Production:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblEAPreProd" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label12" runat="server" Text="Old-Production:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblEAOldProd" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label14" runat="server" Text="Staging:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblEAStg" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label16" runat="server" Text="Development:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblEADev" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label18" runat="server" Text="Others:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblEAOthers" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label20" runat="server" Text="DR:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblEADR" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>

                                        <div style="padding-top: 50px; padding-top: 50px;"></div>

                                        <%-- NOVALICHES --%>

                                        <table border="0" cellpadding="4" cellspacing="4" style="width: 250px;">
                                            <tr>
                                                <td colspan="2" bgcolor="#283949" style="text-align: center;">
                                                    <asp:Label ID="label5" runat="server" Text="NOVALICHES" CssClass="tbl-title" ForeColor="white"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="leftCol-Svdb">
                                                    <asp:Label ID="label7" runat="server" Text="SERVERS:"></asp:Label>
                                                </td>
                                                <td class="rightCol" style="color: red;">
                                                    <asp:Label ID="lblNovaServers" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label11" runat="server" Text="Physical:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblNovaPhysical" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label15" runat="server" Text="VM:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblNovaVM" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Svdb">
                                                    <asp:Label ID="label19" runat="server" Text="DATABASES:"></asp:Label>
                                                </td>
                                                <td class="rightCol" style="color: red;">
                                                    <asp:Label ID="lblNovaDB" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label22" runat="server" Text="Production:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblNovaProd" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label24" runat="server" Text="Pre-Production:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblNovaPreProd" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label26" runat="server" Text="Old-Production:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblNovaOldProd" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label28" runat="server" Text="Staging:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblNovaStg" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label30" runat="server" Text="Development:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblNovaDev" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label32" runat="server" Text="Others:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblNovaOthers" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label34" runat="server" Text="DR:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblNovaDR" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>

                                    </div>

                                    <div class="map">
                                        <div class="bg-image">
                                        </div>
                                    </div>

                                    <div class="Launchpad-Cebu">

                                        <%-- LAUNCHPAD --%>

                                        <table border="0" cellpadding="4" cellspacing="4" style="width: 250px; margin-left: 250px;">
                                            <tr>
                                                <td colspan="2" bgcolor="#9ABAB7" style="text-align: center;">
                                                    <asp:Label ID="label9" runat="server" Text="LAUNCHPAD" CssClass="tbl-title" ForeColor="White"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="leftCol-Svdb">
                                                    <asp:Label ID="label13" runat="server" Text="SERVERS:"></asp:Label>
                                                </td>
                                                <td class="rightCol" style="color: red;">
                                                    <asp:Label ID="lblLaunchServers" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label21" runat="server" Text="Physical:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblLaunchPhysical" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label25" runat="server" Text="VM:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblLaunchVM" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Svdb">
                                                    <asp:Label ID="label29" runat="server" Text="DATABASES:"></asp:Label>
                                                </td>
                                                <td class="rightCol" style="color: red;">
                                                    <asp:Label ID="lblLaunchDB" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label33" runat="server" Text="Production:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblLaunchProd" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label36" runat="server" Text="Pre-Production:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblLaunchPreProd" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label38" runat="server" Text="Old-Production:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblLaunchOldProd" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label40" runat="server" Text="Staging:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblLaunchStg" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label43" runat="server" Text="Development:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblLaunchDev" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label45" runat="server" Text="Others:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblLaunchOthers" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label47" runat="server" Text="DR:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblLaunchDR" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>

                                        <div style="padding-top: 50px; padding-top: 50px;"></div>

                                        <%-- CEBU --%>

                                        <table border="0" cellpadding="4" cellspacing="4" style="width: 250px; margin-left: 250px;">
                                            <tr>
                                                <td colspan="2" bgcolor="#E3DAD3" style="text-align: center;">
                                                    <asp:Label ID="label17" runat="server" Text="CEBU" CssClass="tbl-title"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="leftCol-Svdb">
                                                    <asp:Label ID="label23" runat="server" Text="SERVERS:"></asp:Label>
                                                </td>
                                                <td class="rightCol" style="color: red;">
                                                    <asp:Label ID="lblCebuServers" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label31" runat="server" Text="Physical:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblCebuPhysical" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label37" runat="server" Text="VM:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblCebuVM" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Svdb">
                                                    <asp:Label ID="label42" runat="server" Text="DATABASES:"></asp:Label>
                                                </td>
                                                <td class="rightCol" style="color: red;">
                                                    <asp:Label ID="lblCebuDB" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label46" runat="server" Text="Production:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblCebuProd" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label49" runat="server" Text="Pre-Production:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblCebuPreProd" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label51" runat="server" Text="Old-Production:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblCebuOldProd" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label53" runat="server" Text="Staging:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblCebuStg" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label55" runat="server" Text="Development:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblCebuDev" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label57" runat="server" Text="Others:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblCebuOthers" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="leftCol-Val">
                                                    <asp:Label ID="label59" runat="server" Text="DR:"></asp:Label>
                                                </td>
                                                <td class="rightCol">
                                                    <asp:Label ID="lblCebuDR" runat="server" Text="0"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="dgvTables">
                                        <%--OVERALLASSIGNMENTONLINE--%>
                                        <asp:GridView ID="dgv1" AutoGenerateColumns="false" runat="server" DataKeyNames="Server_Type" CssClass="grivdiv" Width="340px" PagerStyle-CssClass="GridPager" PageSize="10" AllowPaging="true" PagerSettings-Mode="NumericFirstLast" PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-NextPageText=">>" PagerSettings-PreviousPageText="<<" PagerSettings-PageButtonCount="5" GridLines="Horizontal">
                                            <RowStyle CssClass="rowsCursor" />
                                            <HeaderStyle BackColor="#DEE5EB" Font-Bold="True" Height="25px" HorizontalAlign="Left" ForeColor="#404040" />
                                            <FooterStyle BackColor="#DEE5EB" Font-Bold="True" ForeColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="SERVER_TYPE" HeaderText="SERVER_TYPE" SortExpression="SERVER_TYPE" />
                                                <asp:BoundField DataField="TOTALDB" HeaderText="COUNT" SortExpression="TOTALDB" />
                                            </Columns>
                                        </asp:GridView>
                                        <div style="padding-top: 5px; padding-bottom: 5px;"></div>
                                        <%-- OVERALLASSIGNMENTONLINE --%>
                                        <asp:GridView ID="dgv2" AutoGenerateColumns="false" runat="server" DataKeyNames="Assignment" CssClass="grivdiv" Width="340px" PagerStyle-CssClass="GridPager" PageSize="10" AllowPaging="true" PagerSettings-Mode="NumericFirstLast" PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-NextPageText=">>" PagerSettings-PreviousPageText="<<" PagerSettings-PageButtonCount="5" GridLines="Horizontal">
                                            <RowStyle CssClass="rowsCursor" />
                                            <HeaderStyle BackColor="#DEE5EB" Font-Bold="True" Height="25px" HorizontalAlign="Left" ForeColor="#404040" />
                                            <FooterStyle BackColor="#DEE5EB" Font-Bold="True" ForeColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="ASSIGNMENT" HeaderText="ASSIGNMENT" SortExpression="ASSIGNMENT" />
                                                <asp:BoundField DataField="TOTALDB" HeaderText="COUNT" SortExpression="TOTALDB" />
                                            </Columns>
                                        </asp:GridView>
                                        <div style="padding-top: 5px; padding-bottom: 5px;"></div>
                                        <%-- OVERALLSERVERTYPEPRODONLINE --%>
                                        <asp:GridView ID="dgv3" AutoGenerateColumns="false" runat="server" DataKeyNames="Server_Type" CssClass="grivdiv" Width="340px" PagerStyle-CssClass="GridPager" PageSize="10" AllowPaging="true" PagerSettings-Mode="NumericFirstLast" PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-NextPageText=">>" PagerSettings-PreviousPageText="<<" PagerSettings-PageButtonCount="5" GridLines="Horizontal">
                                            <RowStyle CssClass="rowsCursor" />
                                            <HeaderStyle BackColor="#DEE5EB" Font-Bold="True" Height="25px" HorizontalAlign="Left" ForeColor="#404040" />
                                            <FooterStyle BackColor="#DEE5EB" Font-Bold="True" ForeColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="SERVER_TYPE" HeaderText="SERVER_TYPE" SortExpression="SERVER_TYPE" />
                                                <asp:BoundField DataField="TSERVER" HeaderText="SERVER_COUNT" SortExpression="TSERVER" />
                                                <asp:BoundField DataField="TPRODDB" HeaderText="COUNT" SortExpression="TPRODDB" />
                                            </Columns>
                                        </asp:GridView>
                                        <div style="padding-top: 5px; padding-bottom: 5px;"></div>
                                        <%-- OVERALLLOCSERVERONLINE --%>
                                        <asp:GridView ID="dgv4" AutoGenerateColumns="false" runat="server" DataKeyNames="Location" CssClass="grivdiv" Width="340px" PagerStyle-CssClass="GridPager" PageSize="10" AllowPaging="true" PagerSettings-Mode="NumericFirstLast" PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-NextPageText=">>" PagerSettings-PreviousPageText="<<" PagerSettings-PageButtonCount="5" GridLines="Horizontal">
                                            <RowStyle CssClass="rowsCursor" />
                                            <HeaderStyle BackColor="#DEE5EB" Font-Bold="True" Height="25px" HorizontalAlign="Left" ForeColor="#404040" />
                                            <FooterStyle BackColor="#DEE5EB" Font-Bold="True" ForeColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="LOCATION" HeaderText="LOCATION" SortExpression="LOCATION" />
                                                <asp:BoundField DataField="SERVER_TYPE" HeaderText="SERVER_TYPE" SortExpression="SERVER_TYPE" />
                                                <asp:BoundField DataField="TOTALDB" HeaderText="COUNT" SortExpression="TOTALDB" />
                                                <%--<asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />  --%>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
