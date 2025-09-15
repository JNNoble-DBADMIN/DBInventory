<%@ Page Title="" Language="C#" MasterPageFile="~/Secure/Site.Master" AutoEventWireup="true" CodeBehind="DatabaseList.aspx.cs" Inherits="DatabaseInventory__Web_.Secure.DatabaseList" ValidateRequest="false" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TopContent" runat="server">
    <%--<webopt:BundleReference runat="server" Path="~/Content/css" />--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <%-- <link href="Content/bootstrap.cosmo.min.css" rel="stylesheet" />
    <link href="Content/StyleSheet.css" rel="stylesheet" />--%>


    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">--%>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>--%>
    <link href="../CustomCss/dbGridview.css" rel="stylesheet" />
    <link href="../CustomCss/fadeTexts.css" rel="stylesheet" />

    <style>
        tr, td {
            padding: 5px !important;
        }

        .rowsCursor {
            cursor: default;
        }

        .modalFieldsLabel {
            text-align: left;
            width: 30%;
        }

        .modalFieldsObject {
            text-align: left;
            width: 300px;
        }

        .toolBarLabel {
            font-size: 14px;
            text-align: left;
            padding-bottom: 10px;
            width: 3%;
        }

        .toolBarObject {
            width: 230px;
            padding-bottom: 10px;
        }

        .gridEditButton {
            background: url('../Images/Pencil1.png') no-repeat;
            cursor: pointer;
            width: 18px;
            height: 18px;
            border: none;
            background-size: contain;
            opacity: 1;
        }

            .gridEditButton:hover {
                /*opacity: 1;*/
                /*-webkit-filter: brightness(110%);*/
                background: url('../Images/Pencil2.png') no-repeat;
                cursor: pointer;
                cursor: pointer;
                width: 19px;
                height: 19px;
                border: none;
                background-size: contain;
                opacity: 1;
            }

        .emptyRows {
            font-weight: bold;
        }

        /*.scrolling {  
            position: absolute;  
        }*/

        .dgvScrollable {
            overflow-x: scroll;
            overflow-y: auto;
            max-height: 640px;
        }

        /*customButton*/

        .customBtn {
            display: inline-block;
            font-size: 14px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            outline: none;
            color: #fff;
            background-color: #03539f;
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px #C1C1C1;
            width: 80px;
            height: 40px;
        }

            .customBtn:hover {
                background-color: #02396D
            }

            .customBtn:active {
                background-color: #02396D;
                box-shadow: 0 3px #E5E5E5;
                transform: translateY(2px);
            }

        .input-icon {
            position: absolute;
            right: 13px;
            top: calc(50% - 0.5em);
        }

        .input {
            padding-left: 17px;
        }

        .input-wrapper {
            position: relative;
        }

        .img {
            position: fixed;
            height: 90px;
            width: 90px;
            top: 150px;
            left: 45%;
        }

        .modal2 {
            position: fixed;
            top: 0;
            left: 0;
            background-color: white;
            z-index: 99;
            opacity: 0.8;
            filter: alpha(opacity=80);
            -moz-opacity: 0.8;
            min-height: 100%;
            width: 100%;
        }

        .loading {
            font-family: Calibri;
            font-size: 10pt;
            width: 200px;
            height: 100px;
            display: none;
            position: fixed;
            z-index: 999;
        }
    </style>

    <script type="text/javascript">
        function triggerSearch() {
            if (event.keyCode == 13) {
                document.getElementById('<%= btnSearch.ClientID %>').click();
            }
        }

        function openModal() {
            $("#myModal").modal("show");
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="card">
        <div style="padding-left: 25px;">
            <%--<div class="fade-in-text">
                <h2><b>DATABASE LIST</b></h2>
            </div>--%>
            <h2 style="margin-bottom: 0px !important;"><b>DATABASE LIST</b></h2>
        </div>
        <div class="body">
            <div class="table-responsive">
                <div class="dataTables_wrapper form-inline dt-bootstrap" style="padding-bottom: 5px !important;">

                    <table border="0" cellpadding="2" cellspacing="2" style="width: 100%;">
                        <tr>
                            <td class="toolBarLabel">
                                <asp:Label
                                    runat="server"
                                    ID="Label11"
                                    CssClass="rdfLabel rdfBlock"
                                    Text="Search:">
                                </asp:Label>
                            </td>
                            <td colspan="7" style="padding-bottom: 10px;">


                                <div>
                                    <div class="input-wrapper">
                                        <input type="text" id="txtSearch" placeholder=""
                                            runat="server" onkeypress="triggerSearch()"
                                            class="form-control" style="max-width: none !important; width: 100% !important; padding-bottom: 10px;">
                                        <label for="txtSearch" class="fa fa-search fa-lg input-icon"></label>
                                    </div>
                                </div>

                            </td>
                            <td class="toolBarLabel">
                                <asp:Button ID="btnSearch" Text="Search" runat="server" CssClass="customBtn" OnClick="btnSearch_Click" />
                            </td>
                        </tr>

                        <tr>
                            <td class="toolBarLabel">
                                <asp:Label
                                    runat="server"
                                    ID="Label12"
                                    CssClass="rdfLabel rdfBlock"
                                    Text="Port:">
                                </asp:Label>
                            </td>
                            <td class="toolBarObject">
                                <asp:DropDownList ID="cboPort" CssClass="form-control" OnSelectedIndexChanged="cboPort_SelectedIndexChanged"
                                    AutoPostBack="true"
                                    runat="server" Width="200px">
                                </asp:DropDownList>

                            </td>
                            <td class="toolBarLabel">
                                <asp:Label
                                    runat="server"
                                    ID="Label13"
                                    CssClass="rdfLabel rdfBlock"
                                    Text="Assignment:">
                                </asp:Label>
                            </td>
                            <td class="toolBarObject">
                                <asp:DropDownList ID="cboAssignmentSearch" CssClass="form-control" OnSelectedIndexChanged="cboAssignmentSearch_SelectedIndexChanged"
                                    AutoPostBack="true"
                                    runat="server" Width="200px">
                                </asp:DropDownList>

                            </td>
                            <td class="toolBarLabel">
                                <asp:Label
                                    runat="server"
                                    ID="Label14"
                                    CssClass="rdfLabel rdfBlock"
                                    Text="Status:">
                                </asp:Label>
                            </td>
                            <td class="toolBarObject">
                                <asp:DropDownList ID="cboStatus" CssClass="form-control" OnSelectedIndexChanged="cboStatus_SelectedIndexChanged"
                                    AutoPostBack="true"
                                    runat="server" Width="200px">
                                </asp:DropDownList>
                            </td>

                            <td colspan="3" style="text-align: right">
                                <asp:Button ID="btnExport" Text="Export" runat="server" CssClass="customBtn" Style="width: 80px" OnClick="btnExport_Click" />

                                <asp:Button ID="btnRefresh" Text="Refresh" runat="server" CssClass="customBtn" Style="width: 80px" OnClick="btnRefresh_Click" />

                                <asp:Button ID="btnClear" Text="Clear" runat="server" CssClass="customBtn" Style="width: 80px" OnClick="btnClear_Click" />
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="dgvScrollable">
                    <asp:GridView ID="dgv" runat="server"
                        OnPageIndexChanging="dgv_PageIndexChanging" OnRowDataBound="dgv_RowDataBound" OnSelectedIndexChanged="dgv_SelectedIndexChanged" ShowHeaderWhenEmpty="True" EmptyDataText="No records found" EmptyDataRowStyle-CssClass="emptyRows"
                        GridLines="Horizontal"
                        ShowFooter="true"
                        OnRowCommand="dgv_RowCommand"
                        DataKeyNames="ID"
                        AutoGenerateColumns="False"
                        CssClass="grivdiv" Width="100%"
                        PagerStyle-CssClass="GridPager"
                        PageSize="9" AllowPaging="true"
                        PagerSettings-Mode="NumericFirstLast"
                        PagerSettings-FirstPageText="First"
                        PagerSettings-LastPageText="Last"
                        PagerSettings-NextPageText=">>"
                        PagerSettings-PreviousPageText="<<"
                        PagerSettings-PageButtonCount="5">
                        <RowStyle CssClass="rowsCursor" />

                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#DEE5EB" Font-Bold="True" Height="25px" HorizontalAlign="Left" ForeColor="black" />
                        <FooterStyle BackColor="#DEE5EB" Font-Bold="True" ForeColor="White" />

                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button Text="" runat="server" CssClass="gridEditButton" CommandName="Editx" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible="true" ItemStyle-Width="400px" />
                            <asp:BoundField DataField="SERVER_TYPE" HeaderText="SERVER_TYPE" SortExpression="SERVER_TYPE" />
                            <asp:BoundField DataField="LOCATION" HeaderText="LOCATION" SortExpression="LOCATION" ItemStyle-Width="150px" />
                            <asp:BoundField DataField="PRIVATE_IP" HeaderText="PRIVATE_IP" SortExpression="PRIVATE_IP" ItemStyle-Width="150px" />
                            <asp:BoundField DataField="PUBLIC_IP" HeaderText="PUBLIC_IP" SortExpression="PUBLIC_IP" ItemStyle-Width="150px" />
                            <asp:BoundField DataField="DB_SYSTEM" HeaderText="DB_SYSTEM" SortExpression="DB_SYSTEM" ItemStyle-Width="150px" />
                            <asp:BoundField DataField="VERSION" HeaderText="VERSION" SortExpression="VERSION" ItemStyle-Width="150px" Visible="false" />
                            <asp:BoundField DataField="INSTANCE_NAME" HeaderText="INSTANCE_NAME" SortExpression="INSTANCE_NAME" ItemStyle-Width="150px" />
                            <asp:BoundField DataField="DATABASE_NAME" HeaderText="DATABASE_NAME" SortExpression="DATABASE_NAME" ItemStyle-Width="150px" />
                            <asp:TemplateField HeaderText="VERSION">
                                <HeaderStyle Width="300" />
                                <ItemStyle Width="300" />
                                <ItemTemplate>
                                    <%# (Eval("VERSION").ToString().Length > 20) ? (Eval("VERSION").ToString().Substring(0, 20) + "...") : Eval("VERSION")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="INSTANCE_NAME" HeaderText="INSTANCE_NAME" SortExpression="INSTANCE_NAME" ItemStyle-Width="150px" />
                            <asp:BoundField DataField="DATABASE_NAME" HeaderText="DATABASE_NAME" SortExpression="DATABASE_NAME" ItemStyle-Width="150px" />
                            <asp:BoundField DataField="PORT" HeaderText="PORT" SortExpression="PORT" ItemStyle-Width="150px" />
                            <asp:BoundField DataField="CREATED_DATE" HeaderText="CREATED_DATE" SortExpression="CREATED_DATE" ItemStyle-Width="150px" />
                            <asp:BoundField DataField="COMPANY" HeaderText="COMPANY" SortExpression="COMPANY" ItemStyle-Width="150px" />
                            <asp:TemplateField HeaderText="SYSTEM_NAME">
                                <HeaderStyle Width="300" />
                                <ItemStyle Width="300" />
                                <ItemTemplate>
                                    <%# (Eval("SYSTEM_NAME").ToString().Length > 20) ? (Eval("SYSTEM_NAME").ToString().Substring(0, 20) + "...") : Eval("SYSTEM_NAME")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ASSIGNMENT" HeaderText="ASSIGNMENT" SortExpression="ASSIGNMENT" ItemStyle-Width="150px" />
                            <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" ItemStyle-Width="150px" />
                            <asp:TemplateField HeaderText="VERSION">
                                <HeaderStyle Width="300" />
                                <ItemStyle Width="300" />
                                <ItemTemplate>
                                    <%# (Eval("REMARKS").ToString().Length > 20) ? (Eval("REMARKS").ToString().Substring(0, 20) + "...") : Eval("REMARKS")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="FREQUENCY" HeaderText="FREQUENCY" SortExpression="FREQUENCY" ItemStyle-Width="150px" />
                            <asp:BoundField DataField="Data_Size_MB" HeaderText="DATA SIZE(MB)" SortExpression="Data_Size_MB" ItemStyle-Width="150px" />
                            <asp:BoundField DataField="Log_Size_MB" HeaderText="LOG SIZE(MB)" SortExpression="Log_Size_MB" ItemStyle-Width="150px" />
                            <asp:BoundField DataField="Total_Size_MB" HeaderText="TOTAL SIZE(MB)" SortExpression="Total_Size_MB" ItemStyle-Width="150px" />
                            <asp:BoundField DataField="LAST_UPDATE_DATE" HeaderText="LAST_UPDATE_DATE" SortExpression="LAST_UPDATE_DATE" ItemStyle-Width="150px" Visible="true" />
                            <asp:BoundField DataField="DATE_MODIFIED" HeaderText="DATE MODIFIED" SortExpression="DATE_MODIFIED" ItemStyle-Width="150px" />
                            <asp:BoundField DataField="Removed_Date" HeaderText="DATE_REMOVED" SortExpression="Removed_Date" ItemStyle-Width="150px" />
                            <%--<asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />  --%>
                        </Columns>


                        <%--<EmptyDataTemplate>
                                    <div align="center">No records found.</div>
                                </EmptyDataTemplate>--%>
                    </asp:GridView>
                    <div style="margin-top: 5px; margin-bottom: 5px; margin-left: 10px">
                        <asp:Label ID="Label15" runat="server" Text="Last Update: " Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblLastUpdate" runat="server" Text="--"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="lblhf_id" runat="server" />

    <!--MODAL STARTS HERE-->
    <div class="modal fade" id="myModal" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><b>UPDATE DETAILS</b></h4>
                </div>
                <div class="modal-body">
                    <div class="col-lg-14">
                        <div class="well bs-component">
                            <table border="0" cellpadding="4" cellspacing="4" style="width: 100%;">
                                <tr>
                                    <td class="modalFieldsLabel">
                                        <asp:Label
                                            runat="server"
                                            ID="Label2"
                                            CssClass="rdfLabel rdfBlock"
                                            Text="Server Type:">
                                        </asp:Label>
                                    </td>

                                    <td class="modalFieldsObject">
                                        <asp:DropDownList ID="cboServerType" CssClass="form-control"
                                            AutoPostBack="False"
                                            runat="server" Width="280px">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: center">
                                        <asp:RequiredFieldValidator
                                            ForeColor="Red"
                                            runat="server"
                                            ID="RequiredFieldValidator2"
                                            ControlToValidate="cboServerType"
                                            ErrorMessage="*"
                                            ToolTip="Server Type is Required"
                                            ValidationGroup="validateSave" Font-Size="Medium">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="modalFieldsLabel">
                                        <asp:Label
                                            runat="server"
                                            ID="Label3"
                                            CssClass="rdfLabel rdfBlock"
                                            Text="Location:">
                                        </asp:Label>
                                    </td>

                                    <td class="modalFieldsObject">
                                        <asp:DropDownList ID="cboLocation" CssClass="form-control"
                                            AutoPostBack="False"
                                            runat="server">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: center">
                                        <asp:RequiredFieldValidator
                                            ForeColor="Red"
                                            runat="server"
                                            ID="RequiredFieldValidator1"
                                            ControlToValidate="cboLocation"
                                            ErrorMessage="*"
                                            ToolTip="Location is Required"
                                            ValidationGroup="validateSave" Font-Size="Medium">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="modalFieldsLabel">
                                        <asp:Label
                                            runat="server"
                                            ID="Label4"
                                            CssClass="rdfLabel rdfBlock"
                                            Text="Private IP:">
                                        </asp:Label>
                                    </td>
                                    <td class="modalFieldsObject">
                                        <input type="text" class="form-control" id="txtPrivateIP" placeholder="Private IP" runat="server">
                                    </td>
                                    <td style="text-align: center">
                                        <asp:RequiredFieldValidator
                                            ForeColor="Red"
                                            runat="server"
                                            ID="RequiredFieldValidator3"
                                            ControlToValidate="txtPrivateIP"
                                            ErrorMessage="*"
                                            ToolTip="Private IP is Required"
                                            ValidationGroup="validateSave" Font-Size="Medium">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="modalFieldsLabel">
                                        <asp:Label
                                            runat="server"
                                            ID="Label5"
                                            CssClass="rdfLabel rdfBlock"
                                            Text="Public IP:">
                                        </asp:Label>
                                    </td>
                                    <td class="modalFieldsObject">
                                        <input type="text" class="form-control" id="txtPublicIP" placeholder="Public IP" runat="server">
                                    </td>
                                    <td style="text-align: center">
                                        <asp:RequiredFieldValidator
                                            ForeColor="Red"
                                            runat="server"
                                            ID="RequiredFieldValidator4"
                                            ControlToValidate="txtPublicIP"
                                            ErrorMessage="*"
                                            ToolTip="Public IP is Required"
                                            ValidationGroup="validateSave" Font-Size="Medium">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="modalFieldsLabel">
                                        <asp:Label
                                            runat="server"
                                            ID="Label6"
                                            CssClass="rdfLabel rdfBlock"
                                            Text="Instance Name:">
                                        </asp:Label>
                                    </td>
                                    <td class="modalFieldsObject">
                                        <input type="text" class="form-control" id="txtInstanceName" placeholder="Instance Name" runat="server">
                                    </td>
                                    <td style="text-align: center">
                                        <asp:RequiredFieldValidator
                                            ForeColor="Red"
                                            runat="server"
                                            ID="RequiredFieldValidator5"
                                            ControlToValidate="txtInstanceName"
                                            ErrorMessage="*"
                                            ToolTip="Instance Name is Required"
                                            ValidationGroup="validateSave" Font-Size="Medium">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="modalFieldsLabel">
                                        <asp:Label
                                            runat="server"
                                            ID="Label7"
                                            CssClass="rdfLabel rdfBlock"
                                            Text="Database Name:">
                                        </asp:Label>
                                    </td>
                                    <td class="modalFieldsObject">
                                        <input type="text" class="form-control" id="txtDBName" placeholder="Database Name" runat="server">
                                    </td>
                                    <td style="text-align: center">
                                        <asp:RequiredFieldValidator
                                            ForeColor="Red"
                                            runat="server"
                                            ID="RequiredFieldValidator6"
                                            ControlToValidate="txtDBName"
                                            ErrorMessage="*"
                                            ToolTip="Database Name is Required"
                                            ValidationGroup="validateSave" Font-Size="Medium">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="modalFieldsLabel">
                                        <asp:Label
                                            runat="server"
                                            ID="Label8"
                                            CssClass="rdfLabel rdfBlock"
                                            Text="Port:">
                                        </asp:Label>
                                    </td>
                                    <td class="modalFieldsObject">
                                        <input type="text" class="form-control" id="txtPort" placeholder="Port" runat="server">
                                    </td>
                                    <td style="text-align: center">
                                        <asp:RequiredFieldValidator
                                            ForeColor="Red"
                                            runat="server"
                                            ID="RequiredFieldValidator7"
                                            ControlToValidate="txtPort"
                                            ErrorMessage="*"
                                            ToolTip="Port is Required"
                                            ValidationGroup="validateSave" Font-Size="Medium">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="modalFieldsLabel">
                                        <asp:Label
                                            runat="server"
                                            ID="Label9"
                                            CssClass="rdfLabel rdfBlock"
                                            Text="System Name:">
                                        </asp:Label>
                                    </td>
                                    <td class="modalFieldsObject">
                                        <input type="text" class="form-control" id="txtSystemName" placeholder="System Name" runat="server">
                                    </td>
                                    <td style="text-align: center">
                                        <asp:RequiredFieldValidator
                                            ForeColor="Red"
                                            runat="server"
                                            ID="RequiredFieldValidator8"
                                            ControlToValidate="txtSystemName"
                                            ErrorMessage="*"
                                            ToolTip="System Name is Required"
                                            ValidationGroup="validateSave" Font-Size="Medium">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="modalFieldsLabel">
                                        <asp:Label
                                            runat="server"
                                            ID="Label1"
                                            CssClass="rdfLabel rdfBlock"
                                            Text="Assignment:">
                                        </asp:Label>
                                    </td>

                                    <td class="modalFieldsObject">
                                        <asp:DropDownList ID="cboAssignment" CssClass="form-control"
                                            AutoPostBack="False"
                                            runat="server">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: center">
                                        <asp:RequiredFieldValidator
                                            ForeColor="Red"
                                            runat="server"
                                            ID="RequiredFieldValidator9"
                                            ControlToValidate="cboAssignment"
                                            ErrorMessage="*"
                                            ToolTip="Assignment is Required"
                                            ValidationGroup="validateSave" Font-Size="Medium">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="modalFieldsLabel">
                                        <asp:Label
                                            runat="server"
                                            ID="Label10"
                                            CssClass="rdfLabel rdfBlock"
                                            Text="Remarks:">
                                        </asp:Label>
                                    </td>
                                    <td class="modalFieldsObject">
                                        <textarea class="form-control" runat="server" id="txtRemarksx" cols="40" rows="5" placeholder="Remarks"></textarea>
                                    </td>
                                </tr>
                            </table>
                            <asp:Label
                                runat="server"
                                ID="lblRequired"
                                CssClass="rdfLabel rdfBlock"
                                Text="All * fields are required." Visible="false" ForeColor="red">
                            </asp:Label>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <div class="form-group">
                        <div class="col-lg-10 col-lg-offset-2">
                            <asp:Button ID="btnUpdate" Text="Update" runat="server" CssClass="customBtn" OnClick="btnUpdate_Click" Enabled="false" ValidationGroup="validateSave" />
                            <button type="reset" class="customBtn" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!--MODAL ENDS HERE-->
</asp:Content>
