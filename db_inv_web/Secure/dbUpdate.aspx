<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dbUpdate.aspx.cs" Inherits="DatabaseInventory__Web_.Secure.dbUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        .modalFieldsLabel {
            text-align: left;
            width: 30%;
            padding-left: 20px;
            padding-bottom: 10px;
        }

        .modalFieldsObject {
            text-align: left;
            padding-bottom: 10px;
            width: 300px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!--MODAL STARTS HERE-->
    <div class="container">
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">UPDATE DETAILS</h4>
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
                                                ValidationGroup="validateSave" Font-Size="Small">
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
                                                ValidationGroup="validateSave" Font-Size="Small">
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
                                                ValidationGroup="validateSave" Font-Size="Small">
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
                                                ValidationGroup="validateSave" Font-Size="Small">
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
                                                ValidationGroup="validateSave" Font-Size="Small">
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
                                                ValidationGroup="validateSave" Font-Size="Small">
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
                                                ValidationGroup="validateSave" Font-Size="Small">
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
                                                ValidationGroup="validateSave" Font-Size="Small">
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
                                                ValidationGroup="validateSave" Font-Size="Small">
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
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <asp:Button ID="btnUpdate" Text="Update" runat="server" CssClass="btn btn-primary" OnClick="btnUpdate_Click" Enabled="false" ValidationGroup="validateSave" />
                                <button type="reset" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    </form>
</body>
</html>
