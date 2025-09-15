<%@ Page Title="" Language="C#" MasterPageFile="~/Secure/Site.Master" AutoEventWireup="true" CodeBehind="Chart.aspx.cs" Inherits="DatabaseInventory__Web_.Secure.Chart" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TopContent" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="../CustomCss/dbGridview-Stats.css" rel="stylesheet" />
    <link href="../CustomCss/fadeTexts.css" rel="stylesheet" />

    <%-- This is for Tab Section --%>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    <style style="text/css">
        .rowsCursor {
            cursor: default;
        }
    </style>

    <script>
        $(document).ready(function () {
            $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
                localStorage.setItem('activeTab', $(e.target).attr('href'));
            });
            var activeTab = localStorage.getItem('activeTab');

            if (activeTab) {
                $('#myTab a[href="' + activeTab + '"]').tab('show');
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="card">
        <div style="padding-left: 25px;">
            <%--<div class="fade-in-text">
                <h2><b>CHART</b></h2>
            </div>--%>
                <h2><b>CHART</b></h2>
        </div>
        <div class="body">
            <div class="table-responsive">
                <div class="dataTables_wrapper form-inline dt-bootstrap">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="bs-component">
                                <ul class="nav nav-tabs" id="myTab">
                                    <li class="active"><a href="#c1" data-toggle="tab">Chart 1</a></li>
                                    <li><a href="#c2" data-toggle="tab">Chart 2</a></li>
                                    <li><a href="#c3" data-toggle="tab">Chart 3</a></li>
                                    <li><a href="#c4" data-toggle="tab">Chart 4</a></li>
                                </ul>
                                <div id="myTabContent" class="tab-content">
                                    <div class="tab-pane fade active in" id="c1">
                                        <table border="0" cellpadding="4" cellspacing="4" style="width: 100%;">
                                            <tr>
                                                <td>
                                                    <asp:Chart ID="Chart1" runat="server" CssClass="chart" Width="800" Height="350">
                                                        <Titles>
                                                            <asp:Title Text="OVERALL" Name="c1Title" runat="server" ForeColor="#404040" Font="Century Gothic, 14pt, style=Bold"></asp:Title>
                                                        </Titles>
                                                        <Series>
                                                            <asp:Series Name="s1"></asp:Series>
                                                            <asp:Series Name="s2"></asp:Series>
                                                        </Series>
                                                        <Legends>
                                                            <asp:Legend Name="Legend1"></asp:Legend>
                                                        </Legends>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea1">
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>

                                                    <asp:Chart ID="Chart2" runat="server" CssClass="chart" Width="800" Height="350">
                                                        <Titles>
                                                            <asp:Title Text="OVER ALL WINDOWS" Name="c1Title" runat="server" ForeColor="#404040" Font="Century Gothic, 14pt, style=Bold"></asp:Title>
                                                        </Titles>
                                                        <Series>
                                                            <asp:Series Name="s1"></asp:Series>
                                                            <asp:Series Name="s2"></asp:Series>
                                                        </Series>
                                                        <Legends>
                                                            <asp:Legend Name="Legend1"></asp:Legend>
                                                        </Legends>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea1">
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Chart ID="Chart3" runat="server" CssClass="chart" Width="800" Height="350">
                                                        <Titles>
                                                            <asp:Title Text="OVERALL LINUX" Name="c1Title" runat="server" ForeColor="#404040" Font="Century Gothic, 14pt, style=Bold"></asp:Title>
                                                        </Titles>
                                                        <Series>
                                                            <asp:Series Name="s1"></asp:Series>
                                                            <asp:Series Name="s2"></asp:Series>
                                                        </Series>
                                                        <Legends>
                                                            <asp:Legend Name="Legend1"></asp:Legend>
                                                        </Legends>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea1">
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>

                                                    <asp:Chart ID="Chart4" runat="server" CssClass="chart" Width="800" Height="350">
                                                        <Titles>
                                                            <asp:Title Text="OVERALL LOCATION" Name="c1Title" runat="server" ForeColor="#404040" Font="Century Gothic, 14pt, style=Bold"></asp:Title>
                                                        </Titles>
                                                        <Series>
                                                            <asp:Series Name="s1"></asp:Series>
                                                        </Series>
                                                        <Legends>
                                                            <asp:Legend Name="Legend1"></asp:Legend>
                                                        </Legends>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea1">
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="tab-pane fade" id="c2">
                                        <table border="0" cellpadding="4" cellspacing="4" style="width: 100%;">
                                            <tr>
                                                <td colspan="2">
                                                    <asp:Chart ID="Chart5" runat="server" CssClass="chart" Width="800" Height="350">
                                                        <Titles>
                                                            <asp:Title Text="OVERALL SERVER TYPE" Name="c1Title" runat="server" ForeColor="#404040" Font="Century Gothic, 14pt, style=Bold"></asp:Title>
                                                        </Titles>
                                                        <Series>
                                                            <asp:Series Name="s1"></asp:Series>
                                                            <asp:Series Name="s2"></asp:Series>
                                                            <asp:Series Name="s3"></asp:Series>
                                                        </Series>
                                                        <Legends>
                                                            <asp:Legend Name="Legend1"></asp:Legend>
                                                        </Legends>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea1">
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>

                                                    <asp:Chart ID="Chart6" runat="server" CssClass="chart" Width="800" Height="350">
                                                        <Titles>
                                                            <asp:Title Text="OVERALL LOC SERVER" Name="c1Title" runat="server" ForeColor="#404040" Font="Century Gothic, 14pt, style=Bold"></asp:Title>
                                                        </Titles>
                                                        <Series>
                                                            <asp:Series Name="s1"></asp:Series>
                                                            <asp:Series Name="s2"></asp:Series>
                                                            <asp:Series Name="s3"></asp:Series>
                                                        </Series>
                                                        <Legends>
                                                            <asp:Legend Name="Legend1"></asp:Legend>
                                                        </Legends>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea1">
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Chart ID="Chart7" runat="server" CssClass="chart" Width="1400" Height="350">
                                                        <Titles>
                                                            <asp:Title Text="OVERALL DB CREATED" Name="c1Title" runat="server" ForeColor="#404040" Font="Century Gothic, 14pt, style=Bold"></asp:Title>
                                                        </Titles>
                                                        <Series>
                                                            <asp:Series Name="s1"></asp:Series>
                                                        </Series>
                                                        <Legends>
                                                            <asp:Legend Name="Legend1"></asp:Legend>
                                                        </Legends>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea1">
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>
                                                </td>
                                                <td style="width: 500px; text-align: center; padding: 20px;">
                                                    <asp:DropDownList ID="cboYear" CssClass="form-control" OnSelectedIndexChanged="cboYear_SelectedIndexChanged"
                                                        AutoPostBack="true"
                                                        runat="server" Width="200px">
                                                    </asp:DropDownList>
                                                    <br />
                                                    <br />
                                                    <asp:GridView ID="dgv" AutoGenerateColumns="false" runat="server" DataKeyNames="YEAR" CssClass="grivdiv" Width="340px" PagerStyle-CssClass="GridPager" PageSize="10" AllowPaging="true" PagerSettings-Mode="NumericFirstLast" PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-NextPageText=">>" PagerSettings-PreviousPageText="<<" PagerSettings-PageButtonCount="5" GridLines="Horizontal">
                                                        <RowStyle CssClass="rowsCursor" />
                                                        <HeaderStyle BackColor="#DEE5EB" Font-Bold="True" Height="25px" HorizontalAlign="Left" ForeColor="#404040" />
                                                        <FooterStyle BackColor="#DEE5EB" Font-Bold="True" ForeColor="White" />
                                                        <Columns>
                                                            <asp:BoundField DataField="YEAR" HeaderText="YEAR" SortExpression="YEAR" />
                                                            <asp:BoundField DataField="ASSIGNMENT" HeaderText="ASSIGNMENT" SortExpression="ASSIGNMENT" />
                                                            <asp:BoundField DataField="TCreatedDB" HeaderText="COUNT" SortExpression="TCreatedDB" />
                                                            <%--<asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />  --%>
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </table>

                                    </div>
                                    <div class="tab-pane fade" id="c3">
                                        <asp:Chart ID="Chart8" runat="server" CssClass="chart" Width="2350" Height="550">
                                            <Titles>
                                                <asp:Title Text="OVERALL SA" Name="c1Title" runat="server" ForeColor="#404040" Font="Century Gothic, 14pt, style=Bold" Docking="Top" Alignment="MiddleLeft" TextStyle="Default"></asp:Title>
                                            </Titles>
                                            <Series>
                                                <asp:Series Name="s1"></asp:Series>
                                                <asp:Series Name="s2"></asp:Series>
                                                <asp:Series Name="s3"></asp:Series>
                                            </Series>
                                            <Legends>
                                                <asp:Legend Name="Legend1"></asp:Legend>
                                            </Legends>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1">
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
                                    </div>
                                    <div class="tab-pane fade" id="c4">
                                        <h3 align="center" >Sorry, This page is not available as of this moment.</h3>
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
